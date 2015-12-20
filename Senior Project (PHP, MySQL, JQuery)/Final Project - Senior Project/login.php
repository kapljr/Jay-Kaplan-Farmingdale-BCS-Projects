<!-- Login Page -->

<!-- BCS430W Senior Project Fall 2015
	 Team Name Iron Thrones
	 Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan
-->
<!-- DO NOT INCLUDE HEADER.PHP - WEBSITE WILL BREAK -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>WUFSD Ticket System</title>

	<!-- Bootstrap css -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

<?php
	include ("nav.php");
	include_once ("db.php");
	if ($_SERVER['HTTP_HOST'] == "wufsdticketsystem.com")
	{
	   $url = "http://www." . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
	   header("Location: $url");
	} 
	$error=''; // Variable To Store Error Message
	
	if (isset($_POST['submit'])) {
		if (!isset($_POST['email']) || !isset($_POST['password'])) {
			$error = "Email or Password is empty";
		}
		else
		{
			// Define $email and $password
			$email=strtolower($_POST['email']);
			$password=$_POST['password'];
			// To protect MySQL injection for Security purpose
			$email = stripslashes($email);
			$password = stripslashes($password);
			$email = mysqli_real_escape_string($db, $email);
			$password = mysqli_real_escape_string($db, $password);
			$password = md5($password);
			
			// SQL query to fetch information of registerd users and finds user match.
			$sql = "select * from user where password='$password' AND email='$email'";
			$result = mysqli_query($db,$sql);
			$row = mysqli_fetch_array($result);
			if ($row) {
				session_start(); // Starting Session
				$_SESSION['email']=$email;
				$_SESSION['uid']=$row['uid'];
				$_SESSION['location']=$row['location_id'];
				$_SESSION['position']=$row['position_id'];
				header("location: index.php"); // Redirecting To Dashboard Page
			} else {
				$error = "Email or Password is invalid";
			}//end of if for login
		}//end of outter else
	}// end of if isset post

	if(isset($_SESSION['email'])){
		header("location: index.php");
	}
?> 
	<div class="container">
		<h1 style="text-align:center; color:red;"><?php echo $error;?></h1>
		<form class="form-signin" method="post" action="login.php">
			<h2 class="form-signin-heading">Please sign in</h2>
			<input id="email" name="email" type="text" class="form-control" placeholder="Email address">
			<input type="password" id="password" name="password" class="form-control" placeholder="Password">
			<input type="submit" name="submit" class="btn btn-lg btn-primary btn-block" value="Sign in" />
		</form>
	</div><!-- /.container -->

<?php
	include ("footer.php");
?>