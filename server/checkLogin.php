<?php
	session_start();
	include('functions.php');
	$database=db_connect($dbhost,$dbuser,$dbpass,$dbname);	
	//error report 111-11-29
	//do not have any empty lines outside of <?php brackets, do not write php code in several <?php brackets,  do not have any empty lines between two <?php brackets
	//that was the case in functions.php. it causes the echo statement under checkLogin to echo several empty lines before echoing the desired result, which screws up the javascript receiver
	if(isset($_GET['query'])){
		if($_GET['query']=='checkLogin'){
			if(isset($_SESSION['user'])){
				//pull user name and avatar from the database based on uid, which is stored in $_SESSION
				echo $_SESSION['user'];
			}
			else{
				echo 'not_loggedIn';
			}
		}

		// Codes in if($_GET['query']=='signUp'){} and if($_GET['query']=='login'){} on this page written by Kai-Lee MacBain
		// Slightly adapted by Jack to fit the context

		//from Kai-Lee
		// All PHP code on this page written by Kai-Lee MacBain
		// Adapted from Assignment 4 code from SFU IAT352: Internet Computing Technologies, taught by Mohammad Rjabi Seraji, Fall 2022
		// HTML written by Winkie Ng and edited by Kai-Lee MacBain
		if($_GET['query']=='signUp'){
			// if($_POST['request_type']=='register'){
			    $user_name = $_POST["user_name"];
			    $email = $_POST["email"];
			    $password = $_POST["password"];

		        try {
		            // Encrypt password entry using th SHA-1
		            $pw_encrypted = password_hash($password, PASSWORD_DEFAULT);
		            // Sanitize input for user name
		            $user_name = sanitizeInputForSql($database,$user_name);
		            // Sanitize input for email
		            $email = sanitizeInputForSql($database,$email);
		            $avatar='avatar_default.png';
		            $album_cover='album_cover_default.png';

		            // Inserts required fields into Garage database
		            $query = "INSERT INTO users (user_name, email, password, avatar, album_cover) ";
		            $query .= "VALUES (?,?,?,?,?)";

		            $stmt = $database->prepare($query);
		            $stmt->bind_param('sssss',$user_name, $email, $pw_encrypted,$avatar,$album_cover);
		            $stmt->execute();
		            echo 'success';
		        }
		        // Code for how to catch mysqli exception when email is already in database from:
		        // https://stackoverflow.com/questions/26923422/unable-to-catch-an-sql-exception
		        catch (\mysqli_sql_exception $e) {
		            $message = "Email already in use - please use a different email.";
		            echo $message;
		        }

			// }
		}

		if($_GET['query']=='login'){
			$email = $_POST["email"];
			$password = $_POST["password"];
		    // Sanitize input for email
		    $email = sanitizeInputForSql($database,$email);
		    // Sanitize input for password
		    $password = sanitizeInputForSql($database,$password);
		    // Query to get table row where email equals user input,
		    // return password for verification
		    $query = "SELECT email,password,user_id from users ";
		    $query .= "WHERE email = ?";

		    $stmt = $database->prepare($query);
		    $stmt->bind_param('s',$email);
		    $stmt->execute();
		    $stmt->bind_result($email2,$pass2_hash,$uid);

		    // Verify user password
		    if($stmt->fetch() && password_verify($password,$pass2_hash)) {
		        // If email is verified, create a user session and redirect to the homepage
		        $_SESSION['user'] = $uid;
		        echo 'success';
		    }
		    // Message that displays if email and password are not in the database
		    else{
		    	$message = "Sorry, email and password combination doesn't match.";	
		    	echo $message;
		    }	    
		}

		if($_GET['query']=='logout'){
			session_destroy();
		}

		if($_GET['query']=='pullUserInfo'){
			if(isset($_GET['userid'])){
				$userid=$_GET['userid'];
				$query="SELECT users.user_id,users.user_name,users.email,users.avatar FROM users WHERE users.user_id=".$userid;
				$result=$database->query($query);
				$output=$result->fetch_assoc();
				echo json_encode($output);
			}
		}

	}

?>