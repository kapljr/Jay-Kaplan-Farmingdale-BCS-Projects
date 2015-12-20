<?php
/* Movie Selection Page
   Written by: Jay R. Kaplan
 BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("protected.php");
include ("header.php");	
include ("nav.php");

//selects data from the movie table database
$query1 = "SELECT posterfilename, moviename, moviecast, moviedescription, movieid from movie";
$result = $mysqli -> query($query1);
?>
<div class="container">

<!-- Page Heading/Breadcrumbs -->
<div class="row">
<div class="col-lg-12">
<h2 class="page-header">Top 50 Movies for College Students</h2>
</div>
</div>
<!-- /.row -->

<!-- Projects Row -->
<div class="row ">
<div class="panel panel-default">
<table class="table" >
	<tbody>
		<?php
		$count = 0;
		//display that data inside of a panel inside of tables. Extra data is being fetched here but not used based on different
		//testing scenarios of how it appears. This was the ultimate final decision to only display the movie image.
		//But can be changed in the future easily.
		while(list($posterfilename, $moviename, $moviecast, $moviedescription, $movieid) = $result -> fetch_row())
		{
			if($count%3 == 0){echo "<tr>";}
			$count++;
			echo"<td class=\"col-md-4\">
			<div class=\"panel panel-danger \">
			<div class=\"panel-heading text-center\"><strong><h4>$moviename</h4></strong></div>
			<div class=\"panel-body \"><a href=\"movierating.php?selectmovie=$movieid&submit=Select+Movie\">
			<img class=\"img-responsive center-block img-max-height\" src=\"$posterfilename\" alt=''></a></div></div>
			</td>";
			if($count%3 == 0){echo "</tr>";}
		}
		?>
	</tbody>
</table>
</div><!--closing of panel for table-->
</div>
<!-- /.row -->
</div>
</div><!--ending of container-->
<?php
include ("footer.php");
?>