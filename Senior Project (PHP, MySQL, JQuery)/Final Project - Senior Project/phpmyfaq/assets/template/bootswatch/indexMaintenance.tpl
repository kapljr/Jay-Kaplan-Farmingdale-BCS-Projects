<!doctype html>
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

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="brand" title="{header}" href="{faqHome}">{header}</a>
            <nav class="nav-collapse">
                <ul class="nav pull-right">
                    [notLoggedIn]
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
            </nav>
        </div>
    </div>
</div>

<section id="content">
    <div class="container">
        <div class="row-fluid">
            <div class="well maintenance">
                <h1>Sorry, we'll be back soon!</h1>
            </div>
        </div>
    </div>
</section>

<footer id="footer" class="container-fluid">
    <div class="row">
        <p class="copyright pull-right">
        {copyright}
        </p>
    </div>
</footer>

</body>
</html>