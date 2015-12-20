<?php
//Logout Page
//BCS430W Senior Project Fall 2015
//Team Name: Iron Thrones
//Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan
session_start();
session_destroy();
header('Location: login.php');
?>