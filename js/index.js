$('document').ready(function(){
	pullIndexContent();
	
	$('#button-index-FilterBy').click(function(){
		var keyword=$('#input-filter').val();
		$.ajax({
			type:'POST',
			url:'server/base.php?query=loadIndex&tag='+keyword,
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
	});

	$('#button-index-All').click(function(){
		pullIndexContent();
	});
	$('#button-index-Images').click(function(){
		$.ajax({
			type:'POST',
			url:'server/base.php?query=loadIndex&filter=images',
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
	});
	$('#button-index-Articles').click(function(){
		$.ajax({
			type:'POST',
			url:'server/base.php?query=loadIndex&filter=articles',
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
	});

});