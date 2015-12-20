<?php
/* Connect to MySQL and the Database
   Written by: Jay R. Kaplan
   BCS 350 - Semester Project 12/8/2015
*/
include ("header.php");	
include ("nav.php");
?>

<!-- Page Content -->
<div class="container">
<?php
$feed = simplexml_load_file('http://www.cinemablend.com/rss_review.php');

foreach ($feed->channel->item as $item) {
  $title       = (string) $item->title;
  $description = (string) $item->description;

  print '<div>';

  printf(
    '<h2>%s</h2><p>%s</p>', 
    $title, 
    $description
  );

  if ($media = $item->children('media', TRUE)) {
    if ($media->content->thumbnail) {
      $attributes = $media->content->thumbnail->attributes();
      $imgsrc     = (string)$attributes['url'];

      printf('<div><img src="%s" alt="" /></div>', $imgsrc);
    }
  }

  echo '</div>';
}

?>
</div>
<!-- /.container -->
<?php
include ("footer.php");
?>


