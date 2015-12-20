<?php
/* admin protect page
 Written by: Jay R. Kaplan
 BCS 350 - Semester Project 12/8/2015
 checks is user is not the admin, and redirects to the login page
*/
 if($_SESSION['username']!='admin'){
		// Redirecting To Login Page
		header('Location: login.php'); 
	}
?>