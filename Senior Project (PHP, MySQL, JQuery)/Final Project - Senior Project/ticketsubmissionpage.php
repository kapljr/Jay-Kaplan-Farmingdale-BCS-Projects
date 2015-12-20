<?php
//Ticket Submission Page
//BCS430W Senior Project Fall 2015
//Team Name: Iron Thrones
//Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan
	
	include ("header.php");	
	include ("nav.php");
	
	// Connects to MySQL and the database and establishes connection
	include_once ("db.php");	

	$msg = "";

	if(isset($_POST["submit"]))
	{
		$error = false;//tracks errors
		
		//The code below Sanitizes the Post variable strings from the form.
		if(isset($_POST["building"])){
			$building = filter_var( $_POST["building"], FILTER_SANITIZE_STRING);
		} else {
			$error = true;
		}
		
		if(isset($_POST["roomnumber"])){
			$roomnumber = filter_var( $_POST["roomnumber"], FILTER_SANITIZE_STRING);
		} else {
			$error = true;
		}
		
		if(isset($_POST["typeofproblem"])){
			$typeofproblem = filter_var($_POST["typeofproblem"],FILTER_SANITIZE_STRING,FILTER_FLAG_NO_ENCODE_QUOTES);

		} else {
			$error = true;
		}
		
		if(isset($_POST["problemdescription"])){
			$problemdescription = filter_var($_POST["problemdescription"],FILTER_SANITIZE_STRING,FILTER_FLAG_NO_ENCODE_QUOTES);
		} else {
			$error = true;
		}
		
		//If there are no errors mysqli real escape string gets rid of any strange characters before getting inserted into MySQL
		if(!$error){
			$building = mysqli_real_escape_string($db, $building);
			$roomnumber = mysqli_real_escape_string($db, $roomnumber);
			$typeofproblem = mysqli_real_escape_string($db, $typeofproblem);
			$problemdescription = mysqli_real_escape_string($db, $problemdescription);
			$timestamp = date("Y-m-d H:i:s");
						
			$sql =("INSERT INTO ticket (uid, LocationID, RoomNumber, ProblemCategory, ProblemDescription, DateCreated, Status, TechID) VALUES (($session_uid), '$building', '$roomnumber', '$typeofproblem', '$problemdescription', '$timestamp', '1', (SELECT uid FROM user WHERE location_id=$building AND position_id=1 LIMIT 1))");
			$query=mysqli_query($db,$sql);
			
			if($query)
				{
					echo "Thank You! Ticket was submited.";
				}
			// Check connection
			if ($db->connect_error) {
				die("Connection failed: " . $db->connect_error);
			}//end of if db error
		}//end of mysqli scrub
	}//end of post submit isset
?>
    <div class="container">
		<form class="form-horizontal" method="post" action="ticketsubmissionpage.php">
		   <!-- Form Name -->
			<h1 style="text-align:center;">Ticket Submission Page </h1>
		   
		   <!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="building">Building</label>  
				<div class="col-md-5"> 
					<div class="dropdown theme-dropdown clearfix">
						<select required name="building" class="form-control">
						<option value = "">Select Location</option>
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
					</div><!--end of location drop down-->
				</div><!--end of boostrap grid col-md5-->
			</div><!--end of form-group-->
			
			<!-- Password input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" for="roomnumber">Room Number</label>
			  <div class="col-md-5">
				<input required id="roomnumber" name="roomnumber" type="text" placeholder="Enter room number" class="form-control input-md" >
			  </div><!--end of boostrap grid col-md5-->
			</div><!--end of form-group-->
			
			<!-- Type of Problem input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="typeofproblem">Type of Problem</label>
				<div class="col-md-5">
					<div class="dropdown theme-dropdown clearfix">
						<select required name="typeofproblem" class="form-control">
						<option value = "">Select Problem</option>
							<?php
							$query10 = $db->prepare("select problemcategory.category_name, concat(problemcategory.category_name, ' - ',  problemsubcategory.subcategory_name) as Name from problemcategory, problemsubcategory where problemcategory.problem_id = problemsubcategory.problem_id");
							$query10->execute();
							$query10->bind_result($category_name, $name);
							while ($query10->fetch()){
							echo "<option value=\"$name\">".$name."</option>";
							}
							$query10->close();
							?> 
						</select>
					</div><!--End of dropdown-->
				</div><!--end of boostrap grid col-md5-->
			</div><!--end of form-group-->

			<!-- Problem Description input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="problemdescription">Problem Description</label>
				<div class="col-md-5">
					<input required id="problemdescription" placeholder="Enter Description of Problem" name="problemdescription" type="text" placeholder="" class="form-control input-md" >
				</div><!--end of boostrap grid col-md5-->
			</div><!--end of form-group-->
				
			<!-- Buttons to submit ticket -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="Submit"></label>
				<div class="col-md-4">
					<input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Submit" />
				</div><!--end of boostrap grid col-md4-->
			</div><!--end of form-group-->
			
			<div class="form-group">
				<label class="col-md-4 control-label" for="Cancel"></label>
				<div class="col-md-4">
				<button type="reset" name="cancel" class="btn btn-danger btn-lg btn-block">Cancel</button> 
				</div><!--end of boostrap grid col-md4-->
			</div><!--end of form-group-->
			<!-- End of button statements -->
		</form><!--End of ticket submission form -->
	</div><!-- /.container -->
<?php
include ("footer.php");
?>