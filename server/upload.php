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

				case 'textUpload':
					$tags=$_POST['tags'];
					$description=$_POST['des'];
					$tag_list=explode(',', $tags);

					$query_insertPost="INSERT INTO posts(user_id,description,category,upload_time)";
					$query_insertPost.=" VALUES(?,?,?,NOW())";
					
					$stmt=$database->prepare($query_insertPost);
					$stmt->bind_param('isi',$userid,$description,$category);
					$stmt->execute();	

					if(count($tag_list)>0){
						$post_id=$database->insert_id;
						for($i=0;$i<count($tag_list);$i++){
							$tag_name=$tag_list[$i];
							$query_insertTag="INSERT INTO tags(post_id,tag_name)";
							$query_insertTag.=" VALUES(?,?)";	
							$stmt=$database->prepare($query_insertTag);
							$stmt->bind_param('is',$post_id,$tag_name);
							$stmt->execute();				
						}
					}

					break;
			}	
		}

		if($_GET['query']='editProfile'){
			if(isset($_GET['userid'])){
				$userid=$_GET['userid'];
				// $avatar=null;
				// $cover=null;
				// $name=null;
				// $email=null;
				// $listof_edit=[];
				$success=false;
				if(isset($_FILES['avatar'])){ 
					$avatar=$_FILES['avatar'];
					$file_name=$avatar['name'];
					$file_tempLink=$avatar['tmp_name'];
					$moveimage=move_uploaded_file($file_tempLink, "../uploads/images/".$file_name);		
					if($moveimage){
						$query="UPDATE users SET avatar = '".$file_name."' WHERE user_id = ".$userid;
						$result=$database->query($query);
						if($result){$success=true;}
					}					 
				}
				if(isset($_FILES['cover'])){ 
					$cover=$_FILES['cover']; 
					$file_name=$cover['name'];
					$file_tempLink=$cover['tmp_name'];
					$moveimage=move_uploaded_file($file_tempLink, "../uploads/images/".$file_name);		
					if($moveimage){
						$query="UPDATE users SET album_cover = '".$file_name."' WHERE user_id = ".$userid;
						$result=$database->query($query);
						if($result){$success=true;}
					}									
				}
				if(isset($_POST['name'])){ 
					$name=$_POST['name']; 
					$query="UPDATE users SET user_name = '".$name."' WHERE user_id = ".$userid;
					$result=$database->query($query);
					if($result){$success=true;}					
				}
				if(isset($_POST['email'])){ 
					$email=$_POST['email'];
					$query="UPDATE users SET email = '".$email."' WHERE user_id = ".$userid;
					$result=$database->query($query);
					if($result){$success=true;}						
				}

				if($success){
					echo 'success';
				}
				if(!$success){
					echo 'fail';
				}
			}
		}

	}
?>