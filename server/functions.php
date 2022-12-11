<?php
//database connection///////////////////////////////////////////////////////////
	$dbhost='localhost';
    $dbuser="root";
    $dbpass="";
    $dbname="garage";	

    function db_connect($dbhost,$dbuser,$dbpass,$dbname){
        $connect=mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);
        return $connect;
    }
    function db_disconnect($connection){
        if(isset($connection)){
            mysqli_close($connection);
        }
    }

    //Function to sanitize inputs before sql inserts - by Kai-Lee MacBain, adapted from code from Lecture 8
    function sanitizeInputForSql($dbConnection,$var) {
        $var = mysqli_real_escape_string($dbConnection, $var);
        $var = htmlentities($var);
        $var = strip_tags($var);
        return $var;
    }

//post generation////////////////////////////////////////////////////////////////
    //generate post preview window on index page, user profile page,etc
    function generatePosts($array1,$array2,$array3,$array4){
        $output_arr_main=$array1;
        $output_arr_img=$array2;
        $output_arr_comment=$array3;
        $output_arr_collect=$array4;
        $final_result=[];

        $v='<div class="section-userWorkDisplay">';
        for($i=0;$i<count($output_arr_main);$i++){
            $output_each=$output_arr_main[$i];
            //for image post
            if($output_arr_main[$i]['category']==1){
                $v.= '
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
                <img src="uploads/images/'.$output_arr_img[$i]['image_content'].'">
                </a>
                </div>';
            }

            //////////////////////////////////////////////////////////////
            //TBD, apply collection detection to article posts as well
            //apply collection detection to work detail page
            //check issue: collection number appears to be inaccurate
            //////////////////////////////////////////////////////////////

            //for article post
            else{
                $v.= '
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
                </div>  ';
            }

            $v.='<div class="flex flex-row section-workInteractButtons">';
            $v_collectButton='
                <button class="button-post-collect" name="'.$output_each['post_id'].'"><img id="icon-post-collect" src="img/icon-like.svg">'.$output_arr_collect[$i]['collec_num'].'</button>
            ';
            if(isset($output_each['collected'])){
                if($output_each['collected']=='yes'){
                    $v_collectButton=
                        '
                        <button class="button-post-collect collected" name="'.$output_each['post_id'].'"><img id="icon-post-collect" src="img/icon-like-liked.svg">'.$output_arr_collect[$i]['collec_num'].'</button>
                        ';
                }                    
            }
            $v.=$v_collectButton;
            $v.='
            <button><img src="img/icon-comment.svg">'.$output_arr_comment[$i]['comment_num'].'</button>
            </div>                                      
            </div>                      
            ';                
        }   
        $v.='</div>';
        array_push($final_result,$v);  
        //return the array $final_result
        return $final_result;     
    }

    //generate post detail page for detail.html
    function generatePostDetail($array1,$array2,$array3,$output_view){
        $output1=$array1;
        $output_arr_img=$array2;
        $output_arr_comment=$array3;
        //Gets view count number, or if no result returned because no views yet return 1
        $viewCount = isset($output_view['view_count']) ? $output_view['view_count'] : 1;

        $v1='';
        //for image post
        if($output1['category']==1){
            $v1= '
            <section class="section-detail-mainContent">
            <section class="picture">
            <img src="uploads/images/'.$output_arr_img['image_content'].'">
            </section>
            <section class="description">';

            $v_collectButton='
                <button class="button-post-collect" name="'.$output1['post_id'].'"><img id="icon-post-collect" src="img/icon-like.svg">'.$output1['collec_num'].'</button>
            ';
            if(isset($output1['collected'])){
                if($output1['collected']=='yes'){
                    $v_collectButton=
                        '
                        <button class="button-post-collect collected" name="'.$output1['post_id'].'"><img id="icon-post-collect" src="img/icon-like-liked.svg">'.$output1['collec_num'].'</button>
                        ';
                }                    
            }
            $v1.=$v_collectButton;
            $v1.='
            <button>
                <img src="img/icon-comment.svg">'.$output_arr_comment['comment_num'].'
            </button>

            <label class="view">'.$viewCount.' views</label>

            <section class="tags">
            </section>
            <p>'.$output1['description'].'</p>
            <br><img src="uploads/images/'.$output1['avatar'].'">
            <label class="username"><a href="user-profile.html?userid='.$output1['user_id'].'">'.$output1['user_name'].'</a></label>
            <label class="userid"> @'.$output1['user_id'].'</label>
            <!--<button id="button-index-Following" class="selected" type="follow" value="follow"><strong>Follow</strong></button>-->
            </section>
            </section>                      
            ';          
        }
        //for article post
        else{
            $v1= '
            <section class="section-detail-mainContent">
            <section class="picture">
            <p>'.$output1['description'].'</p>
            </section>
            <section class="description">
            <img src="img/liked.png">
            <label>'.$output1['collec_num'].'</label>
            <img src="img/comment.png">
            <label>'.$output_arr_comment['comment_num'].'</label>
            <label class="view">'.$viewCount.' views</label>
            <section class="tags">
            </section>
            <br><img src="uploads/images/'.$output1['avatar'].'">
            <label class="username"><a href="user-profile.html?userid='.$output1['user_id'].'">'.$output1['user_name'].'</a></label>
            <label class="userid"> @'.$output1['user_id'].'</label>
            <!--<button id="button-index-Following" class="selected" type="follow" value="follow"><strong>Follow</strong></button>-->
            </section>
            </section>                      
            ';             
        }
        //return the array $final_result
        return $v1;     
    }

    function pullPosts($list_of_postID,$database){
        $output1_arr=$list_of_postID;
        $listof_posts_raw=[];
        if(count($output1_arr)==0){
            // return null;
            return '<p class="section-empty">There are no posts under this category!</p>';
            //TBD, place a placeholder text saying that nothing matches with your query
        }
        else{
            //pull the actual post content based on post_id
            $output_arr_main=[];
            $output_arr_collectNum=[];
            $output_arr_img=[];
            $output_arr_commentNum=[];
            //output1_arr contains the list of post id. the function below take those post id and render the entire post box based on the post id
            for($i=0;$i<count($output1_arr);$i++){
                $id=$output1_arr[$i];
                //pull main components
                $query_main="SELECT posts.post_id,posts.category,users.avatar,users.user_name,users.user_id,posts.upload_time,posts.description,COUNT(collection.post_id) AS collec_num FROM posts,users,images,collection WHERE posts.post_id='".$id."' AND posts.user_id=users.user_id AND posts.post_id=collection.post_id";
                $query_collection="SELECT COUNT(collection.post_id) AS collec_num FROM collection,posts WHERE posts.post_id='".$id."' AND posts.post_id=collection.post_id";
                //pull image
                $query_img="SELECT images.image_content FROM posts,images WHERE posts.post_id='".$id."' AND posts.post_id=images.post_id;"; 
                //pull comment number
                $query_comment="SELECT COUNT(comments.post_id) AS comment_num FROM posts,comments WHERE posts.post_id='".$id."' AND posts.post_id=comments.post_id;";                           
                $result_main=$database->query($query_main);
                $output_main=$result_main->fetch_assoc();

                $result_collect=$database->query($query_collection);
                $output_collect=$result_collect->fetch_assoc();                     
                //check if this post is collected, add the result to the array
                if(isset($_GET['loginID'])){
                    $loginID=$_GET['loginID'];

                    if(isCollected($loginID,$output_main['post_id'],$database)){
                        $output_checkCollect=['collected'=>'yes'];
                    }
                    else{
                        $output_checkCollect=['collected'=>'no'];
                    }
                    $output_main=array_merge($output_main,$output_checkCollect);
                    // print_r($output_main);
                }

                $result_img=$database->query($query_img);
                $output_img=$result_img->fetch_assoc();

                $result_comment=$database->query($query_comment);
                $output_comment=$result_comment->fetch_assoc();

                array_push($output_arr_main,$output_main);
                array_push($output_arr_collectNum, $output_collect);
                array_push($output_arr_img, $output_img);
                array_push($output_arr_commentNum, $output_comment);                        
            }

            return generatePosts($output_arr_main,$output_arr_img,$output_arr_commentNum,$output_arr_collectNum);

            // $listof_posts_raw=['main'=>$output_arr_main,'img'=>$output_arr_img,'commentNum'=>$output_arr_commentNum,'collectNum'=>$output_arr_collectNum];
            // return $listof_posts_raw;

            //categolary 1 is image, 2 is pure text
            //instead of echoing raw html, the generated html layout is now transfered back to frontend in JSON format. JSON format allows more flexible manipulation for the front end.
            // echo json_encode(generatePosts($output_arr_main,$output_arr_img,$output_arr_commentNum,$output_arr_collectNum));
        }    
    }



    function isCollected($userid,$post_id,$database){
        $query_checkCollect="SELECT user_id,post_id FROM collection WHERE user_id=".$userid." AND post_id=".$post_id;
        $result_checkCollect=$database->query($query_checkCollect);
        $output_checkCollect=$result_checkCollect->fetch_assoc();
        if($output_checkCollect==null){
            return false;
        }
        else{
            return true;
        }           
    }


    function page_cssLink($css_name){
        $cssLink = "<link rel = \"stylesheet\" href = \"". $css_name . "\">";
        echo $cssLink;
    }

    //remove/add https
    function removeHTTPS(){
        if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS']=='on'){
            header('Location:http://'. $_SERVER['HTTP_HOST'] .
            $_SERVER['REQUEST_URI']);
            exit();
        }        
    }
    function addHTTPS(){
        if($_SERVER['HTTPS']!='on'){
            header('Location:https://'. $_SERVER['HTTP_HOST'] .
            $_SERVER['REQUEST_URI']);
            exit();
        }        
    }    
    ////////////////////








