<?php
	include('functions.php');
	$database=db_connect($dbhost,$dbuser,$dbpass,$dbname);

	//activate when a request is received from javascript
	if(isset($_GET['query'])){
		//do accordingly based on the type of request
		switch($_GET['query']){
			//in case where user want to follow somebody
			case 'registerFollow':
				if(isset($_GET['follower']) && isset($_GET['followtarget'])){
					$follower=$_GET['follower'];
					$followTarget=$_GET['followtarget'];
					$query_registerFollow="INSERT INTO following(user_id,followed_user_id)";
					$query_registerFollow.="VALUES(".$follower.", ".$followTarget.")";
					$result_registerFollow=$database->query($query_registerFollow);
					if($result_registerFollow){
						echo 'success';
					}
					else{
						echo 'fail';
					}
				}
				break;

			//in case when user want to cancel follow somebody
			case 'cancelFollow':
				if(isset($_GET['follower']) && isset($_GET['followtarget'])){
					$follower=$_GET['follower'];
					$followTarget=$_GET['followtarget'];
					$query_cancelRegister="DELETE FROM following WHERE following.user_id=".$follower." AND following.followed_user_id=".$followTarget;		
					$result=$database->query($query_cancelRegister);
					if($result){
						echo 'success';
					}
					else{
						echo 'fail';
					}					
				}				
				break;

			//check if a following relationship exists, help to assign correct interface in frontend
			case 'checkFollow':
				if(isset($_GET['follower']) && isset($_GET['followtarget'])){
					$follower=$_GET['follower'];
					$followTarget=$_GET['followtarget'];

					$query_checkFollow="SELECT user_id,followed_user_id FROM following WHERE user_id=".$follower." AND followed_user_id=".$followTarget;
						$result_checkFollow=$database->query($query_checkFollow);
						$output_checkFollow=$result_checkFollow->fetch_assoc();
					if($output_checkFollow!=null){
						echo 'followed';
					}
					else{
						echo 'not_followed';
					}
				}
				break;
		}

	}

?>