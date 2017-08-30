<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="includes/css/fileupload/jquery.fileupload.css">
<link rel="stylesheet" href="includes/css/fileupload/jquery.fileupload-ui.css">
<!-- CSS adjustments for browsers with JavaScript disabled -->
<noscript><link rel="stylesheet" href="includes/css/fileupload/jquery.fileupload-noscript.css"></noscript>
<noscript><link rel="stylesheet" href="includes/css/fileupload/jquery.fileupload-ui-noscript.css"></noscript>

<div class="container ">
	<!--First row-->
	<div class="row wow fadeIn" data-wow-delay="0.2s">
		<div class="col-md-12">
			<ul class="animated fadeInUp">
				<li>
					<h1 class="h1-responsive font-bold">
						My Acrobat ColdFusion Way
					</h1>
				</li>
				<li>
					<p>
						The most powerful and free PDF Sercvice for YOU!
					</p>
				</li>
				<li>
					<a target="_blank" href="https://mdbootstrap.com/getting-started/" 
					   class="btn btn-primary btn-lg" rel="nofollow">
						Sign up!
					</a>
					<a target="_blank" href="https://mdbootstrap.com/material-design-for-bootstrap/" 
					   class="btn btn-default btn-lg" rel="nofollow">
						Learn more
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!--/.First row-->
	<hr class="extra-margins">
	
	<!--Second row-->
	<div class="row">
		<!--First columnn-->
		<div class="col-lg-4">
			<!--Card-->
			<div class="card wow fadeIn" data-wow-delay="0.2s">
			
				<!--Card image-->
				<img class="img-fluid" 
				     src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/4-col/img%20(3).jpg" 
				     alt="Card image cap">
				
				<!--Card content-->
				<div class="card-body">
					<!--Title-->
					<h4 class="card-title">
						This is title
					</h4>
					<!--Text-->
					<p class="card-text">
						Some quick example text to build on the card title and make up the bulk of the card's content.
					</p>
					<a href="#" id="upload_pdf_btn" class="btn btn-info" data-toggle="modal" data-target="#fileUploadModal">Upload PDF</a>
				</div>
			</div>
			<!--/.Card-->
		</div>
		<!--First columnn-->
		<!--Second columnn-->
		<div class="col-lg-4">
			<!--Card-->
			<div class="card wow fadeIn" data-wow-delay="0.4s">
			
				<!--Card image-->
				<img class="img-fluid" 
				     src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/4-col/img%20(1).jpg" 
				     alt="Card image cap">
				
				<!--Card content-->
				<div class="card-body">
					<!--Title-->
					<h4 class="card-title">
						This is title
					</h4>
					<!--Text-->
					<p class="card-text">
						Some quick example text to build on the card title and make up the bulk of the card's content.
					</p>
					<a href="#" class="btn btn-info">Merge PDFs</a>
				</div>
			</div>
			<!--/.Card-->
		</div>
		<!--Second columnn-->
		<!--Third columnn-->
		<div class="col-lg-4">
			<!--Card-->
			<div class="card wow fadeIn" data-wow-delay="0.6s">
			
				<!--Card image-->
				<img class="img-fluid" 
				     src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/4-col/img%20(4).jpg" 
				     alt="Card image cap">
				
				<!--Card content-->
				<div class="card-body">
					<!--Title-->
					<h4 class="card-title">
						This is title
					</h4>
					<!--Text-->
					<p class="card-text">
						Some quick example text to build on the card title and make up the bulk of the card's content.
					</p>
					<a href="#" class="btn btn-info">API</a>
				</div>
			</div>
			<!--/.Card-->
		</div>
		<!--Third columnn-->
	</div>
	<!--/.Second row-->
</div>
<!--/.Main layout-->


 <!-- Modal -->
    <div class="modal fade" id="fileUploadModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4><i class="fa fa-user"></i> Upload PDF File </h4>
                </div>
                <div class="modal-body" id="fileUploadModal_body" style="padding:40px 50px;">
                    
                </div>
                <!--Footer-->
                <div class="modal-footer" >
                    <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal">X</button>                    
                </div>
                <!--/.Footer-->
            </div>
            <!-- /.Modal content-->
        </div>
    </div>
    <!--/ Modal -->
    
 <script>/* */</script>
<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="includes/js/fileupload/jquery.ui.widget.js"></script>
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="//blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<!-- blueimp Gallery script -->
<script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="includes/js/fileupload/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="includes/js/fileupload/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="includes/js/fileupload/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="includes/js/fileupload/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="includes/js/fileupload/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="includes/js/fileupload/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="includes/js/fileupload/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="includes/js/fileupload/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="includes/js/fileupload/main.js"></script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->