///////////////////////////////////////////////////////////////////////////////
//old codes from other projects, may become useful reference////////////////////////////////////////////

    // function create_header(){
    //     session_start();
    //     echo'
    //         <html lang="en">
    //           <head>
    //             <title>IAT352-A3</title>
    //           </head>
    //     ';
    // }

    function create_nav(){

    	echo '	
	    <header>
			<nav class="flex">
				<div class="flex flex-row">
					<a href="index.php">Classic Models</a>
					<a href="showmodels.php">All Models</a>
					<a href="watchlist.php">Watchlist</a>
				</div>
				<div class="flex flex-row">';
                //check whether display login or logout
                if(isset($_SESSION['user'])){
				    echo '<p>Hello, ' . $_SESSION['user'] . '</p>';
                    echo '<a href="logout.php">Log out</a>'	;
                }
                else{
                    echo '<a href="login.php">Log in</a>';
                }

		echo '	</div>
			</nav>
		</header>
		';
        removeHTTPS();
    }
    function create_nav_login(){
        echo '  
        <header>
            <nav class="flex">
                <div class="flex flex-row">
                    <a href="index.php">Classic Models</a>
                    <a href="showmodels.php">All Models</a>
                    <a href="watchlist.php">Watchlist</a>
                </div>

            </nav>
        </header>
        ';
        addHTTPS();       
    }
//check if an item exists in a watchlist
function checkWatchlist($db, $product_code, $session){
    $noDuplicate=false;
    $query_checkWatchlist = "SELECT userid, productCode FROM watchlist WHERE userid='".$session."' AND productCode='".$product_code."'";
    $result_checkWatchlist=$db->query($query_checkWatchlist);
    if($result_checkWatchlist->num_rows==0){
        $noDuplicate=true;
    }    
    return $noDuplicate;
}
///////////////////////////////////////////////////////////////////////////////
?>