<?php
//Register Page
//BCS430W Senior Project Fall 2015
//Team Name: Iron Thrones
//Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan

include ("header.php");	
include ("nav.php");
include_once ("session.php");
include_once ("db.php");
?>

<?php		
	//Get me all the tickets
	$query = "SELECT TicketID, Status, ProblemCategory, DateCreated, LocationID, uid, TechID FROM ticket ORDER BY TicketID";
	$result = $db->query($query);
								
	if(isset($_POST["updateTech"])) {
		$assignTech = $_POST['assignTech'];
		$update = "UPDATE ticket SET TechID = '$assignTech' WHERE TicketID = ". $_POST['ticketid'];
		mysqli_query($db, $update);
	}
	
	if(isset($_POST["CloseTicket"])){
		echo "Ticket #".$_POST['ticketid']." was closed ";
		$closeME = "UPDATE ticket SET Status = '0', DateClosed = '".date("Y-m-d H:i:s")."' WHERE TicketID = ".$_POST["ticketid"];
		mysqli_query($db, $closeME);
		$emailquery = "SELECT email FROM user WHERE uid = (SELECT uid FROM ticket WHERE TicketID = ". $_POST["ticketid"] .")";
		$teacher_email = mysqli_query($db, $emailquery)->fetch_object()->email;
		if(mail($teacher_email, "Help Desk", "Your ticket #".$_POST["ticketid"]." was closed", "From:" . $session_email))
			echo "and mail was successfully sent to ".$teacher_email;
		else
			echo "and mail failed to send to ".$techer_email;
	}
	
	if(isset($_POST["submit"]))
	{
		$message = mysqli_escape_string($db, $_POST["message"]);

		$sqlmessage = ("INSERT INTO comment ( uid, message, timestamp, ticketid) VALUES ( '$session_uid', '$message', '".date("Y-m-d H:i:s")."', '".$_POST["ticketid"]."') ");
		$query = mysqli_query($db, $sqlmessage);
		
		if($query){
			echo "Your response was sent ";
			//email response
			if($session_position > 0){
				$emailquery = "SELECT email FROM user WHERE uid = (SELECT uid FROM ticket WHERE TicketID = ". $_POST["ticketid"] .")";
				$teacher_email = mysqli_query($db, $emailquery)->fetch_object()->email;
				if(mail($teacher_email, "Help Desk", "Your ticket #".$_POST["ticketid"]." was updated", "From:" . $session_email))
					echo "and email was successfully sent to ". $teacher_email;
				else
					echo "and email failed to send to ".$teacher_email;
			}
		}
		else{
			echo "Your response was not sent";
		}
	}
	
?>

