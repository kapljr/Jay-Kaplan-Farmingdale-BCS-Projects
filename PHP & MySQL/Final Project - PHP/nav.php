<!--
Nav bar that reacts based on if the user is the admin or not admin.
Written by: Jay R. Kaplan
BCS 350 - Semester Project 12/8/2015
-->
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.php">FSC Movie Rating</a>
        </div>
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
			<?php
			if(isset($_SESSION['username'])){
				if ($_SESSION['username'] == 'admin'){
					echo "<li><a href=\"addmovie.php\">Add Movie</a></li>";
					echo "<li><a href=\"moviedetail.php\">Movie Details</a></li>";
					echo "<li><a href=\"siteuserdetails.php\">View Users</a></li>";
					echo "<li><a href=\"viewusercomments.php\">View Comments</a></li>";
					echo "<li><a href=\"viewfeedback.php\">View Feedback</a></li>";
					echo "<li><a href=\"aboutus.php\">ReadMe</a></li>";
				} else {
					echo "<li class=\"active\"><a href=\"index.php\">Home</a></li>";
					echo "<li><a href=\"movieselection.php\">Select Movie</a></li>";
					echo "<li><a href=\"movierating.php\">Rate Movie</a></li>";
					echo "<li><a href=\"feedback.php\">Feedback</a></li>";
					echo "<li><a href=\"userdetails.php\">My Profile</a></li>";
				}
				echo "<li><a href=\"logoff.php\">Logout</a></li>";
			} else {
				echo "<li><a href=\"login.php\">Login</a></li>";
				echo "<li><a href=\"register.php\">Register</a></li>";
			} 
			echo "<li><a href=\"rss2.php\">RSS Feeds</a></li>";
			?>
			</ul>
		</div><!--/.nav-collapse -->
    </div>
</nav>

<!-- Image Background Page Header -->
<!-- background image is set in the css file. -->
<header class="business-header">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="tagline">Top 50 Movies for FSC Students</h1>
			</div>
		</div>
	</div>
</header>