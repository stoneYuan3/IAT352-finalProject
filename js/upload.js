
var form_post_image=`
            <div class="flex upload-image-box">
                <input type="file" id="img" name="img" accept="image/*" >
            </div>

            <h3>Tags</h3>
            <input class="upload-tag" type="tags" id="tags" name="tags" placeholder="seperate each tag by ,">

            <h3>Descriptions</h3>
            <textarea class="upload-des-box" type="des" id="des" name="des" rows="5" cols="100"></textarea>

            <section class="bottom">
                <button id="button-work-upload" class="selected" value="submit" type="submit"><strong>Submit</strong></button>
            </section>
`;
var form_post_article=`
            <h3>Tags</h3>
			<input class="upload-tag" type="tags" id="tags" name="tags" placeholder="seperate each tag by ," autocomplete="off">
            <h3>Descriptions</h3>
            <textarea class="upload-des-box" type="des" id="des" name="des" rows="5" cols="100"></textarea>

            <section class="bottom">
                <button class ="selected" type="submit" value="submit"><strong>Submit</strong></button>
            </section>
`;

$('document').ready(function(){
  	const urlParams = new URLSearchParams(window.location.search);
	const uid = urlParams.get('userid');
	console.log('post by '+uid);  

	var category=1;	
	//swap form layout when user asks so
	$('#post_image').click(function(event){
		category=1;
		$('#form-newpost').html(form_post_image);
		$('#post_image').addClass('select-page');
		$('#post_image').removeClass('unselect-page');
		$('#post_article').addClass('unselect-page');
		$('#post_article').removeClass('select-page');	
	});
	$('#post_article').click(function(event){
		category=2;
		$('#form-newpost').html(form_post_article);
		$('#post_image').addClass('unselect-page');
		$('#post_image').removeClass('select-page');
		$('#post_article').addClass('select-page');
		$('#post_article').removeClass('unselect-page');		
	});

	$('#form-newpost').submit(function(event){
		$('.style-warning').remove();
		event.preventDefault();
		//in case of uploading an image, serializeArray() does not work. instead, use FormData
		//src:
		//https://makitweb.com/how-to-upload-image-file-using-ajax-and-jquery/
		//https://stackoverflow.com/questions/44283986/how-to-upload-an-image-through-jquery
		//https://stackoverflow.com/questions/17834243/how-to-read-formdata-object-in-php
		//https://stackoverflow.com/questions/12281775/get-data-from-file-input-in-jquery
		var data=new FormData();
		//check if form complete
		var formComplete=true;
		if(category==1){
			var image=$('#img').prop('files')[0];
			if(!image){
				formComplete=false;
				console.log('no image uploaded');
				$('<p class="style-warning">Please upload image</p>').insertBefore('.upload-image-box');
			}
		}
		else{
			if($('.upload-des-box').val()==""){
				formComplete=false;
				console.log('no text typed');
				$('<p class="style-warning">Please type something</p>').insertBefore('.upload-des-box');
			}
		}
		//send to backend
		if(formComplete){
			var link;
			if(category==1){
				link='server/upload.php?query=imgUpload&userid='+uid+'&category='+category;
				data.append('img',image);
			}
			else{
				link='server/upload.php?query=textUpload&userid='+uid+'&category='+category;				
			}
			data.append('tags',$('#tags').val());
			data.append('des',$('#des').val());	

			var request=$.ajax({
				type:'POST',
				url:link,
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