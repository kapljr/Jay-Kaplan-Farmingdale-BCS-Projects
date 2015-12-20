<?php
/* Movie Rating page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("protected.php");
include ("functions.php");
include ("header.php");	
include ("nav.php");

$selectedmovie = 31;
if(isset($_GET['selectmovie'])) 
	$selectedmovie = $_GET['selectmovie'];
?>
<div class="container">
<br>
<div class="row col-md-4">
<div class="dropdown theme-dropdown clearfix dropdown-toggle input-small" data-toggle="dropdown" role="button" aria-haspopup="true">
	<form method="GET">
	<select name="selectmovie" class="form-control input-small">
		<option value = "">---Select Movie---</option>
			<?php
			//Selects the movie id and binds it to the movie name in order to use in the drop down panel on the page.
			$query9 = $mysqli->prepare("SELECT movieid, moviename FROM movie");
			$query9->execute();
			$query9->bind_result($movieid, $moviename);
			while ($query9->fetch()){
				echo "<option value='$movieid'>".$moviename."</option>";
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

<?php
if(isset($selectedmovie)){
$query1 = "SELECT posterfilename, moviename, moviecast, moviedescription, movieid from movie where movieid = $selectedmovie";
$result = $mysqli -> query($query1);
list($posterfilename, $moviename, $moviecast, $moviedescription, $movieid) = $result -> fetch_row();
}
?>
<div class="container">
<!-- Content Row -->
<br>
<div class="row ">
	<!-- Movie Post -->
	<div class="col-md-4">
	<!-- Preview Image -->
	<img class="img-responsive center-block" src="<?=$posterfilename?>" alt="">
	</div> <!--ending of poster block-->
	<!-- Post Content -->
 <!-- Service Tabs -->
	<div class="col-md-8">
	<h2><strong><?=$moviename?></strong></h2>
	<ul id="myTab" class="nav nav-tabs nav-justified">
		<li class="active"><a href="#service-one" data-toggle="tab"><i class="fa fa-film"></i> Movie Description</a>
		</li>
		<li class=""><a href="#service-two" data-toggle="tab"><i class="fa fa-ticket"></i> Movie Cast</a>
		</li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="service-one">
			<h4><?=$moviename?> - Movie Description</h4>
			<p><?=$moviedescription?></p>
		</div>
		<div class="tab-pane fade" id="service-two">
			<h4><?=$moviename?> - Movie Cast</h4>
			<p><?=$moviecast?></p>
		</div>
	</div><!--end of tabbed content-->

	</div><!--end of col-md-8-->
	</div><!--end of row for picture and content-->
</div><!--end of container for this row-->
<hr>
<div class="container">
<!--php for form-->
<?php

$error_msg = $success_msg = "";
if(isset($selectedmovie)){
if(isset($_POST['submit']) && ($_POST['submit']=='Submit Comment'))
{
	$formcomment = get_post_value('formcomment');
	$formrating = get_post_value('formrating');
	$formcomment = mysqli_real_escape_string($mysqli,$formcomment);
	if($formcomment){
		$userid = get_userid($_SESSION['username']);
			
		if($userid != FALSE){
			$query = "INSERT INTO comment set
						userid = '$userid',
						commentdate = now(),
						movieid = $selectedmovie,
						rating = '$formrating',
						comment = '$formcomment'";
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
}//if isset on selected movie
?>
<!-- Movie Comments -->
<div class="well">
	<h4>Leave a Comment:</h4>
	<?php
		if ($error_msg){
			echo "<div class='alert alert-danger'>$error_msg</div>";
		}
		if ($success_msg){
			echo "<div class='alert alert-success'>$success_msg</div>";
		}
	?>
	<form method="POST" role="form">
		<div class="form-group">
			<textarea name="formcomment" class="form-control" rows="3"></textarea>
		</div>
		<h4>Select Rating</h4>
		<div class="row col-sm-3" style="margin-right:15px;">
		<div class="dropdown theme-dropdown clearfix dropdown-toggle input-small" data-toggle="dropdown" role="button" aria-haspopup="true">
			<select name="formrating" class="form-control input-small text-center" value="<?php echo $formrating;?>>
				<option value = "">Select Movie Rating</option>
				<option value = "1">1</option>
				<option value = "2">2</option>
				<option value = "3">3</option>
				<option value = "4">4</option>
				<option value = "5">5</option>
				<option value = "6">6</option>
				<option value = "7">7</option>
				<option value = "8">8</option>
				<option value = "9">9</option>
				<option value = "10">10</option>
			</select> 
		</div>
		</div>
		<input name="submit" value="Submit Comment"  type="submit" class="btn btn-success "></input>
	</form>
</div><!--end of well-->
</div><!--end of container-->
<div class="container">
<?php
if(isset($selectedmovie)){
$query1 = "SELECT commentdate, commentid, comment, movieid, rating, userid from comment where movieid = $selectedmovie";
$result = $mysqli -> query($query1);
	while(list($commentdate, $commentid, $comment, $movieid, $rating, $userid) = $result -> fetch_row()){
		//<!-- Posted Comments -->
		echo "<div class=\"panel panel-default\">
			  <div class=\"panel-heading\">
			  <h3 class=\"panel-title\">Comment by:   ";
		echo $_SESSION['username'];
		echo "</h3>
			  <small>$commentdate</small>
			  </div>
			  <div class=\"panel-body\">$comment</div>
			  <div class=\"panel-footer\">Rating: $rating</div>
			  </div>";
	}//end of while loop
}//end of if isset
?><!--end of php-->
</div>
</div><!-- /.container -->
<?php
include ("footer.php");
?>





