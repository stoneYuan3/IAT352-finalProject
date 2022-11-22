

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

function pullUserProfile(uid){
	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadUser&uid='+uid,
		data:{},
		dataType:'text',
		success:function(data){
			var result=JSON.parse(data);
			$('.user-basicInfo').html(result.bio);
			$('.section-userWorkDisplay').html(result.userpost);
		},
		error:function(data){
			console.log("an error happened, transaction failed");
		}
	});		
}
// function pullUserPosts(uid){
// 	$.ajax({
// 		type:'POST',
// 		url:'server/base.php?query=loadUser&uid='+uid,
// 		data:{},
// 		dataType:'text',
// 		success:function(data){
// 			$('.user-basicInfo').html(data);
// 		},
// 		error:function(data){
// 			console.log("an error happened, transaction failed");
// 		}
// 	});		
// }