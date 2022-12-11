function checkLogin(){
	return $.ajax({
		type:'POST',
		url:'server/checkLogin.php?query=checkLogin',
		data:{},
		dataType:'text'
	});
}
function checkFollowStatus(userid,targetUid){
	return $.ajax({
		type:'POST',
		url:'server/follow.php?query=checkFollow&follower='+userid+'&followtarget='+targetUid,
		data:{},
		dataType:'text'
	});	
}
function checkCollectionStatus(userid,targetPost){
	return $.ajax({
		type:'POST',
		url:'server/base.php?query=checkCollection&userid='+userid+'&targetPost='+targetPost,
		data:{},
		dataType:'text'
	});		
}
function pullUserInfo(userid){
	return $.ajax({
		type:'POST',
		url:'server/checkLogin.php?query=pullUserInfo&userid='+userid,
		data:{},
		dataType:'text'			
	});	
}
function adjustNavigation(userid){
	var data=userid;
	if(data=='not_loggedIn'){
		$('.nav-userProfile').addClass('hidden');
		$('.nav-login').removeClass('hidden');	
	}
	else{
		//preparing the navigation bar: show user profile, hide login, show newpost button
		$('.nav-userProfile').removeClass('hidden');
		$('.nav-login').addClass('hidden');	
		$('.button-nav-newPost').attr('href','upload-image.html?userid='+userid);

		//pull the avatar of this user and use it for the nav bar avatar icon
		pullUserInfo(userid).done(function(data){
			var result=JSON.parse(data);
			$('.button-nav-profile img').attr('src','uploads/images/'+result.avatar);
		});
		pullUserInfo(userid).fail(function(data){
			console.log(data);
		});
		//sometimes mutiple logout button are inserted because in some cases the page check login for mutiple time...
		if($('#logout').length==0){
			$('<button id="logout">Log out</button>').insertAfter('.button-nav-newPost');
		}
		//set profile link for the avatar icon on nav
		$('.button-nav-profile').attr('href','user-profile.html?userid='+data);		
		$('#logout').click(function(){
			$.ajax({
				type:'POST',
				url:'server/checkLogin.php?query=logout',
				data:{},
				success:function(data){
					window.location.replace("index.html");
				},
				error:function(data){
					console.log("an error happened, logout failed");
				}
			});
		})							
	}
}

