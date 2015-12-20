<?php
/* Connect to MySQL and the Database
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
include ("session.php");
include ("header.php");	
include ("nav.php");
?>

<!-- Page Content -->
<div class="container">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">RSS Feeds
		</h1>
	</div>
</div>
<!--Googled how to read rss data into php and found this website: http://bavotasan.com/2010/display-rss-feed-with-php/
	borrowed the open source code from this site.-->
<?php
	$rss = new DOMDocument();
	$rss->load('http://www.cinemablend.com/rss.php');
	$feed = array();
	foreach ($rss->getElementsByTagName('item') as $node) {
		$item = array ( 
			'title' => $node->getElementsByTagName('title')->item(0)->nodeValue,
			'desc' => $node->getElementsByTagName('description')->item(0)->nodeValue,
			'link' => $node->getElementsByTagName('link')->item(0)->nodeValue,
			'date' => $node->getElementsByTagName('pubDate')->item(0)->nodeValue,
			);
		array_push($feed, $item);
	}
	$limit = 5;
	for($x=0;$x<$limit;$x++) {
		$title = str_replace(' & ', ' &amp; ', $feed[$x]['title']);
		$link = $feed[$x]['link'];
		$description = $feed[$x]['desc'];
		$date = date('l F d, Y', strtotime($feed[$x]['date']));
		echo '<p><strong><a href="'.$link.'" title="'.$title.'">'.$title.'</a></strong><br />';
		echo '<small><em>Posted on '.$date.'</em></small></p>';
		echo '<p>'.$description.'</p>';
	}
?>
</div>
<!-- /.container -->
<?php
include ("footer.php");
?>


