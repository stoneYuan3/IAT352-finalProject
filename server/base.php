

<?php
	require_once('functions.php');
	$database=db_connect($dbhost,$dbuser,$dbpass,$dbname);
	session_start();

	if(isset($_GET['query'])){

		switch($_GET['query']){
			case 'loadIndex':
				//prepare query: pull post_id that are needed from database based on filter requirements
				if(isset($_GET['filter'])){
					$query1='SELECT post_id from posts';
					$filter='';
					switch($_GET['filter']){
						case 'images':
							$filter=' WHERE category=1';
							break;
						case 'articles':
							$filter=' WHERE category=2';
							break;
					}
					$query1.=$filter;
					$query1.=" ORDER BY upload_time DESC";
				}
				
				elseif(isset($_GET['tag'])){
					// SELECT posts.post_id, tags.tag_name from posts, tags WHERE tags.tag_name='Digital 2D' AND tags.post_id=posts.post_id
					$query1="SELECT posts.post_id FROM posts, tags WHERE tags.tag_name='".$_GET['tag']."' AND tags.post_id=posts.post_id";
				}

				//prepare query: pull all if no filter is set
				else{
					// $query1="SELECT post_id from posts ORDER BY upload_time DESC LIMIT 12";
					$query1="SELECT post_id from posts ORDER BY upload_time DESC";
				}

				//use the query prepared above to pull the list of post_id, and put in an array for future use
				$result1=$database->query($query1);
				$output1_arr=[];
				for($i=0;$i<$result1->num_rows;$i++){
					$output_each=$result1->fetch_row();
					array_push($output1_arr,$output_each[0]);
				}

				if(count($output1_arr)==0){

				}
				else{
					//pull the actual post content based on post_id
					$output_arr_final=[];
					for($i=0;$i<count($output1_arr);$i++){
						$id=$output1_arr[$i];
						$query2="SELECT posts.post_id,posts.category,users.avatar,users.user_name,users.user_id,posts.upload_time,images.image_content,posts.description,COUNT(collection.post_id) AS collec_num,COUNT(comments.post_id) AS comment_num FROM posts,users,images,collection,comments WHERE posts.post_id='".$id."' AND posts.user_id=users.user_id AND posts.post_id=images.post_id AND posts.post_id=collection.post_id AND posts.post_id=comments.post_id";	
						$result2=$database->query($query2);
						$output2=$result2->fetch_assoc();
						array_push($output_arr_final,$output2);
					}

					//categolary 1 is image, 2 is pure text
					//instead of echoing raw html, the generated html layout is now transfered back to frontend in JSON format. JSON format allows more flexible manipulation for the front end.
					echo json_encode(generatePosts($output_arr_final));
				}
				break;

			case 'loadUser':
				if(isset($_GET['uid'])){

					//load user bio: step 1 pulling user bio data from database
					$uid=$_GET['uid'];
					$query1="SELECT users.user_id,users.user_name,users.avatar,users.album_cover,users.description, COUNT(following.followed_user_id) AS followers FROM users, following WHERE users.user_id=".$uid." AND users.user_id=following.followed_user_id";

					$result1=$database->query($query1);
					$output1=$result1->fetch_assoc();
					//load user bio: step 2 assign data to html layout, store in a variable for future use
					$v1= '
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

					//load posts (user's posts or user's collections)
					//step 1:get the post id of posts that need to be displayed
					if(isset($_GET['type'])){
						$type=$_GET['type'];
						if($type=='posts'){
							$query1="SELECT post_id FROM posts WHERE user_id=".$uid;
						}
						elseif($type=='collection'){
							// $query1="SELECT post_id FROM collection WHERE user_id=".$uid;
							$query1="SELECT posts.post_id FROM posts, collection WHERE posts.post_id=collection.post_id AND collection.user_id=".$uid;
						}
						////
						if(isset($_GET['filter'])){
							$filter='';
							switch($_GET['filter']){
								case 'images':
									$filter=' AND category=1';
									break;
								case 'articles':
									$filter=' AND category=2';
									break;
							}
							$query1.=$filter;
							$query1.=" ORDER BY upload_time DESC";
						}
						elseif(isset($_GET['tag'])){
							// SELECT posts.post_id, tags.tag_name from posts, tags WHERE tags.tag_name='Digital 2D' AND tags.post_id=posts.post_id
							$query1="SELECT posts.post_id FROM posts, tags WHERE posts.user_id=".$uid." AND tags.tag_name='".$_GET['tag']."' AND tags.post_id=posts.post_id";
							$query1.=" ORDER BY upload_time DESC";
						}					
						else{
							$query1.=" ORDER BY upload_time DESC";
						}
					}
					////					
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
							$result2=$database->query($query2);
							$output2=$result2->fetch_assoc();
							array_push($output_arr_final,$output2);						
					}

					$v2=generatePosts($output_arr_final);				
					$arr=['bio' => $v1,'userpost' => $v2];
					//instead of echoing raw html, the generated html layout is now transfered back to frontend in JSON format. JSON format allows more flexible manipulation for the front end.	
					//In this case the array $arr containing two modules (user bio and user posts), which are raw HTML codes stored in array. It is tranfered back to the front end. The front end can now insert those two modules into different parts of the page, which cannot be done if php simply transfer pure html.			
					echo json_encode($arr);
				}
				break;

			case 'loadPostDetail':
				if(isset($_GET['post'])){
					$post_id=$_GET['post'];
					$query_main="SELECT posts.post_id,posts.category,images.image_content,COUNT(collection.post_id) AS collec_num,COUNT(comments.post_id) as comment_num,posts.description,users.user_id,users.user_name,users.avatar FROM posts,images,collection,users,comments WHERE posts.post_id=".$post_id." AND posts.post_id=images.post_id AND posts.post_id=collection.post_id AND posts.post_id=comments.post_id AND posts.user_id=users.user_id";
					$result_main=$database->query($query_main);
					$output_main=$result_main->fetch_assoc();

					$query_tag="SELECT posts.post_id,tags.tag_name FROM posts,tags WHERE posts.post_id=".$post_id." AND posts.post_id=tags.post_id";
					$result_tag=$database->query($query_tag);
					$output_tag=[];
					for($i=0;$i<$result_tag->num_rows;$i++){
						$output_tag_each=$result_tag->fetch_assoc();
						array_push($output_tag,$output_tag_each);
					}
					$v2='<p>';
					if(count($output_tag)!=0){
						for($i=0;$i<count($output_tag);$i++){
							$v2.= '#'.$output_tag[$i]['tag_name'].' ';
						}
					}
					else{
						$v2.='no tags available';
					}
					$v2.= '</p>';

					$query_comment="SELECT posts.post_id,users.user_id,users.avatar,users.user_name,comments.content,comments.upload_time FROM posts,users,comments WHERE posts.post_id=".$post_id." AND posts.post_id=comments.post_id AND users.user_id=comments.user_id";
					$result_comment=$database->query($query_comment);
					$output_comment=[];
					for($i=0;$i<$result_comment->num_rows;$i++){
						$output_comment_each=$result_comment->fetch_assoc();
						array_push($output_comment,$output_comment_each);
					}
					$output_comment_final=[];
					for($i=0;$i<count($output_comment);$i++){
						$output_each=$output_comment[$i];
						$v='
	                    <section class="section-commentUnit flex flex-row">
	                        <img src="uploads/images/'.$output_each['avatar'].'">
	                        <div class="section-comment-content flex flex-column">
	                            <div class="flex flex-row flex_center_align_horizontal">
	                                <a href="user-profile.html?userid='.$output_each['user_id'].'">'.$output_each['user_name'].'</a>
	                                <p class="date"> Posted on '.$output_each['upload_time'].'</p>
	                            </div>
	                            <p>'.$output_each['content'].'</p>  
	                        </div>                      
	                    </section>
	                    ';
	                    array_push($output_comment_final,$v);
					}


					$v1=generatePostDetail($output_main);
					$arr=['main'=>$v1, 'tag'=>$v2, 'comment'=>$output_comment_final];
					echo json_encode($arr);
				}			
		}

	}//END if(isset($_GET['request']))//////////////////


// SELECT posts.category,users.avatar,users.user_name,posts.upload_time,images.image_content,posts.description,COUNT(collection.post_id) AS collec_num,COUNT(comments.post_id) AS comment_num FROM posts,users,images,collection,comments WHERE posts.post_id=1 AND posts.user_id=users.user_id AND posts.post_id=images.post_id AND posts.post_id=collection.post_id AND posts.post_id=comments.post_id

// SELECT posts.category,users.avatar,users.user_name,posts.upload_time,images.image_content,posts.description,COUNT(collection.post_id) AS collec_num FROM posts,users,images,collection WHERE posts.post_id=1 AND posts.user_id=users.user_id AND posts.post_id=images.post_id AND posts.post_id=collection.post_id
?>

