<?php
//Register Page
//BCS430W Senior Project Fall 2015
//Team Name: Iron Thrones
//Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan

	include ("db.php");	

	$msg = "";
	if(isset($_POST["submit"]))
	{
		$firstname = $_POST["firstname"];
		$lastname = $_POST["lastname"];
		$location_id = $_POST["location_id"];
		$email = strtolower($_POST["email"]);
		$password = $_POST["password"];
		$priority = $_POST["priority"];
		$position_id = $_POST["position_id"];

		$firstname = mysqli_real_escape_string($db, $firstname);
		$lastname = mysqli_real_escape_string($db, $lastname);
		$location_id = mysqli_real_escape_string($db, $location_id);
		$priority = mysqli_real_escape_string($db, $priority);
		$position_id = mysqli_real_escape_string($db, $position_id);
		$email = mysqli_real_escape_string($db, $email);
		$password = mysqli_real_escape_string($db, $password);
		$password = md5($password);
		
		$sql="SELECT email FROM user WHERE email='$email'";
		$result=mysqli_query($db,$sql);
		$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
		if(mysqli_num_rows($result) == 1)
		{
			$msg = "Sorry...This email already exist...";
		}
		else
		{
			$query = mysqli_query($db, "INSERT INTO user (email, firstname, lastname, location_id, password, priority, position_id) VALUES ('$email', '$firstname', '$lastname', '$location_id', '$password', '$priority', '$position_id')");
			if($query)
			{
				$msg = "Thank You! you are now registered.";
			}//end of if query
		}//end of else statement
	}//end of if isset post
?>

<?php
	include ("header.php");	
	include ("nav.php");


if($session_position < 1)
	header("location: index.php");
?>

	<div class="container">
		<form class="form-horizontal" method="post" action="register.php">
		<!-- Form Name -->
		<h1 style="text-align:center;">Register</h1>
		<h2 style="text-align:center; color:red;"><?php echo $msg;?></h2>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="firstname">First Name</label>  
				<div class="col-md-5">
				<input id="firstname" name="firstname" type="text" placeholder="Enter your first name" class="form-control input-md" required>
				</div><!--end of bootstrap grid col-md-5-->
			</div><!--end of form group-->

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="lastname">Last Name</label>  
				<div class="col-md-5">
				<input id="lastname" name="lastname" type="text" placeholder="Enter your last name" class="form-control input-md" required>
				</div><!--end of bootstrap grid col-md-5-->
			</div><!--end of form group-->

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="email">Email</label>  
				<div class="col-md-5">
				<input id="email" name="email" type="email" pattern="[^ @]*@[^ @]*" placeholder="Enter your email" class="form-control input-md" required>
				</div><!--end of bootstrap grid col-md-5-->
			</div><!--end of form group-->

			<!-- Password input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="password">Password</label>
				<div class="col-md-5">
				<input id="password" name="password" type="password" placeholder="Enter your password" class="form-control input-md" required>
				</div><!--end of bootstrap grid col-md-5-->
			</div><!--end of form group-->

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="location_id">Building</label>  
				<div class="col-md-5">
					<div class="dropdown theme-dropdown clearfix">
					<select required id="location_id" name="location_id" class="form-control input-md">
					<option value = "">Select Building</option>
						<?php
							$query9 = $db->prepare("SELECT LocationID, LocationName from location");
							$query9->execute();
							$query9->bind_result($LocationID, $LocationName);
							while ($query9->fetch()){
							echo "<option value='$LocationID'>".$LocationName."</option>";
							}
							$query9->close();
						?> 
					</select>
					</div><!--end drop down-->
				</div><!--end of bootstrap grid col-md-5-->
			</div><!--end of form group-->

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="priority">Priority</label>  
				<div class="col-md-5">
					<select required class="form-control input-md" id="priority" name="priority" >
					<option value = "">Select Priority</option>
					<option value="1">High</option>
					<option value="2">Medium</option>
					<option value="3">Low</option>
					</select> 
				</div><!--end of bootstrap grid col-md-5-->
			</div><!--end of form group-->

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="positionid">Position ID</label>  
				<div class="col-md-5">
					<select required class="form-control input-md" id="position_id" name="position_id" >
					<option value = "">Select Position</option>
					<option value="0">Teacher</option>
					<option value="1">Tech</option>
					<option value="2">Manager</option>
					<option value="3">Admin</option>
					</select> 
				</div><!--end of bootstrap grid col-md-5-->
			</div><!--end of form group-->

			<!-- Button -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="register"></label>
				<div class="col-md-3">
				<input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Register" />
				</div><!--end of bootstrap grid col-md-3-->
			</div><!--end of form group-->

			<div class="form-group">
				<label class="col-md-4 control-label" for="Cancel"></label>
				<div class="col-md-3">
				<button type="reset" name="cancel" class="btn btn-danger btn-lg btn-block" value="Clear">Cancel</button> 
				</div><!--end of bootstrap grid col-md-3-->
			</div><!--end of form group-->
		</form><!--End of register form-->
	</div><!-- /.container -->
	
<?php
include ("footer.php");
?>
