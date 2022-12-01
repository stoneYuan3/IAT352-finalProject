<?php
	include('functions.php');
	$database=db_connect($dbhost,$dbuser,$dbpass,$dbname);

	if(isset($_GET['query'])){
		if(isset($_GET['userid']) && isset($_GET['category'])){
			$userid=$_GET['userid'];
			$category=$_GET['category'];

			switch($_GET['query']){
				case 'imgUpload':
					$tags=$_POST['tags'];
					$description=$_POST['des'];
					$image=$_FILES['img'];
					// echo $image['name'].' '.$tags;
					// $file_name=$_FILES[$image][0]["name"];
					// $file_tempLink=$_FILES[$image]["tmp_name"];

					$file_name=$image['name'];
					$file_tempLink=$image['tmp_name'];
					
					$tag_list=explode(',', $tags);

					$moveimage=move_uploaded_file($file_tempLink, "../uploads/images/".$file_name);
					if($moveimage){
						$query_insertPost="INSERT INTO posts(user_id,description,category,upload_time)";
						$query_insertPost.=" VALUES(?,?,?,NOW())";
						
						$stmt=$database->prepare($query_insertPost);
						$stmt->bind_param('isi',$userid,$description,$category);
						$stmt->execute();
						
						//https://www.w3schools.com/php/php_mysql_insert_lastid.asp				
						$post_id=$database->insert_id;
						// echo $post_id;
						$query_insertImg="INSERT INTO images(post_id,image_content)";
						$query_insertImg.=" VALUES(?,?)";

						$stmt=$database->prepare($query_insertImg);
						$stmt->bind_param('is',$post_id,$file_name);
						$stmt->execute();

						if(count($tag_list)>0){
							for($i=0;$i<count($tag_list);$i++){
								$tag_name=$tag_list[$i];
								$query_insertTag="INSERT INTO tags(post_id,tag_name)";
								$query_insertTag.=" VALUES(?,?)";	
								$stmt=$database->prepare($query_insertTag);
								$stmt->bind_param('is',$post_id,$tag_name);
								$stmt->execute();															
							}
						}
					}

					break;
			}
		}
	}
?>