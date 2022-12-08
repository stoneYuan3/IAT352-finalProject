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
    function generatePosts($array1,$array2,$array3){
        $output_arr_main=$array1;
        $output_arr_img=$array2;
        $output_arr_comment=$array3;
        $final_result=[];

        for($i=0;$i<count($output_arr_main);$i++){
            $output_each=$output_arr_main[$i];
            //for image post
            if($output_arr_main[$i]['category']==1){
                $v= '
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
                </div>      
                <div class="flex flex-row section-workInteractButtons">
                ';

                $v_collectButton='
                    <button class="button-post-collect" name="'.$output_each['post_id'].'"><img id="icon-post-collect" src="img/icon-like.svg">'.$output_each['collec_num'].'</button>
                ';
                if(isset($output_each['collected'])){
                    if($output_each['collected']=='yes'){
                        $v_collectButton=
                            '
                            <button class="button-post-collect collected" name="'.$output_each['post_id'].'"><img id="icon-post-collect" src="img/icon-like-liked.svg">'.$output_each['collec_num'].'</button>
                            ';
                    }                    
                }
                $v.=$v_collectButton;

                $v.=
                '
                <button><img src="img/icon-comment.svg">'.$output_arr_comment[$i]['comment_num'].'</button>
                </div>                                      
                </div>                      
                ';
                array_push($final_result,$v);
            }

            //////////////////////////////////////////////////////////////
            //TBD, apply collection detection to article posts as well
            //apply collection detection to work detail page
            //check issue: collection number appears to be inaccurate
            //////////////////////////////////////////////////////////////

            //for article post
            else{
                $v= '
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
                <button class="button-post-collect" name="'.$output_each['post_id'].'"><img id="icon-post-collect" src="img/icon-like.svg">'.$output_each['collec_num'].'</button>
                <button><img src="img/icon-comment.svg">'.$output_arr_comment[$i]['comment_num'].'</button>
                </div>                                      
                </div>                      
                ';    
                array_push($final_result,$v);                  
            }
        }   
        //return the array $final_result
        return $final_result;     
    }

    //generate post detail page for detail.html
    function generatePostDetail($array1,$array2,$array3){
        $output1=$array1;
        $output_arr_img=$array2;
        $output_arr_comment=$array3;
        $v1='';
        //for image post
        if($output1['category']==1){
            $v1= '
            <section class="section-detail-mainContent">
            <section class="picture">
            <img src="uploads/images/'.$output_arr_img['image_content'].'">
            </section>
            <section class="description">

            <button class="button-post-collect" name="'.$output1['post_id'].'">
                <img id="icon-post-collect" src="img/icon-like.svg">'.$output1['collec_num'].'
            </button>

            <button>
                <img src="img/icon-comment.svg">'.$output_arr_comment['comment_num'].'
            </button>

            <label class="view">13452 views</label>

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
            <label class="view">13452 views</label>
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