<?php
/* BCS Logoff page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
  
   Logoff by unsetting session variables  
   This was created in order to keep the remember me checkbox working for when a user wanted to return.
*/
  session_start();
  if(isset($_SESSION['remember-me'])){
	  unset($_SESSION['username']);
  } else {
//	echo "want to destroy";die;
	session_destroy();
  }
// Redirecting To Home Page
  header('Location: login.php');
?>
