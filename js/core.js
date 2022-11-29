function checkLogin(){
	var request=$.ajax({
		type:'POST',
		url:'server/checkLogin.php?query=checkLogin',
		data:{},
		dataType:'text'
	});

	request.done(function(data){
		console.log(data);
		console.log($('#button-index-Following').length>0);
		var hasFollowFeature;
		var hasCommentFeature;
		if($('#button-index-Following').length>0){
			hasFollowFeature=true;
		}
		if($('#section-comment-send').length>0){
			hasCommentFeature=true;
		}
		if(data=='not_loggedIn'){
			$('.nav-userProfile').addClass('hidden');
			$('.nav-login').removeClass('hidden');
			if(hasFollowFeature){
				$('#button-index-Following').addClass('hidden');
			}
			if(hasCommentFeature){
				$('#section-comment-send').addClass('hidden');
			}			
		}
		else{
			$('.nav-userProfile').removeClass('hidden');
			$('.nav-login').addClass('hidden');	
			if(hasFollowFeature){
				$('#button-index-Following').removeClass('hidden');
				//TBD, do something when user uses
			}	
			if(hasCommentFeature){
				$('#section-comment-send').removeClass('hidden');
				//TBD, do something when user uses
			}										
		}		
	});
    request.fail(function(msg){
        console.log("error", msg);
    });	
}

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
	console.log('run');
	console.log(type);
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

$('document').ready(function(){
	checkLogin();
})