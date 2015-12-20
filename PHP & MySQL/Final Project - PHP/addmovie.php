<?php
/* AddMovie page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
   
   Page uploads the file name and creats a movie in the database.
*/
include ("session.php");
include ("protected.php");
include ("adminprotect.php");
include ("functions.php");
include ("header.php");	
include ("nav.php");

//creates empty variables
$error_msg = $success_msg = "";
$moviename = "";
$moviecast = "";
$moviedescription = "";
$posterfilename = "";

$moviename_class = "";
$moviecast_class = "";
$moviedescription_class = "";
$posterfilename_class = "";

//checks if form has been submited and if empty sets to error
if(isset($_POST["submit"]))
{
	$moviename = get_post_value("moviename");
	if (!$moviename){
		$moviename_class = "error";
		
	}
	$moviecast = get_post_value("moviecast");
	if (!$moviecast){
		$moviecast_class = "error";
	}
	$moviedescription = get_post_value("moviedescription");
	if (!$moviedescription){
		$moviedescription_class = "error";
	} 

	//function returns posterfile name and returns any errors
	list($posterfilename, $posterfilename_error, $posterfilename_msg) = get_file_upload("posterfilename");
	if (!$posterfilename){
		$posterfilename_class = "error";
	}
	
	//function gets row id of movie in database
	if($moviename && $moviecast && $moviedescription && $posterfilename ){
		$rowid = add_movie($moviename, $moviedescription, $moviecast, $posterfilename);	
	} else {
		$error_msg = "Please enter required fields.";
	}
}//post submit
?>

<div class="container">
 <!-- Contact Form -->
<div class="row">
	<div class="col-md-8">
		<h3>Add Movie</h3>
		<?php
			if ($error_msg){
				echo "<div class='alert alert-danger'>$error_msg</div>";
			}
			if ($success_msg){
				echo "<div class='alert alert-success'>$success_msg</div>";
			}
		?>
	<form action='addmovie.php' enctype='multipart/form-data' method='post' name="addomvie" id="contactForm" novalidate>
			<div class="control-group form-group <?=$moviename_class?>">
				<div class="controls">
					<label>Movie Name</label>
					<input type="text" value="<?=$moviename?>" name="moviename" class="form-control" id="moviename" required data-validation-required-message="Please Enter Movie Name.">
					<p class="help-block"></p>
				</div>
			</div>			
			<div class="control-group form-group <?=$moviecast_class?>">
				<div class="controls">
					<label>Movie Cast</label>
					<textarea rows="5" cols="75" class="form-control" name="moviecast" id="moviecast" required data-validation-required-message="Enter Movie Cast" maxlength="999" style="resize:none"><?=$moviecast?></textarea>
				</div>
			</div>
			<div class="control-group form-group <?=$moviedescription_class?>">
				<div class="controls">
					<label>Movie Description</label>
					<textarea rows="10" cols="100" class="form-control"  name="moviedescription" id="moviedescription" required data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"><?=$moviedescription?></textarea>
				</div>
			</div>
			<div class="control-group form-group <?=$posterfilename_class?>">
				<div class="controls">
					<label class="btn btn-success" for="posterfilename">
					<input id="posterfilename" name="posterfilename" value="<?=$posterfilename?>" type="file" style="display:none;">
					Upload Movie Poster
					</label>
				</div>
			</div>
			<?php
				if($posterfilename){
					echo "	<div class='control-group form-group'>
							<div class='controls'>
							<img class='img-responsive' src=\"$posterfilename\" alt=''>
							</div>
							</div>";
				}
			?>
		
			<div class="form-group">
				<label class="col-md-4 control-label" for="register"></label>
				<div class="col-md-3">
				<input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Add Movie" />
				</div>
			</div><!--end of form-group-->
		
		</form>
	</div>
<form action="addmovie.php">
<div class="form-group">
<label class="col-md-4 control-label" for="register"></label>
<div class="col-md-3">
<input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Add Another Movie" />
</div>
</div>
<!-- /.row -->

        <hr>
</div><!--ending of container-->
<?php
include ("footer.php");
?>





