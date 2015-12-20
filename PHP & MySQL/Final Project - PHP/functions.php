<?php
//helper functions for code

//returns userid based on username
function get_userid($username){
	global $mysqli;
	$query1 = "SELECT userid FROM user WHERE username='$username'";
	$result = $mysqli -> query($query1);
	if ($result != FALSE){
		$row = $result -> fetch_array(MYSQLI_ASSOC);
		if ($row){
			$userid = $row['userid'];
			return $userid;
		}
	}
	return false;
}//get userid function

function get_post_value($key){
	if(isset($_POST[$key])){
		$value = $_POST[$key];
		$value = trim($value);
		if(strlen($value) > 0) {
			return $value;
		}
	}
	return null;
}

//add user function
function add_user($username, $email, $location, $password){
	global $mysqli;
	$username = mysqli_real_escape_string($mysqli,$username);
	$email = mysqli_real_escape_string($mysqli,$email);
	$location = mysqli_real_escape_string($mysqli,$location);
	$password = mysqli_real_escape_string($mysqli,$password);
	$query = "INSERT INTO user SET
				  username = '$username',
				  email = '$email',
				  location = '$location',
				  password = '$password'";
	$result = $mysqli -> query($query);

	if ($result == FALSE){
		return FALSE;
	} else {
		return TRUE;
	}
}

//add movie function.
function add_movie($moviename, $moviedescription,$moviecast, $posterfilename){
	global $mysqli;
	$moviename = mysqli_real_escape_string($mysqli,$moviename);
	$moviedescription = mysqli_real_escape_string($mysqli,$moviedescription);
	$moviecast = mysqli_real_escape_string($mysqli,$moviecast);
	$posterfilename = mysqli_real_escape_string($mysqli,$posterfilename);
	$query = "INSERT INTO movie SET
		moviename 			= 	'$moviename',
		moviedescription	= 	'$moviedescription',
		moviecast			= 	'$moviecast',
		posterfilename		= 	'$posterfilename'";
    $result = $mysqli->query($query);
	return $result;
    if ($result){
		$rowid = $mysqli->insert_id;
		return $rowid;
	} else{
		return null;
	}
}

//function is not used, was created after project ended, but left in for future reference of possible changes.
function load_movie($movieid){
	global $mysqli;
	$query1 = "SELECT posterfilename, moviename, moviecast, moviedescription, movieid from movie where movieid = $movieid";
	$result = $mysqli -> query($query1);
	return $result->fetch_assoc();
}

//delete movie function
function delete_movie($movieid){
	global $mysqli;
	$delete = "DELETE FROM movie WHERE movieid = $movieid";
	$result = $mysqli -> query($delete);
	return null;
}

//update movie function
function update_movie($movieid, $moviename, $moviedescription,$moviecast, $posterfilename){
	global $mysqli;
	$movieid = mysqli_real_escape_string($mysqli,$movieid);
	$moviename = mysqli_real_escape_string($mysqli,$moviename);
	$moviedescription = mysqli_real_escape_string($mysqli,$moviedescription);
	$moviecast = mysqli_real_escape_string($mysqli,$moviecast);
	$posterfilename = mysqli_real_escape_string($mysqli,$posterfilename);
		$query = "UPDATE movie SET
		moviename 			= 	'$moviename',
		moviedescription	= 	'$moviedescription',
		moviecast			= 	'$moviecast',
		posterfilename		= 	'$posterfilename'
		where movieid = '$movieid'";
	$result = $mysqli -> query($query);
	return $result;
}

//upload a file function
function get_file_upload($key){
	 if(!($_FILES[$key]['size'])){
		 return null;
	 }
	 $filename = null;
	 $msg = null;
	 $errors= array();
	 $session_id = session_id();
	 $parts = explode("\\",__FILE__);
	 $site = $parts[sizeof($parts)-2];
	 
	 if(isset($_FILES[$key])){
	  $file_name = $_FILES[$key]['name'];
      $file_size = $_FILES[$key]['size'];
      $file_tmp  = $_FILES[$key]['tmp_name'];
      $file_type = $_FILES[$key]['type'];
      $parts = explode('.',$_FILES[$key]['name']);
	  $file_ext  =  strtolower(end($parts));
	        
      $expensions= array("jpeg","jpg","png");
      
      if(in_array($file_ext,$expensions)=== false){
         $errors[]="extension not allowed, please choose a JPEG or PNG file.";
      }
      
      if($file_size > 2097152){
         $errors[]='File size must be excately 2 MB';
      }
     
	  // input filename will be normalized using session id of current session.
	  // since users wil be able to upload multiple images during one session,
	  // this function will first check to see if a filename exists and if it does
	  // it will increment a version id for that session id, this way the user
	  // can upload multiple images for the same session.
	  // Since users will be able to upload images using the same file name
	  // away has to be created to prevent this, the only way I can see this
	  // being done is to use the session id as a base file name.

	  $version = 1;
	  $loop = true;
	  while($loop){
		  $filename = 'images/'.$session_id."_".$version.".".$file_ext;
		  $filename2 = $_SERVER['DOCUMENT_ROOT'].$site."/".$filename;
		  if(file_exists($filename2)){
			  $version += 1;
		  } else {
			  $loop = false;
		  }
	  }
      if(empty($errors)==true){
         move_uploaded_file($file_tmp,$filename);
      }
   }
    return(array($filename, $errors, $msg));
}
?>