<?php
//Register Page
//BCS430W Senior Project Fall 2015
//Team Name: Iron Thrones
//Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan

	include ("header.php");	
	include ("nav.php");
	if($session_position < 2)
		header("location: ticketspage.php");
?>

<?php
	//How this dashboard page works
	//Connect to database
	include_once("db.php");
	
	
	//Execute a series of sql queries to gather data from the database
	$pie_query = "select location.locationname, count(*) as cnt from ticket, location where ticket.locationid = location.locationid group by ticket.locationid";
	
	$result = $db->query($pie_query);
	$pie_data = array();

	while(list($LocationID, $cnt ) = $result->fetch_row()) 
	{
		$pie_data[]=array($LocationID, $cnt);
	}
	//Query 2
	$query2 = "select location.locationname, count(*) as total,status from ticket, location where ticket.locationid = location.locationid group by ticket.locationid, status order by location.locationname;";
	
	$result = $db->query($query2);
	$location_data = array();
	$temp_name = "";
	$total=0;
	$open=0;
	$closed=0;
	
	while(list($name, $cnt, $status ) = $result->fetch_row()) 
	{
		if ($temp_name==""){
			$temp_name = $name;
		}
		
		if ($name != $temp_name){
			
			$location_data[]=array($temp_name,$total,$open,$closed);
			$total=0;
			$open=0;
			$closed=0;
			$temp_name=$name;
		}
		
		if($status==0){
			$closed=$cnt;
		} else{
			$open = $cnt;
		}
		
		$total=$total+$cnt;

	}
	$location_data[]=array($temp_name,$total,$open,$closed);
			
	
	//Query 3
	$query3 = "select concat(firstname, ' ', lastname) as name, count(*) as cnt, status from user, ticket where ticket.uid=user.uid group by ticket.uid, ticket.status;";
	
	$result = $db->query($query3);
	$user_data = array();
	$temp_name = "";
	$total=0;
	$open=0;
	$closed=0;
	
	while(list($name, $cnt, $status ) = $result->fetch_row()) 
	{
		if ($temp_name==""){
			$temp_name = $name;
		}
		
		if ($name != $temp_name){
			$user_data[]=array($temp_name,$total,$open,$closed);
			$total=0;
			$open=0;
			$closed=0;
			$temp_name=$name;
		}
		
		if($status==0){
			$closed=$cnt;
		} else{
			$open = $cnt;
		}
		$total=$total+$cnt;
	}
	//format the data into JSON objects
	//produce javascript data objects

	function panelHeading($tablename, $name, $icon, $class){
		global $db;
		if($tablename == 'ticket'){
			$query = "select count(*) as cnt from ticket where status=1;";
		} else{
			$query = "select count(*) as cnt from ".$tablename.";";
		}
		
		$result = $db->query($query);
		//$row = $result->fetch_assoc();
		$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
		 
		echo "<div class=\"col-lg-3 col-md-6\">";
        echo "	<div class=\"panel ".$class."\">";
        echo "      <div class=\"panel-heading\">";
        echo "          <div class=\"row\">";
        echo "              <div class=\"col-xs-3\">";
        echo "                  <i class=\"fa ".$icon." fa-5x\"></i>";
        echo "              </div>";
        echo "          <div class=\"col-xs-9 text-right\">";
        echo "      	<div class=\"huge\">".$row["cnt"]." </div>";
        echo "      	<div>".$name."</div>";
        echo "		   </div>";
        echo "   </div>";
        echo "</div>";
        echo " </div>";
        echo " </div>";
	 }