var button_follow=`
 <button id="button-index-Following" class="selected" type="follow" value="follow"><strong>Follow</strong></button>
`;
var button_follow_indexPage=`
<button id="button-index-Following" type="button"><strong>Following</strong></button>
`;
var button_cancelFollow=`
 <button id="button-cancelFollowing" class="selected"><strong>Cancel</strong></button>
`;
//pullIndexContent() pull all posts from the backend and display them. it only affect contents within .section-userWorkDisplay. it does not change anything for the Explore section. it does not deal with filters
function pullIndexContent(filterBy,keyword,loginID){
	//prepare ajax link
	var link='server/base.php?query=loadIndex';
	var filter='&filter=none';
	var tag='&tag=none';
	switch(filterBy){
		case 'images':
			filter='&filter=images';
			break;
		case 'articles':
			filter='&filter=articles';
			break;	
		case 'follow':
			if(loginID!=null){ filter='&filter=follow&user='+loginID; }
			else{ console.log('why are you even here,you are not even logged in') }
			break;				
		default:
			link='server/base.php?query=loadIndex';
			break;
	}
	link+=filter;
	if(loginID!=null){
		link+='&loginID='+loginID;
	}	
	if(keyword!=null){
		tag='&tag='+keyword;
		link+=tag;
	}
	console.log(link);
	$.ajax({
		type:'POST',
		url:link,
		data:{},
		dataType:'text',
		success:function(data){
			var result=JSON.parse(data);		
			$('.all').html(result);
			//enable functions for the collection button only when user is logged in
			if(loginID!=null){
				addto_Collection(loginID);
			}		
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});	
}

//pull user profile and their posts
function pullUserProfile(uid,type,loginID){

	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadUser&uid='+uid+'&type='+type,
		data:{},
		dataType:'text',
		success:function(data){
			//this part take the user profile interface from backend and insert into frontend
			var result=JSON.parse(data);
			$('.user-basicInfo').html(result.bio);	
			//this part edit the title for collection according to this user's name
			var user_name=$('.section-userInfo-text h1').html();
			$('.select-collect').html(user_name+'\'s Collection');

			// this part check if the user is logged in and whether this profile is owned by the member, remove follow button if true
			var userid=loginID;
			if(userid==null){
				$('#button-index-Following').remove();
			}
			else if(userid==uid){
				console.log('logged in as the owner of this profile');
				$('#button-index-Following').remove();

				//this part handles the profile edit feature. when user clicks the edit button, spawn the whole edit form and insert into the page as an overlay.
				$('<button id="profile-edit">Edit Profile</button>').insertAfter('.follower');
				$('#profile-edit').click(function(){
					var form_edit=`
						<div class="flex section-form-edit">
							<form method="POST" class="flex flex-column" id="form-editProfile">
								<div class="flex flex-row form-titlebar">
									<h1>Edit Profile</h1>
									<a id="form-quit">Cancel</a>
								</div>
						        <div class="flex flex-column upload-image-box">
						        	<label for="avatar">Update Avatar</label>
						            <input type="file" id="avatar" name="img" accept="image/*" >
						        </div>

						        <div class="flex flex-column upload-image-box">
						        	<label for="cover">Update Album Cover</label>
						            <input type="file" id="cover" name="img" accept="image/*" >
						        </div>

						        <label for="user_name">Update User Name</label>
						        <input type="text" id="user_name">

						        <!--<label for="user_email">Update Email</label>
						        <input type="text" id="user_email">-->

						        <button id="button-work-upload" class="selected" value="submit" type="submit"><strong>Submit</strong></button>
							</form>
						</div>
					`;
					$(form_edit).insertAfter('body');
					$('#form-quit').click(function(){
						$('.section-form-edit').remove();
					});
					$('#form-editProfile').submit(function(event){
						event.preventDefault();
						console.log('submitted');
						var editList=new FormData();
						//assign form elements to variables, check them later
						var avatar=$('#avatar').prop('files')[0];
						var album=$('#cover').prop('files')[0];
						var username=$('#user_name').val();
						var userEmail=$('#user_email').val();
						//organize those form inputs into an array. organize their name into another array. use a for loop to append those variables to data
						var listof_editOption=[avatar,album,username,userEmail];
						var list_name=['avatar','cover','name','email'];
						var formComplete=false;
						for(let i=0;i<listof_editOption.length;i++){
							//append only when the variable is not empty
							if(listof_editOption[i]){
								editList.append(list_name[i],listof_editOption[i]);
								formComplete=true;
							}
						}
						//send to backend if at least one form input is filled
						if(formComplete){
							var editSubmit=$.ajax({
								type:'POST',
								url:'server/upload.php?query=editProfile&userid='+userid,
								data:editList,
								dataType:'text',
	              				contentType: false,
              					processData: false,
              				});
              				editSubmit.done(
              					function(data){
									if(data=='success'){
										console.log('edit success');
										pullUserProfile(uid,type,loginID);
										adjustNavigation(loginID);
										$('.section-form-edit').remove();
									}
									else{
										console.log('edit failed');
										console.log(data);
									}
								}
							);									
						}
						else{
		       				 $('<p class="style-warning">You haven\'t change anything.</p>').insertBefore('#button-work-upload');
						}
					});
				});

			}
			//if user is not logged in, or if user dont own this profile, leave following button as it is and do this once it is clicked
			else{
				//this part check if the target user is already been followed by the viewer
				//checkFollowStatus() stores the ajax call that asks backend to compare the target user id and the viewer id and check if a following relationship already exists
				checkFollowStatus(userid,uid).done(function(data){
					//if exists, give user option to cancel follow
					if(data=='followed'){
						$('#button-index-Following').remove();
						$('<p>Already<br>Following</p>').insertAfter('#profile-avatar');	
						$(button_cancelFollow).insertAfter('.section-bio-left p');
						//process once user click cancel follow
						$('#button-cancelFollowing').click(function(){
							$.ajax({
								type:'POST',
								url:'server/follow.php?query=cancelFollow&follower='+userid+'&followtarget='+uid,
								data:{},
								dataType:'text',
								success:function(data){
									if(data=='success'){
										console.log('cancel success');
										//reload user profile once canceled
										pullUserProfile(uid,type,loginID)
									}
									else{
										console.log('cancel failed');
									}
								},
								error:function(data){
									console.log("an error happened, follow user failed");
								}										
							});
						});
					}
				});	
				//if user havent follow the target user yet and they clicked the follow button, do this:					
				$('#button-index-Following').click(function(){
					//follow this user
					$.ajax({
						type:'POST',
						url:'server/follow.php?query=registerFollow&follower='+userid+'&followtarget='+uid,
						data:{},
						dataType:'text',
						success:function(data){
							if(data=='success'){
								console.log('follow success');
								//reload user profile once followed
								pullUserProfile(uid,type,loginID);
							}
							else{
								console.log('follow failed');
							}

						},
						error:function(data){
							console.log("an error happened, follow user failed");
						}								
					});					
				});	
			}
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});		
}
//this function pull user's post
function pullUserWork(uid,type,loginID,filterBy,keyword){
	//prepare ajax link based on received filter conditions
	var link='server/base.php?query=loadUser&uid='+uid+'&type='+type;
	var filter='&filter=none';
	var tag='&tag=none';
	switch(filterBy){
		case 'images':
			filter='&filter=images';
			break;
		case 'articles':
			filter='&filter=articles';
			break;	
		default:
			link='server/base.php?query=loadUser&uid='+uid+'&type='+type;
			break;
	}
	link+=filter;
	if(loginID!=null){
		link+='&loginID='+loginID;
	}	
	if(keyword!=null){
		tag='&tag='+keyword;
		link+=tag;
	}
	console.log(link);
	$.ajax({
		type:'POST',
		url:link,
		data:{},
		dataType:'text',
		success:function(data){
			//receive json from php, parse it, insert into different html sections
			var result=JSON.parse(data);
			$('.all').html(result.userpost);
			//enable collection feature if user is logged in
			if(loginID!=null){
				addto_Collection(loginID);
			}				
		},
		error:function(data){
			console.log("an error happened, pullUserWork failed");
		}
	});		
}

