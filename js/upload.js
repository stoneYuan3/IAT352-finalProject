$('document').ready(function(){
  	const urlParams = new URLSearchParams(window.location.search);
	const uid = urlParams.get('userid');
	console.log('post by '+uid);  

	var category=1;	

	$('.upload').submit(function(event){
		$('.style-warning').remove();
		event.preventDefault();

		//in case of uploading an image, serializeArray() does not work. instead, use FormData
		//src:
		//https://makitweb.com/how-to-upload-image-file-using-ajax-and-jquery/
		//https://stackoverflow.com/questions/44283986/how-to-upload-an-image-through-jquery
		//https://stackoverflow.com/questions/17834243/how-to-read-formdata-object-in-php
		//https://stackoverflow.com/questions/12281775/get-data-from-file-input-in-jquery

		//var data=new FormData($(this)[0]);
		var data=new FormData();
		var image=$('#img').prop('files')[0];
		var formComplete=true;
		// var imgUpload=$('#img')[0].files;
		if(!image){
			formComplete=false;
			console.log('no image uploaded');
			$('<p class="style-warning">Please upload image</p>').insertBefore('.upload-image-box');
		}

		if(formComplete){
			data.append('img',image);
			data.append('tags',$('#tags').val());
			data.append('des',$('#des').val());			
			var request=$.ajax({
				type:'POST',
				url:'server/upload.php?query=imgUpload&userid='+uid+'&category='+category,
				data:data,	
              	contentType: false,
              	processData: false,							
			});
			request.done(function(data){
				//
				// console.log('post id is '+data);
				window.location.replace("index.html");
			})
		    request.fail(function(data){
		        $('<p class="style-warning">Error, failed</p>').insertBefore('.bottom');
		    });			
		}

	});

});