<?php
/* Feedback page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("functions.php");
include ("header.php");	
include ("nav.php");

$error_msg = $success_msg = "";

//checks if form was submitted.
if(isset($_POST["submit"]))
{
	$message = get_post_value("message");
	if($message){
		//gets userid from session username
		$userid = get_userid($_SESSION['username']);
		
		//takes userid and inserts feedback info into database
		if($userid != FALSE){
			$userid = mysqli_real_escape_string($mysqli,$userid);
			$message = mysqli_real_escape_string($mysqli,$message);
			$query = "INSERT INTO feedback SET
				  userid = '$userid', 
				  feedbackdate = now(),
				  feedbackdescription = '$message'";
			$result = $mysqli -> query($query);
			if($query)
			{
				$success_msg = "Thank You! Your feedback has been recorded.";
			}
		}//end of if block
	} else {
		$error_msg = "Please enter message.";
	}
}//post submit
?>
<div class="container">
 <!-- Contact Form -->
        <div class="row">
            <div class="col-md-8">
               <h3>Send us a Message</h3>
				<?php
				//returns a message depending on success or failure
					if ($error_msg){
						echo "<div class='alert alert-danger'>$error_msg</div>";
					}
					if ($success_msg){
						echo "<div class='alert alert-success'>$success_msg</div>";
					}
				?>
				<form name="sentMessage" id="contactForm" method="post" action="feedback.php" novalidate>
                    <div class="control-group form-group">
                        <div class="controls">
						  <textarea rows="5" cols="60" class="form-control" name="message" id="message" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
                        </div>
                    </div>

                    <button type="submit" name="submit" value="submit" class="btn btn-success">Send Message</button>
                </form>
            </div>

        </div>
        <!-- /.row -->

        <hr>
</div><!--ending of container-->
<?php
include ("footer.php");
?>





