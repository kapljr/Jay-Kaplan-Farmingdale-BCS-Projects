<?php
/*
View Feedback Page
Written by Jay Kaplan
BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("protected.php");
include ("adminprotect.php");
include ("header.php");	
include ("nav.php");

//query pulls all feedback data from website.
$query1 = "select user.username, feedback.feedbackdate, feedback.feedbackdescription from user, feedback where user.userid = feedback.userid;";
$result = $mysqli -> query($query1);

?>
<div class="container">

<h2 class="text-center">View All Site Feedback</h2>
<div class="panel panel-default">
<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th class="text-center">Feedback date</th>
			<th class="text-center">User Name</th>
			<th class="text-center">Feedback Comment</th>
		</tr>
	</thead>
	<tbody>
	<!--while loop that fetches comment data and displays in a table-->
		<?php
		while(list($username, $date, $comment) = $result -> fetch_row()){
			echo"<tr>
			<td>$date</td>
			<td>$username</td>
			<td>$comment</td>			
			</tr>";
		}
		?>
	</tbody>
</table>
</div><!--closing of panel for table-->
</div><!-- /container -->
<?php
include ("footer.php");
?>