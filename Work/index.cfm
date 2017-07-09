<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
		<!-- Latest compiled and minified CSS -->
		<!---<link rel="stylesheet" 
		      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
		      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
		      crossorigin="anonymous">--->
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">      
		<link rel="stylesheet" href="../MDB Free/css/bootstrap.min.css" >
		<link rel="stylesheet" href="../MDB Free/css/mdb.min.css" >		
		<link rel="stylesheet" href="../MDB Free/css/style.css" >		
		
		
		
		
		<!---<script>
			$(document).ready(function(){
				var docViewer = $("#documentViewer_pageContent");
				//coordinates
				var x1 = $("#x1");
				var y1 = $("#y1");
				var x2 = $("#x2");
				var y2 = $("#y2");
				var r_x1 = $("#r_x1");
				var r_y1 = $("#r_y1");
				var r_x2 = $("#r_x2");
				var r_y2 = $("#r_y2");
				var src_file = $("#src_file");
				var dest_name = $("#dest_name");
				var stamp_type = $("#stamp_type");
				
				//buttons
				var submit_stamp = $("#submit_stamp");
				var submit_redact = $("#submit_redact");
				
				var myIframe = $('#myIframe');
				myIframe.attr('src', 'http://localhost:8500/PDFStuff/pdfStamp/src/blank.pdf');
				
				submit_stamp.on('click',function(e){
					var mydata = {
						src:src_file.val()
						,des:dest_name.val()
						,x1:x1.val()
						,y1:y1.val()
						,x2:x2.val()
						,y2:y2.val()
						,page:1
						,type:stamp_type.val()
					};
					$.ajax({
						url: "http://localhost:8500/PDFStuff/PDFStamp/ManagePDF.cfc?method=addStamp",
						cache: false,
						data: mydata,
						dataType: "json",
						beforeSend: function( xhr ) {
							myIframe.attr('src','');
						}
					}).done(function( html ) {
							myIframe.attr('src', 'http://localhost:8500/PDFStuff/pdfStamp/des/' + html.des);
					});
				});
				
				submit_redact.on('click',function(e){
					var mydata = {
						src:src_file.val()
						,des:dest_name.val()
						,x1:r_x1.val()
						,y1:r_y1.val()
						,x2:r_x2.val()
						,y2:r_y2.val()
						,page:1
						,type:stamp_type.val()
					};
					$.ajax({
						url: "http://localhost:8500/PDFStuff/PDFStamp/ManagePDF.cfc?method=redact",
						cache: false,
						data: mydata,
						dataType: "json",
						beforeSend: function( xhr ) {
							myIframe.attr('src','');
						}
					}).done(function( html ) {
							myIframe.attr('src', 'http://localhost:8500/PDFStuff/pdfStamp/des/' + html.des);
					});
				});
				
				drawRec = function (){
				//Position parameters used for drawing the rectangle
				var x = x1.val();
				var y = y1.val();
				var width = x2.val()- x;
				var height = y2.val() - y;
				
				var canvas = document.createElement('canvas'); //Create a canvas element
				//Set canvas width/height
				canvas.style.width='100%';
				canvas.style.height='100%';
				//Set canvas drawing area width/height
				canvas.width = window.innerWidth;
				canvas.height = window.innerHeight;
				//Position canvas
				canvas.style.position='absolute';
				canvas.style.left=0;
				canvas.style.top=0;
				canvas.style.zIndex=100000;
				canvas.style.pointerEvents='none'; //Make sure you can click 'through' the canvas
				document.body.appendChild(canvas); //Append canvas to body element
				var context = canvas.getContext('2d');
				//Draw rectangle
				context.rect(x, y, width, height);
				context.fillStyle = 'yellow';
				context.fill();
			}
			})
			
			
		</script>--->
		<!-- Template styles -->
    <style rel="stylesheet">
        /* TEMPLATE STYLES */
        
        main {
            padding-top: 3rem;
            padding-bottom: 2rem;
        }
        
        .widget-wrapper {
            padding-bottom: 2rem;
            border-bottom: 1px solid #e0e0e0;
            margin-bottom: 2rem;
        }
        
        .extra-margins {
            margin-top: 1rem;
            margin-bottom: 2.5rem;
        }
        
        .divider-new {
            margin-top: 0;
        }
        
          .navbar {
            background-color: #414a5c;
        }
        
        footer.page-footer {
            background-color: #414a5c;
            margin-top: 2rem;
        }
    </style>
	</head>
	<body>
		<!---<cfdirectory action="list" directory="C:/ColdFusion2016/cfusion/wwwroot/PDFStuff/pdfStamp/src" 
		             name="src_dir" filter="*.pdf">
		             --->
	

    <header>

        <!--Navbar-->
        <nav class="navbar navbar-toggleable-md navbar-dark">
            <div class="container">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <strong>Navbar</strong>
                </a>
                <div class="collapse navbar-collapse" id="navbarNav1">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">Pricing</a>
                        </li>
                        <li class="nav-item dropdown btn-group">
                            <a class="nav-link dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                            <div class="dropdown-menu dropdown" aria-labelledby="dropdownMenu1">
                                <a class="dropdown-item">Action</a>
                                <a class="dropdown-item">Another action</a>
                                <a class="dropdown-item">Something else here</a>
                            </div>
                        </li>
                    </ul>
                   
                </div>
            </div>
        </nav>
	    <!--/.Navbar-->

    </header>

    <main>

        <!--Main layout-->
        <div class="container-fluid">
            <div class="row">

                <!--Sidebar-->
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.2s">

                    <div class="widget-wrapper">
                    	 <form>
						  <div class="file-field">
						    <div class="btn btn-primary btn-sm">
						        <span>Choose file</span>
						        <input type="file">
						    </div>
						    <!---<div class="file-path-wrapper">
						       <input class="file-path validate" type="text" placeholder="Upload your file">
						    </div>--->
						  </div>
						</form>
                        <h4>Categories:</h4>
                        <br>
                        <div class="list-group">
						    <a href="#" class="list-group-item active">
						        Preview
						    </a>
						    <a href="#" class="list-group-item list-group-item-action">Read Metadata</a>
						    <a href="#" class="list-group-item list-group-item-action">Export Metadata</a>
						    <a href="#" class="list-group-item list-group-item-action">Import Metadata</a>
						    <a href="#" class="list-group-item list-group-item-action">Sanitize</a>
						    <a href="#" class="list-group-item list-group-item-action">Password Protect</a>
						    <a href="#" class="list-group-item list-group-item-action disabled">Digital Signature</a>
						</div>
                        
                    </div>

                    <!---<div class="widget-wrapper wow fadeIn" data-wow-delay="0.4s">
                        <h4>Subscription form:</h4>
                        <br>
                        <div class="card">
                            <div class="card-block">
                                <p><strong>Subscribe to our newsletter</strong></p>
                                <p>Once a week we will send you a summary of the most useful news</p>
                                <div class="md-form">
                                    <i class="fa fa-user prefix"></i>
                                    <input type="text" id="form1" class="form-control">
                                    <label for="form1">Your name</label>
                                </div>
                                <div class="md-form">
                                    <i class="fa fa-envelope prefix"></i>
                                    <input type="text" id="form2" class="form-control">
                                    <label for="form2">Your email</label>
                                </div>
                                <button class="btn btn-default">Submit</button>

                            </div>
                        </div>
                    </div>