<div class="container">
<h1 style="text-align:center;">Tickets</h1>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<button type="button" class="btn btn-success">Show All Tickets</button>
<button type="button" class="btn btn-primary">Filter Closed Tickets</button>
<script>
$(document).ready(function(){
	$(".btn-success").click(function(){
        $(".collapse").collapse('show');
    });
    $(".btn-primary").click(function(){
        $(".collapse").collapse('hide');
    });
});
</script>
<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Ticket Number</th>
				<th>Status</th>
				<th>Problem Category</th>
				<th>Date Created</th>
				
			</tr>
		</thead>
		<tbody>
		<?php
		
			while(list($TicketID, $Status , $ProblemCategory , $DateCreated, $LocationID, $uid, $TechID) = $result->fetch_row()) 
			{
				if ($session_position == 3 || ($session_position == 2 && $LocationID == $session_location) || ($session_position == 1 && $TechID == $session_uid) || ($session_position == 0 && $uid == $session_uid))
	    		{ 
					if ($Status == 1)
					{
						echo "<tr class=\"hand\" data-toggle=\"modal\" data-target=\"#".$TicketID."\">";
						echo "<td>$TicketID</td>";
						echo "<td><a class='btn btn-primary' role='button' href=\"#".$TicketID."\"</a>Open</td>";
						echo "<td>$ProblemCategory</td>";
						echo "<td>$DateCreated</td>";
						//$update12 = "UPDATE ticket SET Status='0' WHERE TicketID = ".$TicketID.""; mysqli_query($db, $update12);echo "<td><input class='btn btn-primary type='submit' name='submit' value='Submit' </td>";
						echo "</tr>";	
					}
					
					if ($Status == 0)
					{
						echo "<tr class='collapse'>";
						echo "<td>$TicketID</td>";
						echo"<td><button type='button' class='btn btn-default'>Closed</button></td>";
						echo "<td>$ProblemCategory</td>";
						echo "<td>$DateCreated</td>";
						echo "</tr>";
					}
				}
			}
		?>
		</tbody>
	</table>	
   </div> <!--closing div container-->
   
   	<?php
		//creating modals
		$query2 = "SELECT TicketID, Status, ProblemCategory, ProblemDescription, DateCreated, LocationID, uid FROM ticket ORDER BY TicketID";
		$result2 = $db->query($query2);
		while(list($TicketID, $Status , $ProblemCategory, $ProblemDescription, $DateCreated, $LocationID, $uid ) = $result2->fetch_row())
		{
	?>
					<div id="<?php echo $TicketID ?>" class="modal fade" role="dialog">
					<div class="modal-dialog">
					<div class="modal-content">
					<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Ticket Preview</h4>
					</div>
					<div class="modal-body">
					<table class="table table-bordered table-hover table-striped">
					<thead>
						<tr>
							<th>Problem Category</th>
							<th>Problem Description</th>
							<th>Location</th>
							<th>Status</th>
							<th>Date Created</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td><?php echo $ProblemCategory ?></td>
						<td><?php echo $ProblemDescription ?></td>
						<td><?php 
						$locationquery = "SELECT LocationName from location WHERE LocationID = $LocationID";
						$location = $db->query($locationquery)->fetch_object()->LocationName;
						echo $location;
						?></td>
						<td><button type='button' class='btn btn-primary'>Open</button></td>
						<td><?php echo $DateCreated ?></td>
						</tr>
					</tbody>
					<table class="table table-bordered table-hover table-striped">
					<col width = "33%">
					<col width = "33%">
					<col width = "33%">
					<thead>
						<tr>
							<th>Email</th>
							<th>Comment</th>
							<th>Time Stamp</th>
						</tr>
					</thead>
					<tbody>
				<?php
				
				//Create replies section
				$replyquery = "SELECT uid as CommentUID, (SELECT email FROM user WHERE uid = CommentUID), message, timestamp FROM comment WHERE TicketID = ".$TicketID;
				$replyresult = $db->query($replyquery);
				while(list($uid, $email, $message, $timestamp) = mysqli_fetch_row($replyresult))
				{
					echo "<tr>";
					echo "<td>$email</td>";
					echo "<td>".filter_var($message, FILTER_SANITIZE_STRING) ."</td>";
					echo "<td>$timestamp</td>";
					echo "</tr>";
				}
				
				?>
					</tbody>
					</table>
					<form method="post" >
					  <input type="hidden" name="ticketid" value="<?php echo $TicketID ?>" />
					  <textarea name="message" id="textarea" class="form-control" rows="3" placeholder="Enter a response"></textarea>
					  <input class="btn btn-success" type="submit" name="submit"  value="Submit">
					  <button class="btn btn-danger" type="reset">Cancel</button>
					</form>
					
					  </div>
					  <div class="modal-footer">
					  <div class="col-md-15">
						<form method="post" >
							<input type="hidden" name="ticketid" value="<?php echo $TicketID ?>" />
							<!--input onclick="clicked(event)" name="CloseTicket" type="submit" class="btn btn-danger pull-right" value="Close Ticket" data-dismiss="modal" /-->
							<input type="submit" name="CloseTicket" onclick="return confirm('Are you sure?')" value="Close Ticket" class="btn btn-danger pull-right" />
						</form>
						</div>
						
						<?php
							if ($session_position > 0)
						{
							echo "<div class=\"form-group\">
							  <label class=\"col-md-1 control-label\" for=\"techs\">Assign to:</label>  
							  <div class=\"col-md-5\">
							  <form action=\"\" method=\"POST\">
								<input type=\"hidden\" name=\"ticketid\" value=\"$TicketID\">
								<div class=\"dropdown theme-dropdown clearfix\">
								<div id=\"select\">
									<select name=\"assignTech\" class=\"form-control\">
								<option value = \"\">---Select---</option>";
				
								$query9 = $db->query("SELECT firstname, uid from user WHERE position_id ='1'");
								while ($row = mysqli_fetch_assoc($query9)){
									echo "<option value='".$row['uid']."'>".$row['firstname']."</option>";	
								}
								echo"
								</select>
								<input onclick=\"return confirm('The ticket has been elevated.')\" type=\"submit\" name=\"updateTech\" value=\"Update Tech\" class=\"btn btn-success\">
								</form>
								</div>
								</div>
								</form>
							  </div>
							</div><!--end of evaluated-->";
						}
						?>
					  </div>
					</div>
				  </div>
				</div>
		<?php
		} //ending ticketmodal while
		?>

<!-- jQuery (necessary for JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>