<?php
/* Protected page - provides protection for pages where user level access is restricted
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
	if(!isset($_SESSION['username'])){
		// Redirecting To login Page
		header('Location: login.php'); 
	}
?>