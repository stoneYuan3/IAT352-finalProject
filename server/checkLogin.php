<?php
	session_start();
	if(isset($_GET['query'])){
		if($_GET['query']=='checkLogin'){
			if(isset($_SESSION['uid'])){
				//pull user name and avatar from the database based on uid, which is stored in $_SESSION
				echo 'loggedin';
			}
			else{
				echo 'not_loggedIn';
			}
		}
	}

?>