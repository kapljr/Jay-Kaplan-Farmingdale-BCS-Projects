<?php
/*
User Details Page
Written by Jay Kaplan
BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("protected.php");
include ("functions.php");
include ("header.php");	
include ("nav.php");
//query 1 selects user information based on session id
$query1 = "select username, email, location, password from user where username = '" . ($_SESSION['username']) . "'"; 
$result = $mysqli -> query($query1);
$row = $result -> fetch_array(MYSQLI_ASSOC);
$userid = get_userid($_SESSION['username']);

//query 2 selects that users comment history and displays on the page
$query2 = "select movie.moviename, comment.rating, comment.comment, comment.commentdate from movie, comment where comment.movieid = movie.movieid and $userid = comment.userid";
$result = $mysqli -> query($query2);
?>
<div class="container">
<form class="form-horizontal" method="post" action="register.php">
<!-- Form Name -->
	<h2 class="text-center">User Details</h2>
<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="username">User Name</label> 
	<div class="col-md-5">
	<input id="username" value="<?php echo $_SESSION['username'];?>" name="username" type="text" placeholder="" class="readonly form-control input-md" disabled>
	</div>
</div><!--end of form-group-->
<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="email">Email</label>  
	<div class="col-md-5">
	<input id="email" value="<?php echo $row['email'];?>" name="email" type="text" placeholder="" class="form-control readonly input-md" disabled>
	</div>
</div><!--end of form-group-->
<!-- Text input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="location">Location</label>  
	<div class="col-md-5">
	<input id="location" value="<?php echo $row['location'];?>"name="location" type="text" placeholder="" class="form-control input-md" disabled>
	</div>
</div><!--end of form-group-->
<!-- Password input-->
<div class="form-group">
	<label class="col-md-4 control-label" for="password">Password</label>
	<div class="col-md-5">
	<input id="password" name="password" value="<?php echo $row['password'];?>" type="text" placeholder="" class="form-control input-md" disabled>
	</div>
</div><!--end of form-group-->
</form><!--end of form-->
</div>
<br><br><br>
<div class="container">
<h2 class="text-center">User Comments</h2>
<div class="panel panel-default">
<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th class="text-center">Movie Title</th>
			<th class="text-center">Rating</th>
			<th class="text-center">Comment</th>
			<th class="text-center" >Comment Date</th>
		</tr>
	</thead>
	<tbody>
		<?php
		while(list($moviename, $rating, $comment, $commentdate) = $result -> fetch_row()){
			echo"<tr>
			<td>$moviename</td>
			<td>$rating</td>
			<td>$comment</td>		
			<td>$commentdate</td>				
			</tr>";
		}
		?>
	</tbody>
</table>
</div><!--closing of panel for table-->
</div><!-- /.container -->
<?php
include ("footer.php");
?>





