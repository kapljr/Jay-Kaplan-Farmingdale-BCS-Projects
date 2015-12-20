<?php
/* Movie Detail page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/ 
include ("session.php");
include ("protected.php");
include ("adminprotect.php");
include ("functions.php");
include ("header.php");	
include ("nav.php");

$error_msg = $success_msg = "";
$moviename = "";
$moviecast = "";
$moviedescription = "";
$posterfilename = "";

//page starts off with a movie preselected from the data base.
//this is hardcoded and will need to be adjusted if this movieID is ever deleted.
$selectedmovie = 31;
if(isset($_GET['selectmovie'])) 
	$selectedmovie = $_GET['selectmovie']; 
list($posterfilename, $moviename, $moviecast, $moviedescription, $movieid) = array_values(load_movie($selectedmovie));

$moviename_class = "";
$moviecast_class = "";
$moviedescription_class = "";
$posterfilename_class = "";

if(isset($_POST["submit"]) && ($_POST["submit"]=="Update Movie"))
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
	
	$image_file = get_file_upload("posterfilename");
	if($image_file){
		list($posterfilename, $posterfilename_error, $posterfilename_msg) = $image_file;
		if (!$posterfilename){
			$posterfilename_class = "error";
		}
	}//outter if statement for poster change
	
	if($moviename && $moviecast && $moviedescription && $posterfilename ){
		update_movie($movieid, $moviename, $moviedescription,$moviecast, $posterfilename);
	} else {
		$error_msg = "Please enter required fields.";
	}
}//post submit

if(isset($_POST["submit"]) && ($_POST["submit"]=="Delete Movie"))
{
  delete_movie($selectedmovie);
  header('Location: movieselection.php');
}
?>
<div class="container">
<br>
<div class="row col-md-4">
<div class="dropdown theme-dropdown clearfix dropdown-toggle input-small" data-toggle="dropdown" role="button" aria-haspopup="true">
	<form method="GET">
	<select name="selectmovie" class="form-control input-small">
		<option value = "">---Select Movie---</option>
			<?php
			$query9 = $mysqli->prepare("SELECT movieid, moviename FROM movie");
			$query9->execute();
			$query9->bind_result($movieid, $selectmoviename);
			while ($query9->fetch()){
				echo "<option value='$movieid'>".$selectmoviename."</option>";
			}
			$query9->close();
			?> 
	</select>
	<br>
	<input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Select Movie" />
	</form>
</div>
</div>
</div><!--end of container-->

<div class="container">
<!-- Change Movie Details Form -->
<div class="row">
	<div class="col-md-8">
		<h3>Change Movie Details</h3>
		<?php
			if ($error_msg){
				echo "<div class='alert alert-danger'>$error_msg</div>";
			}
			if ($success_msg){
				echo "<div class='alert alert-success'>$success_msg</div>";
			}
		?>
	<form enctype='multipart/form-data' method='post' name="addomvie" id="contactForm" novalidate>
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
					Change Movie Poster
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
			<div class="col-md-4">
			<label class="col-md-4 control-label"></label>
			<input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Update Movie" />
			</div>
			<div class="col-md-4">
			<label class="col-md-4 control-label"></label>
			<input type="submit" name="submit" class="btn btn-danger btn-lg btn-block" value="Delete Movie" />
			</div>

		</form>
	</div>

</div>
<!-- /.row -->

        <hr>
</div><!--ending of container-->
<?php
include ("footer.php");
?>





