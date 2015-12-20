<?php
/*
View User Comments Page
Written by Jay Kaplan
BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("protected.php");
include ("adminprotect.php");
include ("header.php");	
include ("nav.php");

//query is used to pull user data from database and display all in one table
$query1 = "select user.username, movie.moviename, comment.rating, comment.commentdate, comment.comment from comment, movie, user where user.userid = comment.userid and movie.movieid = comment.movieid";
$result = $mysqli -> query($query1);

?>
<div class="container">

<h2 class="text-center">View All User Comments</h2>
<div class="panel panel-default">
<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th class="text-center">Movie Title</th>
			<th class="text-center">Movie Rating</th>
			<th class="text-center">User</th>
			<th class="text-center">Comment</th>
			<th class="text-center">Comment Date</th>
		</tr>
	</thead>
	<tbody>
	
<!--
php while loop that fetches each row of comments
-->			<?php
		while(list($username, $moviename, $rating, $commentdate, $comment) = $result -> fetch_row()){
			echo"<tr>
			<td>$moviename</td>
			<td>$rating</td>
			<td>$username</td>	
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