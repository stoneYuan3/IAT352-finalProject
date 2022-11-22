

function pullIndexContent(){
	$.ajax({
		type:'POST',
		url:'server/base.php?query=loadIndex',
		data:{},
		dataType:'text',
		success:function(data){
			$('.section-userWorkDisplay').html(data);
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
			$('.user-basicInfo').html(data);
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