?>

	<div id="page-wrapper">
		<!--  End of Navigation -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Dashboard</h1>
			</div><!-- /.col-lg-12 -->
		</div><!-- /.row -->
		
		<div class="row">
			<?php	
			 panelHeading("user","Users","fa-users","panel-primary");
			?>
			<?php	
			 panelHeading("ticket","Open Tickets","fa-ticket","panel-yellow");
			?>
			<?php	
			 panelHeading("comment","Replies","fa-reply-all","panel-green");
			?> 
			<?php	
			 panelHeading("location","Locations","fa-bus","panel-red");
			?>
		</div><!-- /.row -->
		
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
					Pie Chart
					</div><!-- /.panel-heading -->
					<div class="panel-body">
						<div class="flot-chart">
							<div class="flot-chart-content" id="flot-pie-chart"></div>
						</div>
					</div><!-- /.panel-body -->
				</div><!-- /.panel -->
			</div>  
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
				   Ticket Information
					</div><!-- /.panel-heading -->
				   <div class="panel-body ">
						<table class="table table-bordered table-hover table-striped">
							<style type="text/css">
							.hand:hover { cursor:pointer;	}
							</style>
							<tbody>
								<tr class="hand" data-toggle="modal" data-target="#totaltickets">
									<th>Total Tickets </th>
									<td >
									<?php
									$query4 = "SELECT count(*) from ticket";
									$result = mysqli_query($db, $query4);
									$row = mysqli_fetch_row($result);
									echo $row[0];
									?>
									</td>
								</tr>
								<tr class="hand" data-toggle="modal" data-target="#totalticketsopen">
									<th>Total Tickets Open</th>
									<td>
									<?php
									$query4 = "SELECT count(*) from ticket where status = 1";
									$result = mysqli_query($db, $query4);
									$row = mysqli_fetch_row($result);
									echo $row[0];
									?>
									</td>
								</tr>
								<tr class="hand" data-toggle="modal" data-target="#totalticketsclosed">
									<th>Total Tickets Closed</th>
									<td>
									<?php
									$query5 = "SELECT count(*) from ticket where status = 0";
									$result = mysqli_query($db, $query5);
									$row = mysqli_fetch_row($result);
									echo $row[0];
									?>
									</td>
								</tr>
								<tr class="hand" data-toggle="modal" data-target="#lessthan7">
									<th>Less Than 7 Days</th>
									<td>
									<?php
									$query6 = "SELECT count(*) from ticket where DATEDIFF(NOW(),DateCreated) < 7";
									$result = mysqli_query($db, $query6);
									$row = mysqli_fetch_row($result);
									echo $row[0];
									?>
									</td>
								</tr>
								<tr  class="hand" data-toggle="modal" data-target="#over7days">
									<th>Open Over 7 Days</th>
									<td>
									<?php
									$query7 = "SELECT count(*) from ticket where status = 1 and DATEDIFF(NOW(),DateCreated) > 7";
									$result = mysqli_query($db, $query7);
									$row = mysqli_fetch_row($result);
									echo $row[0];
									?>
									</td>
								</tr>	
								<tr  class="hand" data-toggle="modal" data-target="#30days">
									<th>Open Over 30 Days</th>
									<td>
									<?php
									$query8 = "SELECT count(*) from ticket where status = 1 and DATEDIFF(NOW(),DateCreated) > 30";
									$result = mysqli_query($db, $query8);
									$row = mysqli_fetch_row($result);
									echo $row[0];
									?>
									</td>
								</tr>
								<tr class="hand">
									<th>Location with Most Tickets</th>
									<td><a href="#location">
									<?php
									$query9 = "SELECT location.LocationName FROM ticket, location
									where ticket.LocationID = location.LocationID
									GROUP BY ticket.LocationID 
									ORDER BY COUNT(ticket.LocationID) DESC LIMIT 1 ";
									$result = mysqli_query($db, $query9);
									$row = mysqli_fetch_row($result);
									echo $row[0];
									?></a>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- /.panel-body -->
				</div><!-- /.panel-default -->
			</div><!--end col-md-4-->  
		</div><!-- /.row -->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Tickets Per Location Table
					</div><!-- /.panel-heading -->
					<div class="panel-body">
						<a name="location"></a>
						<table class="table table-bordered table-hover table-striped">
							<thead>
							<tr>
								<th>Location</th>
								<th>Total Tickets</th>
								<th>Open Tickets</th>
								<th>Closed</th>
							</tr>
							</thead>
							<tbody>
							<?php
								//$location_data[]=array($temp_name,$total,$open,$closed);
								foreach ($location_data as $row){
									echo "<tr>";
									echo "<td>".$row[0]."</td>";
									echo "<td>".$row[1]."</td>";
									echo "<td>".$row[2]."</td>";
									echo "<td>".$row[3]."</td>";
									echo "</tr>";
								}
							?>
							</tbody>
						</table>
					</div><!-- /.panel-body -->
				</div><!-- /.panel -->
			</div><!--end of the class-->	
		</div><!-- /.row -->
				
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
					Technician Ticket Table
					</div><!-- /.panel-heading -->
					<div class="panel-body">
						<table class="table table-bordered table-hover table-striped">
							<thead>
							<tr>
								<th>Technician </th>
								<th>Total Tickets</th>
								<th>Open Tickets</th>
								<th>Closed</th>
							</tr>
							</thead>
							<tbody>
							<?php
								//$location_data[]=array($temp_name,$total,$open,$closed);
								foreach ($user_data as $row){
									echo "<tr>";
									echo "<td>".$row[0]."</td>";
									echo "<td>".$row[1]."</td>";
									echo "<td>".$row[2]."</td>";
									echo "<td>".$row[3]."</td>";
									echo "</tr>";
								}
							?>
							</tbody>
						</table>
					</div><!-- /.panel-body -->
				</div><!-- /.panel -->
			</div><!--end of class-->  
		</div><!--end of row-->
	</div><!-- /#page-wrapper -->

	<!-- Total Tickets Open Modal -->
	<div id="totalticketsopen" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 class="modal-title">Total Open Tickets in System</h3>
				</div><!--end of modal header-->
				<div class="modal-body">
					<?php
						include_once ("db.php");		
						// Querys the Ticket Table
						$query = "SELECT TicketID, Status, ProblemCategory, DateCreated, LocationID, uid FROM ticket ORDER BY TicketID";
						$result = $db->query($query);
					?>
					<div class=" table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
								<th class="text-center">Ticket Number</th>
								<th class="text-center">Problem Category</th>
								<th class="text-center">Date Created</th>
								</tr>
							</thead>
							<tbody>
								<?php

								while(list($TicketID, $Status , $ProblemCategory , $DateCreated, $LocationID, $uid ) = $result->fetch_row()) 
								{
								if ($Status == 1)
								{
								echo "<tr>";
								echo "<td>$TicketID</td>";
								echo "<td>$ProblemCategory</td>";
								echo "<td>$DateCreated</td>";
								echo "</tr>";
								}
								}
								?>
							</tbody>
						</table>
					</div><!--end of responsive table-->
				</div><!--end of modal body-->
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div><!-- End of modal content div-->
		</div><!-- End of modal dialog div-->
	</div> <!-- End of modal div-->

	<!-- Total Tickets Closed Modal -->
	<div id="totalticketsclosed" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Total Tickets Closed in System</h4>
				</div>
				<div class="modal-body">
					<?php
						include_once ("db.php");		
						// Querys the Ticket Table
						$query = "SELECT TicketID, Status, ProblemCategory, DateClosed, LocationID, uid FROM ticket ORDER BY TicketID";
						$result = $db->query($query);
					?>
					<div class=" table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
								<th class="text-center">Ticket Number</th>
								<th class="text-center">Problem Category</th>
								<th class="text-center">Date Closed</th>
								</tr>
							</thead>
							<tbody>
								<?php
									while(list($TicketID, $Status , $ProblemCategory , $DateClosed, $LocationID, $uid ) = $result->fetch_row()){
									if ($Status == 0)
										{
										echo "<tr>";
										echo "<td>$TicketID</td>";
										echo "<td>$ProblemCategory</td>";
										echo "<td>$DateClosed</td>";
										echo "</tr>";
										}
									}//end of while list
								?>
							</tbody>
						</table>
					</div><!--end of table responsive-->
				</div><!--end of modal body-->
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div><!-- End of modal content div-->
		</div><!-- End of modal dialog div-->
	</div> <!-- End of modal div-->

	<!-- Tickets Less than 7 Days Modal -->
	<div id="lessthan7" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Tickets Less than 7 Days in System</h4>
				</div><!--end of modal header-->
				<div class="modal-body">
					<?php
						include_once ("db.php");		
						// Querys the Ticket Table
						$query = "SELECT TicketID, Status, ProblemCategory, DateCreated, LocationID, uid FROM ticket where DATEDIFF(NOW(),DateCreated) < 7";
						$result = $db->query($query);
					?>
					<div class=" table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
								<th class="text-center">Ticket Number</th>
								<th class="text-center">Problem Category</th>
								<th class="text-center">Date Created</th>
								</tr>
							</thead>
							<tbody>
								<?php

								while(list($TicketID, $Status , $ProblemCategory , $DateCreated, $LocationID, $uid ) = $result->fetch_row()) 
								{
									echo "<tr>";
									echo "<td>$TicketID</td>";
									echo "<td>$ProblemCategory</td>";
									echo "<td>$DateCreated</td>";
									echo "</tr>";
								}
								?>
							</tbody>
						</table>
					</div><!--end of table responsive-->
				</div><!--end of modal body-->
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div><!-- End of modal content div-->
		</div><!-- End of modal dialog div-->
	</div> <!-- End of modal div-->	

	<!-- Tickets Over than 7 Days Modal -->
	<div id="over7days" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Tickets Over 7 Days in System</h4>
				</div><!--end of modal content-->
				<div class="modal-body">
					<?php
						include_once ("db.php");		
						// Querys the Ticket Table
						$query = "SELECT TicketID, Status, ProblemCategory, DateCreated, LocationID, uid FROM ticket where DATEDIFF(NOW(),DateCreated) > 7";
						$result = $db->query($query);
					?>
					<div class=" table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
								<th class="text-center">Ticket Number</th>
								<th class="text-center">Problem Category</th>
								<th class="text-center">Date Created</th>
								</tr>
							</thead>
							<tbody>
							<?php
							while(list($TicketID, $Status , $ProblemCategory , $DateCreated, $LocationID, $uid ) = $result->fetch_row()) 
							{
								if ($Status == 1)
								{
									echo "<tr>";
									echo "<td>$TicketID</td>";
									echo "<td>$ProblemCategory</td>";
									echo "<td>$DateCreated</td>";
									echo "</tr>";
								}
							}
							?>
							</tbody>
						</table>
					</div><!--end of table responsive-->
				</div><!--end of modal body-->
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div><!-- End of modal content div-->
		</div><!-- End of modal dialog div-->
	</div> <!-- End of modal div-->	

	<!-- Tickets Over than 7 Days Modal -->
	<div id="30days" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Tickets Over 30 Days in System</h4>
				</div>
				<div class="modal-body">
					<?php
						include_once ("db.php");		
						// Querys the Ticket Table
						$query = "SELECT TicketID, Status, ProblemCategory, DateCreated, LocationID, uid FROM ticket where DATEDIFF(NOW(),DateCreated) > 30";
						$result = $db->query($query);
					?>
					<div class=" table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
								<th class="text-center">Ticket Number</th>
								<th class="text-center">Problem Category</th>
								<th class="text-center">Date Created</th>
								</tr>
							</thead>
							<tbody>
								<?php
									while(list($TicketID, $Status , $ProblemCategory , $DateCreated, $LocationID, $uid ) = $result->fetch_row()) 
									{
										if ($Status == 1)
										{
											echo "<tr>";
											echo "<td>$TicketID</td>";
											echo "<td>$ProblemCategory</td>";
											echo "<td>$DateCreated</td>";
											echo "</tr>";
										}
									}
								?>
							</tbody>
						</table>
					</div><!--end of responsive table-->
				</div><!--end of modal body-->
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div><!-- End of modal content div-->
		</div><!-- End of modal dialog div-->
	</div> <!-- End of modal div-->	
				
	<!-- Total Tickets in the System -->
	<div id="totaltickets" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">All Tickets in System</h4>
				</div>
				<div class="modal-body">
					<?php
						include_once ("db.php");		
						// Querys the Ticket Table
						$query = "SELECT TicketID, Status, ProblemCategory, DateCreated, LocationID, uid FROM ticket ORDER BY TicketID";
						$result = $db->query($query);
					?>
					<div class=" table-responsive">
						<table class="table table-bordered table-hover table-striped">
							<thead>
								<tr>
								<th class="text-center">Ticket Number</th>
								<th class="text-center">Problem Category</th>
								<th class="text-center">Date Created</th>
								</tr>
							</thead>
							<tbody>
								<?php
									while(list($TicketID, $Status , $ProblemCategory , $DateCreated, $LocationID, $uid ) = $result->fetch_row()) 
									{
										echo "<tr>";
										echo "<td>$TicketID</td>";
										echo "<td>$ProblemCategory</td>";
										echo "<td>$DateCreated</td>";
										echo "</tr>";
									}
								?>
							</tbody>
						</table>
					</div><!--end of responsive table-->
				</div><!--end of modal body-->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div><!-- End of modal content div-->
		</div><!-- End of modal dialog div-->
	</div> <!-- End of modal div-->		

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Flot Charts JavaScript -->
    <script src="bower_components/flot/excanvas.min.js"></script>
    <script src="bower_components/flot/jquery.flot.js"></script>
    <script src="bower_components/flot/jquery.flot.pie.js"></script>
    <script src="bower_components/flot/jquery.flot.resize.js"></script>
    <script src="bower_components/flot/jquery.flot.time.js"></script>
    <script src="bower_components/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
   	
<script>
	$(document).ready(function() {
	//Flot Pie Chart
	var data = [
		<?php
			$comma = "";
			foreach($pie_data as $row)
			{
				echo $comma."{";
				echo "label: \"".$row[0]."\",";
				echo "data: ".$row[1]."";
				echo "}";
				$comma = ",";
			}
		?>
		];
		
			var plotObj = $.plot($("#flot-pie-chart"), data, {
				series: {
					pie: {
						show: true
					}
				},
				grid: {
					hoverable: true
				},
				tooltip: true,
				tooltipOpts: {
					content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
					shifts: {
						x: 20,
						y: 0
					},
					defaultTheme: false
				}
			});
	});
	</script>
</body>
</html>
