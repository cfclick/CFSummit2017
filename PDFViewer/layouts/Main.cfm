﻿<cfoutput>#html.doctype()#<html lang="en"><head>	<meta charset="utf-8">	<title>Welcome to Coldbox!</title>	<meta name="description" content="ColdBox Application Template">    <meta name="author" content="Ortus Solutions, Corp">	<!---css --->	<!---<link href="includes/css/bootstrap.min.css" rel="stylesheet">--->	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">      	<link rel="stylesheet" href="includes/MDB Free/css/bootstrap.min.css" >	<link rel="stylesheet" href="includes/MDB Free/css/mdb.min.css" >			<link rel="stylesheet" href="includes/MDB Free/css/style.css" >	<!---js --->   <!--- <script src="includes/js/jquery.js"></script>--->	<script src="includes/MDB Free/js/jquery-3.1.1.min.js" ></script>	<!---<script src="includes/js/bootstrap.min.js"></script>--->	<style>	 /* Utility */	.centered { text-align: center !important; }	.inline{ display: inline !important; }	.margin10{ margin: 10px; }	.padding10{ padding: 10px; }	.margin0{ margin: 0px; }	.padding0{ padding: 0px; }	.footer {	  margin-top: 45px;	  padding: 35px 35px;	  border-top: 1px solid ##e5e5e5;	}	.footer p {	  margin-bottom: 0;	  color: ##555;	}	body{ padding-top: 50px; }	</style></head><body data-spy="scroll">  	 <header>        <!--Navbar-->        <nav class="navbar navbar-toggleable-md navbar-dark">            <div class="container-fluid">                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="##navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">                    <span class="navbar-toggler-icon"></span>                </button>                <a class="navbar-brand" href="##">                    <strong>Navbar</strong>                </a>                <div class="collapse navbar-collapse" id="navbarNav1">                    <ul class="navbar-nav mr-auto">                        <li class="nav-item active">                            <a class="nav-link">Home <span class="sr-only">(current)</span></a>                        </li>                        <li class="nav-item">                            <a class="nav-link">Features</a>                        </li>                        <li class="nav-item">                            <a class="nav-link">Pricing</a>                        </li>                        <li class="nav-item dropdown btn-group">                            <a class="nav-link dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>                            <div class="dropdown-menu dropdown" aria-labelledby="dropdownMenu1">                                <a class="dropdown-item">Action</a>                                <a class="dropdown-item">Another action</a>                                <a class="dropdown-item">Something else here</a>                            </div>                        </li>                    </ul>                                   </div>            </div>        </nav>	    <!--/.Navbar-->    </header>		<main>		<!---Container And Views --->		<div class="container-fluid">#renderView()#</div>	</main>	<footer class="footer">		<p class="pull-right">			<a href="##"><i class="glyphicon glyphicon-arrow-up"></i> Back to top</a>		</p>		<p>			<a href="http://www.coldbox.org">ColdBox Platform</a> is a copyright-trademark software by			<a href="http://www.ortussolutions.com">Ortus Solutions, Corp</a>		</p>		<p>			Design thanks to			<a href="http://twitter.github.com/bootstrap">Twitter Boostrap</a>		</p>	</footer>   		<script src="includes/MDB Free/js/tether.min.js" ></script>	<script src="includes/MDB Free/js/bootstrap.min.js" ></script>	<script src="includes/MDB Free/js/mdb.min.js" ></script>	<script>	$(function() {		// activate all drop downs		$('.dropdown-toggle').dropdown();		// Tooltips		$("[rel=tooltip]").tooltip();	})	</script></body></html></cfoutput>