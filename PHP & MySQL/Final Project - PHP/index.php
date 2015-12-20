<?php
/* Index page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("header.php");	
include ("nav.php");
?>

<!-- Page Content -->
<div class="container">
    <div class="row">
       <div class="col-lg-12">
           <h1 class="page-header">
               Welcome to FSC Movie Ratings - Top 50 Movies for FSC Students
           </h1>
       </div>
<!--top row-->
		<div class="col-md-4">
       <div class="panel panel-default">
       <div class="panel-heading">
           <h4><i class="fa fa-fw fa-file-video-o"></i> Students Rate Movies
       </div>
       <div class="panel-body">
			<p>	Join with other Farmingdale students and rate along with your friends the top 50 movies for college students.</p><p>
			<a href="register.php" class="btn btn-default">Learn More</a></p>
       </div>
       </div>
		</div>
		<div class="col-md-4">
		<div class="panel panel-primary">
		<div class="panel-heading">
			<h4><i class="fa fa-fw fa-film"></i> Top Rated Movies</h4>
		</div>
		<div class="panel-body">
			<p>Select from one of the best movies over the last 30 years as ranked by students just like you. Select a movie and read or post comments!</p><p>
			<a href="movieselection.php" class="btn btn-primary">Learn More</a></p>
		</div>
		</div>
		</div>
		<div class="col-md-4">
		<div class="panel panel-success">
		<div class="panel-heading">
			<h4><i class="fa fa-fw fa-video-camera"></i> View RSS Feeds</h4>
		</div>
		<div class="panel-body" >
			<p>Check out the lastest hollywood news and gossip along with movie reviews from the industries best reviewers.</p><p>
			<a class="btn btn-success" href="http://localhost/BCS350-PROJECT/rss2.php" >Learn More</a></p>
		</div>
		</div>
		</div>
	</div>
        <!-- /.row -->
	<hr>
<div class="row">
<!--bottom row-->
		<!--These movies are hard coded to the home page-->
		<div class="col-md-4">
       <div class="panel panel-danger">
       <div class="panel-heading">
           <h4><i class="fa fa-fw fa-ticket"></i> Good Will Hunting
       </div>
       <div class="panel-body">
			<img class="img-responsive center-block img-max-height" src="images/6dvi48bm12k79u09oubc5hjjj2_19.jpg" alt=''>
			<br><a href="movieselection.php" class="btn btn-danger center-block">Learn More</a>
       </div>
       </div>
		</div>
		<div class="col-md-4">
		<div class="panel panel-danger">
		<div class="panel-heading">
			<h4><i class="fa fa-fw fa-ticket"></i> The Social Network</h4>
		</div>
		<div class="panel-body">
			<img class="img-responsive center-block img-max-height" src="images/6dvi48bm12k79u09oubc5hjjj2_22.jpg" alt=''>
			<br><a href="movieselection.php" class="btn btn-danger center-block">Learn More</a>
		</div>
		</div>
		</div>
		<div class="col-md-4">
		<div class="panel panel-danger">
		<div class="panel-heading">
			<h4><i class="fa fa-fw fa-ticket"></i> Fight Club</h4>
		</div>
		<div class="panel-body" >
			<img class="img-responsive center-block img-max-height" src="images/6dvi48bm12k79u09oubc5hjjj2_38.jpg" alt=''>
			<br><a class="btn btn-danger center-block" href="movieselection.php" >Learn More</a>
		</div>
		</div>
		</div>
	</div>
        <!-- /.row -->
</div>
<!-- /.container -->
<?php
include ("footer.php");
?>


