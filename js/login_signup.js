
$('document').ready(function(){

	$('.signup-area').submit(function(event){
		$('.style-warning').remove();
		event.preventDefault();
        var data = $(this).serializeArray();
        data.push({name: "request_type", value: "register"});
        console.log('submit');	
        console.log(data);	
        // console.log(data[1]['name']);

        var signUpRequest=$.ajax({
			type:'POST',
			url:'server/checkLogin.php?query=signUp',
			data:data,
			// dataType:'text'
        });

        var formComplete=true;
       	var password=data[2];
       	var password_confirm=data[3];
        for(let i=0;i<data.length;i++){
        	if(!data[i]['value']){
        		// console.log(data[i]['name']+' is empty')
        		$('<p class="style-warning">Please fill this section</p>').insertBefore('#'+data[i]['name']);
        		formComplete=false;
        	}
        }
        if(password['value']!=password_confirm['value']){
        	$('<p class="style-warning">Password doesn\'t match </p>').insertBefore('#'+password['name']);
        	$('<p class="style-warning">Password doesn\'t match </p>').insertBefore('#'+password_confirm['name']);
        	formComplete=false;
        }
        if(formComplete){

        }
	});

});