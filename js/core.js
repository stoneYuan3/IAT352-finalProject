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
		if(data=='not_loggedIn'){
			$('.nav-userProfile').addClass('hidden');
			$('.nav-login').removeClass('hidden');
			if($('#button-index-Following').length>0){
				$('#button-index-Following').addClass('hidden');
			}
		}
		else{
			$('.nav-userProfile').removeClass('hidden');
			$('.nav-login').addClass('hidden');	
			if($('#button-index-Following').length>0){
				$('#button-index-Following').removeClass('hidden');
			}							
		}		
	});
    request.fail(function(msg){
        console.log("error", msg);
    });	
	// return request;
}

// function checkLogin_nav(request){
// 	request.done(function(data){
// 		console.log(data);
// 		if(data=='not_loggedIn'){
// 			$('.nav-userProfile').addClass('hidden');
// 			$('.nav-login').removeClass('hidden');
// 		}
// 		else{
// 			$('.nav-userProfile').removeClass('hidden');
// 			$('.nav-login').addClass('hidden');					
// 		}		
// 	});
//     request.fail(function(msg){
//         console.log("error", msg);
//     });	
// }
// function checkLogin_index(request){
// 	request.done(function(data){
// 		console.log(data);
// 		if(data=='not_loggedIn'){
// 			$('#button-index-Following').addClass('hidden');
// 		}
// 		else{
// 			$('#button-index-Following').removeClass('hidden');				
// 		}		
// 	});
//     request.fail(function(msg){
//         console.log("load index error ", msg);
//     });	
// }

function pullIndexContent(){
	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadIndex',
		data:{},
		dataType:'text',
		success:function(data){
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