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
function adjustNavigation(userid){
	var data=userid;
	if(data=='not_loggedIn'){
		$('.nav-userProfile').addClass('hidden');
		$('.nav-login').removeClass('hidden');	
	}
	else{
		//preparing the navigation bar
		$('.nav-userProfile').removeClass('hidden');
		$('.nav-login').addClass('hidden');	
		$('.button-nav-newPost').attr('href','upload-image.html?userid='+userid);		
		if($('#logout').length==0){
			$('<button id="logout">Log out</button>').insertAfter('.button-nav-newPost');
		}
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
var button_cancelFollow=`
 <button id="button-cancelFollowing" class="selected"><strong>Cancel</strong></button>
`;
function pullIndexContent(){
	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadIndex',
		data:{},
		dataType:'text',
		success:function(data){
			checkLogin();
			var result=JSON.parse(data);		
			$('.section-userWorkDisplay').html(result);
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});	
}

function pullUserProfile(uid,type){
	// console.log('run');
	// console.log(type);
	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadUser&uid='+uid+'&type='+type,
		data:{},
		dataType:'text',
		success:function(data){
			//receive json from php, parse it, insert into different html sections
			var result=JSON.parse(data);
			$('.user-basicInfo').html(result.bio);	
			//check if logged in and adjust user profile page accordingly
			checkLogin().done(function(data){ 
				if(data=='not_loggedIn'){
					$('#button-index-Following').remove();
				}
				else{
					//check if the profile is owned by the member, remove follow button if true
					var userid=data;
					if(userid==uid){
						console.log('logged in as the owner of this profile');
						$('#button-index-Following').remove();
					}
					else{
						//check if this user is already been followed
						checkFollowStatus(userid,uid).done(function(data){
							if(data=='followed'){
								$('#button-index-Following').remove();
								$('<p>Already<br>Following</p>').insertAfter('#profile-avatar');	
								$(button_cancelFollow).insertAfter('.section-bio-left p');
								$('#button-cancelFollowing').click(function(){
									$.ajax({
										type:'POST',
										url:'server/follow.php?query=cancelFollow&follower='+userid+'&followtarget='+uid,
										data:{},
										dataType:'text',
										success:function(data){
											if(data=='success'){
												console.log('cancel success');
												// window.location.replace("index.html");
												pullUserProfile(uid,type)
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
										pullUserProfile(uid,type);
										// $('#button-index-Following').remove();
										// $('<p>Already Following</p>').insertAfter('#profile-avatar');
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
				}
			});
			checkLogin().fail(function(data){
				console.log(data);
			});
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});		
}
function pullUserWork(uid,type){
	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadUser&uid='+uid+'&type='+type,
		data:{},
		dataType:'text',
		success:function(data){
			checkLogin();
			//receive json from php, parse it, insert into different html sections
			var result=JSON.parse(data);
			$('.section-userWorkDisplay').html(result.userpost);
		},
		error:function(data){
			console.log("an error happened, pullUserWork failed");
		}
	});		
}
function pullPostDetail(post){
	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadPostDetail&post='+post,
		data:{},
		dataType:'text',
		success:function(data){

			var result=JSON.parse(data);
			$('.section-detail-mainContent').html(result.main);
			$('.tags').html(result.tag);
			$('.all-comment').html(result.comment);

			checkLogin().done(function(data){ 
				console.log(data);
				if(data=='not_loggedIn'){
					$('#section-comment-send').addClass('hidden');
				}
				else{	
					var userid=data;
					if(userid==result.uploader){
						$('#section-comment-send').addClass('hidden');
					}
					else{
						$('#section-comment-send').removeClass('hidden');
					}	
				}
			});
			checkLogin().fail(function(data){
				console.log(data);
			});
			//receive json from php, parse it, insert into different html sections
	
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});	
}


checkLogin().done(function(data){	
	if(data=='not_loggedIn'){
		console.log('not login');
		// $('#section-comment-send').addClass('hidden');
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
