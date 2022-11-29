<?php
	session_start();
	include('functions.php');
	//error report 111-11-29
	//do not have any empty lines outside of <?php brackets, do not write php code in several <?php brackets,  do not have any empty lines between two <?php brackets
	//that was the case in functions.php. it causes the echo statement under checkLogin to echo several empty lines before echoing the desired result, which screws up the javascript receiver
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