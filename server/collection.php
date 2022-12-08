<?php
	include('functions.php');
	$database=db_connect($dbhost,$dbuser,$dbpass,$dbname);

    if(isset($_GET['query'])){
		if(isset($_GET['userid']) ){
			$userid=$_GET['userid'];
            $collecionid=$_GET['collectionid'];
            $postid=$_GET['postid'];

			switch($_GET['query']){
				case 'addCollection': 


					$category=$_POST['category'];
					$description=$_POST['des'];
                    $post_uploadtime=$_POST['postUploadTime'];
					$image=$_FILES['img'];

                    $query_addCollection = "INSERT INTO collection (user_id, category, des, postUploadTime, img)";
                    //should be the same name
                    $query_insertPost.=" VALUES(?,?,?,NOW())";
                    
                    $stmt=$database->prepare($query_addCollection);
                    $stmt->bind_param('isi',$userid,$collectionid,$postid);
                    $stmt->execute();

					break;
			}
		}
	}
?>