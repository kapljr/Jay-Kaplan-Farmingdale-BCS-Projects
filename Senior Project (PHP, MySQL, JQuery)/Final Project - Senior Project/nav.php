<!-- Navigation Page -->
<!-- BCS430W Senior Project Fall 2015
	 Team Name Iron Thrones
	 Group Members: Chris Chiuchiolo, Jonathan Locovare, Rich Henry & Jay Kaplan
-->
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.php">WUFSD Ticket System</a>
        </div><!-- end of navbar-header-->
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="http://www.wufsdticketsystem.com/index.php">Home</a></li>
				<? 
					if (!isset($_SESSION['email'])){
						echo "
						</ul>
						<ul class=\"nav navbar-nav navbar-right\">
							<li><a href=\"login.php\">Login</a></li>
							";
					}else{
							if($session_position > 0)
							echo "
							<li><a href=\"register.php\">Register</a></li>
							";
							echo "
							<li><a href=\"ticketsubmissionpage.php\">Ticket Submission</a></li>
							<li><a href=\"ticketspage.php\">Tickets</a></li>
							<li><a href=\"/phpmyfaq/\">Knowledge Base</a></li>
						</ul>
						<ul class=\"nav navbar-nav navbar-right\">
							<li class=\"active\"><a href=\"#\">Hi, $session_name</a></li>
							<li><a href=\"logout.php\">Logout</a></li>
							";
					}
				?>
						</ul>
		</div><!--/.nav-collapse -->
    </div><!--end container-fluid-->
</nav><!--End of navbar-->