<?php
/*
Site User Details Page
Written by Jay Kaplan
BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("protected.php");
include ("header.php");	
include ("nav.php");

//selects user data from user table
$query1 = "SELECT email, username, location FROM user";
$result = $mysqli -> query($query1);

?>
<div class="container">

<h2 class="text-center">Site User Details</h2>
<div class="panel panel-default">
<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th class="text-center">User Email</th>
			<th class="text-center">User Name</th>
			<th class="text-center">User Location</th>
		</tr>
	</thead>
	<tbody>
	<!--Creates table for displaying user info-->
		<?php
		while(list($email, $username, $location) = $result -> fetch_row()){
			echo"<tr>
			<td>$email</td>
			<td>$username</td>
			<td>$location</td>			
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





