




$('document').ready(function(){

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

});