//pull post detail for post detail page
function pullPostDetail(post,loginID){
	var link='server/base.php?query=loadPostDetail&post='+post;
	if(loginID!=null){
		link+='&loginID='+loginID;
	}	
	$.ajax({
		type:'POST',
		url:link,
		data:{},
		dataType:'text',

		success:function(data){
			var result=JSON.parse(data);
			//data is parsed as a json object that has the HTML layout for main contents, tag lists and comment lists as three arrays in backedn
			//insert them to their rightful place
			$('.section-detail-mainContent').html(result.main);
			$('.tags').html(result.tag);
			$('.all-comment').html(result.comment);
			//hide comment section if not logged in
			if(loginID==null){
				$('#section-comment-send').addClass('hidden');
			}
			//if logged in, activate the collection feature with the function addto_Collection()
			else{	
				var userid=loginID;
				if(userid==result.uploader){
					$('#section-comment-send').addClass('hidden');
					addto_Collection(loginID);
				}
				else{
					$('#section-comment-send').removeClass('hidden');
					addto_Collection(loginID);
				}	
			}
	
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});	
}
//this function is self sufficient, deal with everything needed for add/remove collection (both frontend style changes and backend reactions)
function addto_Collection(userid){
	//if the heart button is collected
	$('.button-post-collect').click(function(){
		var post_id=$(this).attr('name');
		//if already collected,remove upon click
		if($(this).hasClass('collected')){
			//style change
			console.log('remove post '+post_id+" as user "+userid);
			$(this).children('img').attr('src','img/icon-like.svg');
			$(this).removeClass('collected');
			//call backend
			$.ajax({
				type:'POST',
				url:'server/base.php?query=removeCollection&post='+post_id+'&user='+userid,
				data:{},
				dataType:'text',
				success:function(data){
					if(data=='success'){
						console.log(data);
						console.log('remove collection success');
					}
					else{
						console.log(data);
						console.log('remove collection failed');
					}
				},
				error:function(data){
					console.log("an error happened, transaction failed");
				}				
			});
		}
		//if not collected, add to collection upon click
		else{
			//style change
			console.log('add post '+post_id+" as user "+userid);
			$(this).children('img').attr('src','img/icon-like-liked.svg');
			$(this).addClass('collected');
			//call backend
			$.ajax({
				type:'POST',
				url:'server/base.php?query=addCollection&post='+post_id+'&user='+userid,
				data:{},
				dataType:'text',
				success:function(data){
					if(data=='success'){
						console.log(data);
						console.log('add collection success');
					}
					else{
						console.log(data);
						console.log('add collection failed');
					}
				},
				error:function(data){
					console.log("an error happened, transaction failed");
				}							
			});			
		}			
	});
}

//adjust navigation bar based on login status, apply to all pages
checkLogin().done(function(data){	
	if(data=='not_loggedIn'){
		console.log('not login');
	}
	else{
		console.log('login as '+ data);
	}
	$('document').ready(function(){
		adjustNavigation(data);
	});	
});
checkLogin().fail(function(data){
	console.log(data);
});
