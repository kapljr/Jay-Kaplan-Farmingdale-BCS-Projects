<?php
/* Login page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
session_start();
// Variables  
  $msg = NULL;			// Error Message
// Get Form Input  
  if(isset($_POST['login'])) {
    $username = trim($_POST['username']);
    $pword = trim($_POST['password']);
	if ($username == NULL) 			$msg = "username is missing";
    if ($pword == NULL) 			$msg = "password is missing";
    if (($username == NULL) AND ($pword == NULL)) $msg = "username & password are missing";
	if ($msg == NULL) {
      include('mysql_connect.php');
	  $query = "SELECT userid, email, password, location, username FROM user WHERE username='$username'";
      $result = $mysqli->query($query);
	  if (!$result) $msg = "Error accessing Roster Table " . mysql_error;
	  if ($result->num_rows > 0) {
	    list($email, $location, $password, $userid, $username) = $result->fetch_row();
	    if ($pword == $password){
	      	$_SESSION['username'] = $username;
		    $_SESSION['email'] = $email;
		    $_SESSION['location'] = $location;
		    $_SESSION['password'] = $password;
			$_SESSION['userid'] = $userid;
		    $logon = true;
			if(isset($_POST['remember-me'])){
				$_SESSION['remember-me'] = true;
				$_SESSION['session_username'] = $username;
				$_SESSION['session_password'] = $password;
			} else {
				unset ($_SESSION['remember-me']);
			}
			$site = "location: index.php";
			$msg = "<font color='green'><b>$username Login Successful</b></font>"; 
			header($site);
			exit; 
		} 
		else $msg = "Invalid Password";//if password != pword
	    }
	  else $msg = "USERNAME is invalid";//if num_rows = 0
	  }// if no error messages
	} //if login is set
include ("header.php");	
include ("nav.php");
if(!isset($_SESSION['remember-me'])){
	$session_username = "";
	$session_password = "";
	$checked_rememberme = "";
} else {
	$checked_rememberme = "checked";
	$session_username = $_SESSION['session_username'];
	$session_password = $_SESSION['session_password'];
}
?>

<!-- Page Content -->
<div class="container">
   <form class="form-signin" action="login.php" enctype="multipart/form-data" method="post">
	
	<h2 class="form-signin-heading">Please sign in</h2>
	<label for="inputEmail" class="sr-only">User Name</label>
	<input type="text" name="username" value="<?=$session_username?>" class="form-control" placeholder="User Name" required autofocus>
	<label for="inputPassword" class="sr-only">Password</label>
	<input type="password" name="password" value="<?=$session_password?>" class="form-control" placeholder="Password" required>
	<div class="checkbox">
	  <label>
		<input type="checkbox" name="remember-me" value="remember-me" <?=$checked_rememberme?>> Remember me
	  </label>
	<?php echo "\n$msg";?>
	</div>
	<button class="btn btn-lg btn-success btn-block" name="login" type="submit">Sign in</button>
  </form>
</div>
<!-- /.container -->
<?php
include ("footer.php");
?>

    



