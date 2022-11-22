

<?php
	require_once('functions.php');
	$database=db_connect($dbhost,$dbuser,$dbpass,$dbname);

	session_start();

	if(isset($_GET['query'])){

		switch($_GET['query']){
			case 'loadIndex':
				$query1="SELECT post_id from posts ORDER BY upload_time DESC LIMIT 12";
				$result1=$database->query($query1);
				$output1_arr=[];
				for($i=0;$i<$result1->num_rows;$i++){
					$output_each=$result1->fetch_row();
					array_push($output1_arr,$output_each[0]);
				}
				// print_r($output1_arr);

				$output_arr_final=[];
				for($i=0;$i<count($output1_arr);$i++){
					$id=$output1_arr[$i];
					$query2="SELECT posts.post_id,posts.category,users.avatar,users.user_name,users.user_id,posts.upload_time,images.image_content,posts.description,COUNT(collection.post_id) AS collec_num,COUNT(comments.post_id) AS comment_num FROM posts,users,images,collection,comments WHERE posts.post_id='".$id."' AND posts.user_id=users.user_id AND posts.post_id=images.post_id AND posts.post_id=collection.post_id AND posts.post_id=comments.post_id";	
					// $query3="SELECT COUNT(post_id) AS comment_num FROM comments WHERE post_id='".$id."'";	
					// print_r($query2);
					$result2=$database->query($query2);
					// $result3=$database->query($query3);
					$output2=$result2->fetch_assoc();
					// $output3=$result3->fetch_assoc();
					// $output_each=array_push($output2,$output3['comment_num']);
					array_push($output_arr_final,$output2);
				}
				// print_r($output_arr_final);
				//categolary 1 is image, 2 is pure text
				for($i=0;$i<count($output_arr_final);$i++){
					$output_each=$output_arr_final[$i];
					if($output_arr_final[$i]['category']==1){
						echo '
			                <div class="flex flex-column section-userWorkDisplay-Box">
			                    <div class="flex flex-row section-uploaderInfo">
			                        <a href="user-profile.html?userid='.$output_each['user_id'].'" class="flex flex-row flex_center_align_horizontal">
			                            <img src="uploads/images/'.$output_each['avatar'].'">
			                            <h4>'.$output_each['user_name'].'</h4>
			                        </a>
			                        <p>'.$output_each['upload_time'].'</p>
			                    </div>
			                    <div class="flex flex-column section-workdisplay">
			                        <a href="detail.html?post='.$output_each['post_id'].'">
			                            <img src="uploads/images/'.$output_each['image_content'].'">
			                        </a>
			                    </div>      
			                    <div class="flex flex-row section-workInteractButtons">
			                        <button><img src="img/icon-like.svg">'.$output_each['collec_num'].'</button>
			                        <button><img src="img/icon-comment.svg">'.$output_each['comment_num'].'</button>
			                    </div>                                      
			                </div>						
						';
					}
					else{
						echo '
			                <div class="flex flex-column section-userWorkDisplay-Box">
			                    <div class="flex flex-row section-uploaderInfo">
			                        <a href="user-profile.html?userid='.$output_each['user_id'].'" class="flex flex-row flex_center_align_horizontal">
			                            <img src="uploads/images/'.$output_each['avatar'].'">
			                            <h4>'.$output_each['user_name'].'</h4>
			                        </a>
			                        <p>'.$output_each['upload_time'].'</p>
			                    </div>
			                    <div class="flex flex-column section-workdisplay">
			                        <a href="detail.html?post='.$output_each['post_id'].'">
			                            <p>'.$output_each['description'].'</p>
			                        </a>
			                    </div>      
			                    <div class="flex flex-row section-workInteractButtons">
			                        <button><img src="img/icon-like.svg">'.$output_each['collec_num'].'</button>
			                        <button><img src="img/icon-comment.svg">'.$output_each['comment_num'].'</button>
			                    </div>                                      
			                </div>						
						';						
					}
				}
				break;


			case 'loadUser':
				if(isset($_GET['uid'])){
					$uid=$_GET['uid'];
					// echo $uid;
					$query1="SELECT users.user_id,users.user_name,users.avatar,users.album_cover,users.description, COUNT(following.followed_user_id) AS followers FROM users, following WHERE users.user_id=".$uid." AND users.user_id=following.followed_user_id";
					$result1=$database->query($query1);
					$output1=$result1->fetch_assoc();
					// print_r($output1);
					echo '
		                <section class="banner">
		                    <!-- img or grey background-->
		                    <img src="uploads/images/'.$output1['album_cover'].'">
		                </section>
		                <section class="bio flex flex-row">
		                	<div class="flex flex-column">
			                    <img src="uploads/images/'.$output1['avatar'].'">
			                    <button class ="selected" type="follow" value="follow"><strong>Follow</strong></button>
		                    </div>

		                   	<div class="flex flex-column section-userInfo-text">
			                    <div class="flex flex-row">
				                    <h1>'.$output1['user_name'].'</h1>
				                    <p>@'.$output1['user_id'].'</p>
				          			<p>|</p>
				                    <p class="follower">'.$output1['followers'].' followers</p>
			                    </div>
			                    
			                    <p class="user-desc">'.$output1['description'].'</p>
		                    <div>
		                </section>
					';
				}
				break;
		}

	}//END if(isset($_GET['request']))//////////////////


// SELECT posts.category,users.avatar,users.user_name,posts.upload_time,images.image_content,posts.description,COUNT(collection.post_id) AS collec_num,COUNT(comments.post_id) AS comment_num FROM posts,users,images,collection,comments WHERE posts.post_id=1 AND posts.user_id=users.user_id AND posts.post_id=images.post_id AND posts.post_id=collection.post_id AND posts.post_id=comments.post_id

// SELECT posts.category,users.avatar,users.user_name,posts.upload_time,images.image_content,posts.description,COUNT(collection.post_id) AS collec_num FROM posts,users,images,collection WHERE posts.post_id=1 AND posts.user_id=users.user_id AND posts.post_id=images.post_id AND posts.post_id=collection.post_id
?>

