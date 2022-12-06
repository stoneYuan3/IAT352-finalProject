function checkLogin(){
	return $.ajax({
		type:'POST',
		url:'server/checkLogin.php?query=checkLogin',
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
// 	request.done(function(data){
// 		console.log(data);
// 		var userid=data;
// 		console.log($('#button-index-Following').length>0);
// 		var hasFollowFeature=false;
// 		var hasCommentFeature=false;
// 		if($('#button-index-Following').length>0){
// 			hasFollowFeature=true;
// 		}
// 		if($('#section-comment-send').length>0){
// 			hasCommentFeature=true;
// 		}
		// if(data=='not_loggedIn'){
		// 	$('.nav-userProfile').addClass('hidden');
		// 	$('.nav-login').removeClass('hidden');
		// 	if(hasFollowFeature){
		// 		$('#button-index-Following').addClass('hidden');
		// 	}
		// 	if(hasCommentFeature){
		// 		$('#section-comment-send').addClass('hidden');
		// 	}			
		// }
		// else{
		// 	//preparing the navigation bar
		// 	$('.nav-userProfile').removeClass('hidden');
		// 	$('.nav-login').addClass('hidden');	
		// 	$('.button-nav-newPost').attr('href','upload-image.html?userid='+userid);		
		// 	if($('#logout').length==0){
		// 		$('<button id="logout">Log out</button>').insertAfter('.button-nav-newPost');
		// 	}
		// 	$('.button-nav-profile').attr('href','user-profile.html?userid='+data);
		// 	// if(hasFollowFeature){
		// 		// $('#button-index-Following').removeClass('hidden');
		// 		//TBD, do something when user uses
		// 	// }	
		// 	if(hasCommentFeature){
		// 		$('#section-comment-send').removeClass('hidden');
		// 		//TBD, do something when user uses
		// 	}			
		// 	$('#logout').click(function(){
		// 		$.ajax({
		// 			type:'POST',
		// 			url:'server/checkLogin.php?query=logout',
		// 			data:{},
		// 			success:function(data){
		// 				window.location.replace("index.html");
		// 			},
		// 			error:function(data){
		// 				console.log("an error happened, logout failed");
		// 			}
		// 		});
		// 	})							
		// }		
// 	});
//     request.fail(function(msg){
//         console.log("error", msg);
//     });	
// }

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
			checkLogin();
			//receive json from php, parse it, insert into different html sections
			var result=JSON.parse(data);
			$('.user-basicInfo').html(result.bio);
			$('.section-userWorkDisplay').html(result.userpost);
		},
		error:function(data){
			console.log("an error happened, transaction failed");
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
			checkLogin();
			//receive json from php, parse it, insert into different html sections
			var result=JSON.parse(data);
			$('.section-detail-mainContent').html(result.main);
			$('.tags').html(result.tag);
			$('.all-comment').html(result.comment);
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});	
}

var isLoggedin=true;
checkLogin().done(function(data){	
	if(data=='not_loggedIn'){
		isLoggedin=false;
		console.log('not login');
	}
	else{
		isLoggedin=true;
		console.log('login as '+ data);
	}
	$('document').ready(function(){
		adjustNavigation(data);
	});	
});
checkLogin().fail(function(data){
	console.log(data);
});
