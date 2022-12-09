$('document').ready(function(){	
	var filter=null;
	var tag=null;	
	var loginID=null;

	checkLogin().done(function(data){ 	
		if(data=='not_loggedIn'){
			loginID=null;
			$('#button-index-Following').remove();
			pullIndexContent(filter,tag,loginID);
		}
		else{
			loginID=data;
			$(button_follow_indexPage).insertAfter('#button-index-Articles');
			pullIndexContent(filter,tag,loginID);

			$('#button-index-Following').click(function(){
				filter='follow';
				$('#button-index-Following').addClass('selected');
			    $('#button-index-All').removeClass('selected');
			    $('#button-index-Images').removeClass('selected');
			    $('#button-index-Articles').removeClass('selected');
			    pullIndexContent(filter,tag,loginID);
			});
		}
		console.log(loginID);

		$('#button-index-FilterBy').click(function(){
			var keyword=$('#input-filter').val();
			tag=keyword;
			pullIndexContent(filter,tag,loginID);	
		});

		$('#button-index-All').click(function(){
			filter=null;
			tag=null;	
		    $('#button-index-All').addClass('selected');
		    $('#button-index-Images').removeClass('selected');
		    $('#button-index-Articles').removeClass('selected');
		    if($('#button-index-Following').length>0){
		    	$('#button-index-Following').removeClass('selected');
		    }	
		    $('#input-filter').val('');
		    pullIndexContent(filter,tag,loginID);
		});
		$('#button-index-Images').click(function(){
			filter='images';
		    $('#button-index-Images').addClass('selected');
		    $('#button-index-All').removeClass('selected');
		    $('#button-index-Articles').removeClass('selected');
		    if($('#button-index-Following').length>0){
		    	$('#button-index-Following').removeClass('selected');
		    }		
		    pullIndexContent(filter,tag,loginID);		
		});
		$('#button-index-Articles').click(function(){
			filter='articles';
		    $('#button-index-Articles').addClass('selected');
		    $('#button-index-All').removeClass('selected');
		    $('#button-index-Images').removeClass('selected');	
		    if($('#button-index-Following').length>0){
		    	$('#button-index-Following').removeClass('selected');
		    }
		    pullIndexContent(filter,tag,loginID);			
		});

	});

});