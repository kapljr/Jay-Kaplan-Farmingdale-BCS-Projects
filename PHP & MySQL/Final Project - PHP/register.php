<?php
/* Register page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("functions.php");
include ("header.php");	
include ("nav.php");

$error_msg = $success_msg = "";

if(isset($_POST["submit"]))
{
	$username = get_post_value("username");
	$email = get_post_value("email");
	$location = get_post_value("location");
	$password = get_post_value("password");
	if($username && $email && $location && $password ){
		$success = add_user($username, $email, $location, $password);
		
		if ($success){
			$success_msg = "You have been successfully added.";
			header( "refresh:3; url=login.php" );
		} else {
			$error_msg = "Sorry, some error happened";
		}
	} else {
		$error_msg = "Please enter required fields.";
	}
}//post submit

?>
<div class="container">
<form class="form-horizontal" method="post" action="register.php">
<!-- Form Name -->
	<h1 style="text-align:center;">Register</h1>
	<?php
	if ($error_msg){
		echo "<div class='alert alert-danger'>$error_msg</div>";
	}
	if ($success_msg){
		echo "<div class='alert alert-success'>$success_msg</div>";
	}
	?>
<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="username">User Name</label> 
	<div class="col-md-5">
	<input id="username" name="username" type="text" placeholder="" class="form-control input-md" required>
	</div>
</div><!--end of form-group-->
<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="email">Email</label>  
	<div class="col-md-5">
	<input id="email" name="email" type="text" placeholder="" class="form-control input-md" required>
	</div>
</div><!--end of form-group-->
<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="location">Location</label>  
	<div class="col-md-5">
	<input id="location" name="location" type="text" placeholder="" class="form-control input-md" required>
	</div>
</div><!--end of form-group-->
<!-- Password input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="password">Password</label>
	<div class="col-md-5">
	<input id="password" name="password" type="password" placeholder="" class="form-control input-md" required>
	</div>
</div><!--end of form-group-->
<!-- Button -->
<div class="form-group">
	<label class="col-md-4 control-label" for="register"></label>
	<div class="col-md-3">
	<input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Register" />
	</div>
</div><!--end of form-group-->
<div class="form-group">
	<label class="col-md-4 control-label" for="Cancel"></label>
	<div class="col-md-3">
	<button type="reset" name="cancel" class="btn btn-danger btn-lg btn-block" value="Clear">Cancel</button> </div>
	</div><!--end of form-group-->
</form><!--end of form-->

</div><!-- /.container -->
<?php
include ("footer.php");
?>





