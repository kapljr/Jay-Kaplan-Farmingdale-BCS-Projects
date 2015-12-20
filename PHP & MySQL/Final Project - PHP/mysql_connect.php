<?php
/* Mysql Connect page
 Written by: Jay R. Kaplan
 BCS 350 - Semester Project 12/8/2015
*/
  $mysqli = new mysqli('localhost', 'root', '', 'fscmoviedb'); 
    if ($mysqli->connect_error)
    die('Connect Error: ' . $mysqli->connect_error);
?>