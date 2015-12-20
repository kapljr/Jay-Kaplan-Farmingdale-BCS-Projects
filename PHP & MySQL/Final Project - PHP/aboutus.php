<?php
/* ReadMe page
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("header.php");	
include ("nav.php");
?>

<!-- Page Content -->

<div class="container">

<!-- Page Heading/Breadcrumbs -->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Documentation for Building This Website.
		</h1>
	</div>
</div>
<!-- /.row -->

<!-- Content Row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Data Flow Diagram - Admin (pdf)
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="readme/admin.pdf">Admin Data Flow Diagram</a>
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Data Flow Diagram - Users (pdf)</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="readme/user.pdf">User Data Flow Diagram</a>
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Entity Relationship Diagram</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="readme/ERD_phpProject.pdf">Entity Relationship Diagram</a>
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Website User Stories</a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="readme/userstories.txt">User Stories (txt)</a>
					</div>
				</div>
			</div>
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Web Building Notes</a>
					</h4>
				</div>
				<div id="collapseFive" class="panel-collapse collapse">
					<div class="panel-body">
						<a href="readme/webbuildingnotes.txt">Web Building Notes (txt)</a>
					</div>
				</div>
			</div>
			<!-- /.panel -->
				</div>
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.panel-group -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<hr>

<!-- /.container -->
<?php
include ("footer.php");
?>


