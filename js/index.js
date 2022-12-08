$('document').ready(function(){	
	var loginID=null;
	checkLogin().done(function(data){ 	
		if(data=='not_loggedIn'){
			$('#button-index-Following').remove();
			pullIndexContent(null,null,null);
		}
		else{
			loginID=data;
			$(button_follow_indexPage).insertAfter('#button-index-Articles');
			pullIndexContent(null,null,loginID);

			$('#button-index-Following').click(function(){
				$('#button-index-Following').addClass('selected');
			    $('#button-index-All').removeClass('selected');
			    $('#button-index-Images').removeClass('selected');
			    $('#button-index-Articles').removeClass('selected');

			    pullIndexContent('follow',loginID);
			});
		}
		console.log(loginID);

		$('#button-index-FilterBy').click(function(){
			var keyword=$('#input-filter').val();
			pullIndexContent('tag',keyword,loginID);	
		});

		$('#button-index-All').click(function(){
		    $('#button-index-All').addClass('selected');
		    $('#button-index-Images').removeClass('selected');
		    $('#button-index-Articles').removeClass('selected');
		    if($('#button-index-Following').length>0){
		    	$('#button-index-Following').removeClass('selected');
		    }	
		    pullIndexContent(null,null,loginID);
		});
		$('#button-index-Images').click(function(){
		    $('#button-index-Images').addClass('selected');
		    $('#button-index-All').removeClass('selected');
		    $('#button-index-Articles').removeClass('selected');
		    if($('#button-index-Following').length>0){
		    	$('#button-index-Following').removeClass('selected');
		    }		
		    pullIndexContent('image',null,loginID);		
		});
		$('#button-index-Articles').click(function(){
		    $('#button-index-Articles').addClass('selected');
		    $('#button-index-All').removeClass('selected');
		    $('#button-index-Images').removeClass('selected');	
		    if($('#button-index-Following').length>0){
		    	$('#button-index-Following').removeClass('selected');
		    }
		    pullIndexContent('articles',null,loginID);			
		});

	});

});