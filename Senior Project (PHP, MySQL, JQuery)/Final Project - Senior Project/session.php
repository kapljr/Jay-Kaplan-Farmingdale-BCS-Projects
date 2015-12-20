<?php
//Session ID page
//BCS430W Senior Project Fall 2015
//Team Name: Iron Thrones
//Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan

	// Connects to MySQL and the database and establishes connection
	include_once ("db.php");
	
	session_start();// Starting Session
	if(isset($_SESSION['email'])){
		// Storing Session
		$user_check=$_SESSION['email'];
		// SQL Query To Fetch Complete Information Of User
		$sql="select * from user where email='$user_check'";
		$query=mysqli_query($db,$sql);
		$row = mysqli_fetch_assoc($query);
		$session_name = $row['firstname'];
		$session_email = $row['email'];
		$session_uid = $_SESSION['uid'];
		$session_location = $_SESSION['location'];
		$session_position = $_SESSION['position'];
	}
	else{
		header('Location: login.php'); // Redirecting To Home Page
	}
?>