<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="{metaLanguage}" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="{metaLanguage}" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="{metaLanguage}" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="{metaLanguage}" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="{metaLanguage}" class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">

    <title>{title}</title>
    <base href="{baseHref}" />

    <meta name="description" content="{metaDescription}">
    <meta name="author" content="{metaPublisher}">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
    <meta name="application-name" content="phpMyFAQ {phpmyfaqversion}">
    <meta name="robots" content="INDEX, FOLLOW">
    <meta name="revisit-after" content="7 days">

    <!-- Share on Facebook -->
    <meta property="og:title" content="{title}" />
    <meta property="og:description" content="{metaDescription}" />
    <meta property="og:image" content="" />
	
	<link rel="stylesheet" href="assets/template/{tplSetName}/css/bootstrap.min.css?v=1" media="screen">
    <link rel="stylesheet" href="assets/template/{tplSetName}/css/font-awesome.min.css?v=1">
    <link rel="stylesheet" href="assets/template/{tplSetName}/css/{stylesheet}.min.css?v=1">

    <link rel="shortcut icon" href="assets/template/{tplSetName}/favicon.ico">
    <link rel="apple-touch-icon" href="assets/template/{tplSetName}/apple-touch-icon.png">
    <link rel="canonical" href="{currentPageUrl}">

    <script src="assets/js/libs/modernizr.min.js"></script>
    <script src="assets/js/phpmyfaq.min.js"></script>

    <link rel="alternate" title="News RSS Feed" type="application/rss+xml" href="feed/news/rss.php">
    <link rel="alternate" title="TopTen RSS Feed" type="application/rss+xml" href="feed/topten/rss.php">
    <link rel="alternate" title="Latest FAQ Records RSS Feed" type="application/rss+xml" href="feed/latest/rss.php">
    <link rel="alternate" title="Open Questions RSS Feed" type="application/rss+xml" href="feed/openquestions/rss.php">
    <link rel="search" type="application/opensearchdescription+xml" title="{metaTitle}" href="{opensearch}">

</head>
<body dir="{dir}">

<!--[if lt IE 8 ]>
<div class="internet-explorer-error">
    Do you know that your Internet Explorer is out of date?<br/>
    Please use Internet Explorer 8+, Mozilla Firefox 4+, Google Chrome, Apple Safari 5+ or Opera 11+
</div>
 <![endif]-->

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" title="{header}" href="{faqHome}">{header}</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
		<li class="{activeQuickfind}">{showInstantResponse}</li>
		<li class="{activeAddContent}">{msgAddContent}</li>
		<li class="{activeAddQuestion}">{msgQuestion}</li>
		<li class="{activeOpenQuestions}">{msgOpenQuestions}</li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
		[notLoggedIn]
		<li class="{activeRegister}">{msgRegisterUser}</li>
		<li class="divider-vertical"></li>
		<li class="{activeLogin}">{msgLoginUser}</li>
		[/notLoggedIn]
		[userloggedIn]
		<li class="{activeUserControl}">{msgUserControl}</li>
		<li class="divider-vertical"></li>
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<span title="{msgFullName}">{msgLoginName}</span><b class="caret"></b>
			</a>
			<ul class="dropdown-menu">
				<li>{msgUserControlDropDown}</li>
				<li>{msgLogoutUser}</li>
			</ul>
		</li>
		[/userloggedIn]
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>

<div id="wrap"> 

<div class="row main-content">
	<div class="col-md-3"> <!-- left col -->
  
	  <div class="span3 hidden-print" id="leftContent">
				<div class="well categories">
					<ul class="nav nav-pills nav-stacked">
						<li class="home">{backToHome}</li>
						<li>{allCategories}</li>
						<li class="divider-horizontal"></li>
						{showCategories}
					</ul>
					<div class="users-online">
						<small>{userOnline}</small>
					</div>
				</div>
		</div>
	  
	</div> <!-- /left col -->
	<div class="col-md-6"> <!-- center col -->
  
		[globalSearchBox]
		<section class="well hidden-print" id="searchBox">
			<form id="search" action="{writeSendAdress}" method="get" class="form-search">
				<input type="hidden" name="searchcategory" value="{categoryId}" />
				<input type="hidden" name="action" value="search" />
				<div class="input-group">
					<input type="text" class="form-control" name="search" id="searchfield" placeholder="{searchBox} ..." autocomplete="off">
					<span class="input-group-btn">
						<button class="btn btn-primary" type="submit" name="submit">{searchBox}</button>
					</span>
				</div><!-- /input-group -->				
			</form>
			<small>{msgSearch}</small>
		</section>
		[/globalSearchBox]
		[globalSuggestBox]
		<section class="well hidden-print" id="searchBox">
			<form id="instantform" action="?action=instantresponse" method="post" class="form-search">
				<input type="hidden" name="ajaxlanguage" id="ajaxlanguage" value="{ajaxlanguage}" />
				<input type="search" name="search" id="instantfield" class="form-control" value=""
					   placeholder="{msgDescriptionInstantResponse}" autocomplete="off"/>
			</form>
			<small>{msgSearch}</small>
		</section>
		[/globalSuggestBox]
		{writeContent}
  
  
	</div> <!-- /center col -->
	<div class="col-md-3"> <!-- right col -->
        <div class="span3 hidden-print" id="rightContent">
            {rightBox}
            [stickyFaqs]
            <section class="well">
                <header>
                    <h3>{stickyRecordsHeader}</h3>
                </header>
                <ul>
                    {stickyRecordsList}
                </ul>
            </section>
            [/stickyFaqs]
        </div>
	</div>
</div>

<div id="push"></div>
</div>

<div id="footer">
	<div id="row">
		<div class="col-md-6">
			<ul class="footer-menu">
                <li>{showSitemap}</li>
                <li>{msgContact}</li>
                <li>{msgGlossary}</li>
            </ul>
		</div>
		<div class="col-md-6">
			<form  action="{writeLangAdress}" method="post">
					<span class="pull-right">
					{switchLanguages}
					</span>
					<input type="hidden" name="action" value="" />
            </form>
		</div>
	</div>
	<div id="row">
		<div class="col-md-6">
		</div>
		<div class="col-md-6">
            <p class="pull-right">{copyright}</p>
		</div>
	</div>
	
</div>


</body>
</html>