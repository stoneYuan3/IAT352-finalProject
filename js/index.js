$('document').ready(function(){
	pullIndexContent();

	checkLogin().done(function(data){ 
		if(data=='not_loggedIn'){
			$('#button-index-Following').remove();
		}
		else{
			var userid=data;
			$(button_follow_indexPage).insertAfter('#button-index-Articles');
			$('#button-index-Following').click(function(){
				console.log('foll');
				$('#button-index-Following').addClass('selected');
			    $('#button-index-All').removeClass('selected');
			    $('#button-index-Images').removeClass('selected');
			    $('#button-index-Articles').removeClass('selected');

			    $.ajax({
			    	type:'POST',
			    	url:'server/base.php?query=loadIndex&filter=follow&user='+userid,
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
		}
	});


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
	    $('#button-index-All').addClass('selected');
	    $('#button-index-Images').removeClass('selected');
	    $('#button-index-Articles').removeClass('selected');
	    if($('#button-index-Following').length>0){
	    	$('#button-index-Following').removeClass('selected');
	    }	
	});
	$('#button-index-Images').click(function(){
	    $('#button-index-Images').addClass('selected');
	    $('#button-index-All').removeClass('selected');
	    $('#button-index-Articles').removeClass('selected');
	    if($('#button-index-Following').length>0){
	    	$('#button-index-Following').removeClass('selected');
	    }		    		
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
	    $('#button-index-Articles').addClass('selected');
	    $('#button-index-All').removeClass('selected');
	    $('#button-index-Images').removeClass('selected');	
	    if($('#button-index-Following').length>0){
	    	$('#button-index-Following').removeClass('selected');
	    }		    	
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