--->
                </div>
                <!--/.Sidebar-->

                <!--Main column-->
                <div class="col-lg-8">

                    <!--First row-->
                    <div class="row wow fadeIn" data-wow-delay="0.4s">
                        <div class="col-lg-12">
                           <!--- <div class="divider-new">
                                <h2 class="h2-responsive">What's new?</h2>
                            </div>--->
                            
                            
                            
                            <!--Carousel Wrapper-->
                            <iframe id="myIframe" height="800" width="100%" src="SpeakerFormCFSummit2017.pdf">
							</iframe>		
                           <!--/.Carousel Wrapper-->
                        </div>
                    </div>
                    <!--/.First row-->
                    <br>
                    <hr class="extra-margins">

                   

                </div>
                <!--/.Main column-->

            </div>
        </div>
        <!--/.Main layout-->

    </main>

    <!--Footer-->
   <!--- <footer class="page-footer center-on-small-only">

        <!--Footer Links-->
        <div class="container-fluid">
            <div class="row">

                <!--First column-->
                <div class="col-md-3 offset-lg-1 hidden-lg-down">
                    <h5 class="title">ABOUT MATERIAL DESIGN</h5>
                    <p>Material Design (codenamed Quantum Paper) is a design language developed by Google. </p>

                    <p>Material Design for Bootstrap (MDB) is a powerful Material Design UI KIT for most popular HTML, CSS, and JS framework - Bootstrap.</p>
                </div>
                <!--/.First column-->

                <hr class="hidden-md-up">

                <!--Second column-->
                <div class="col-lg-2 col-md-4 offset-lg-1">
                    <h5 class="title">First column</h5>
                    <ul>
                        <li><a href="#!">Link 1</a></li>
                        <li><a href="#!">Link 2</a></li>
                        <li><a href="#!">Link 3</a></li>
                        <li><a href="#!">Link 4</a></li>
                    </ul>
                </div>
                <!--/.Second column-->

                <hr class="hidden-md-up">

                <!--Third column-->
                <div class="col-lg-2 col-md-4">
                    <h5 class="title">Second column</h5>
                    <ul>
                        <li><a href="#!">Link 1</a></li>
                        <li><a href="#!">Link 2</a></li>
                        <li><a href="#!">Link 3</a></li>
                        <li><a href="#!">Link 4</a></li>
                    </ul>
                </div>
                <!--/.Third column-->

                <hr class="hidden-md-up">

                <!--Fourth column-->
                <div class="col-lg-2 col-md-4">
                    <h5 class="title">Third column</h5>
                    <ul>
                        <li><a href="#!">Link 1</a></li>
                        <li><a href="#!">Link 2</a></li>
                        <li><a href="#!">Link 3</a></li>
                        <li><a href="#!">Link 4</a></li>
                    </ul>
                </div>
                <!--/.Fourth column-->

            </div>
        </div>
        <!--/.Footer Links-->

        <hr>

        <!--Call to action-->
        <div class="call-to-action">
            <h4>Material Design for Bootstrap</h4>
            <ul>
                <li>
                    <h5>Get our UI KIT for free</h5></li>
                <li><a target="_blank" href="http://mdbootstrap.com/getting-started/" class="btn btn-info" rel="nofollow">Sign up!</a></li>
                <li><a target="_blank" href="http://mdbootstrap.com/material-design-for-bootstrap/" class="btn btn-primary" rel="nofollow">Learn more</a></li>
            </ul>
        </div>
        <!--/.Call to action-->

        <!--Copyright-->
        <div class="footer-copyright">
            <div class="container-fluid">
                © 2015 Copyright: <a href="http://www.MDBootstrap.com"> MDBootstrap.com </a>

            </div>
        </div>
        <!--/.Copyright-->

    </footer>
   ---> <!--/.Footer-->
	
		<!---<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<form>
					    <div class="file-field">
					        <div class="btn btn-primary btn-sm">
					            <span>Choose file</span>
					            <input type="file">
					        </div>
					        <div class="file-path-wrapper">
					           <input class="file-path validate" type="text" placeholder="Upload your file">
					        </div>
					    </div>
					</form>
				<div class="col-md-8">
					<iframe id="myIframe" height="100%" width="100%" src="">
					</iframe>					
				</div>
			</div>
		</div>
		--->
		<script src="../MDB Free/js/jquery-3.1.1.min.js" ></script>
		<script src="../MDB Free/js/tether.min.js" ></script>
		<script src="../MDB Free/js/bootstrap.min.js" ></script>
		<script src="../MDB Free/js/mdb.min.js" ></script>
		
		
		 <script>
    new WOW().init();
    </script>
	</body>
</html>