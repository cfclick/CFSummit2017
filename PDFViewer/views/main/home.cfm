<!-- blueimp Gallery styles -->
<link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="includes/css/fileUpload/jquery.fileupload.css">
<link rel="stylesheet" href="includes/css/fileupload/jquery.fileupload-ui.css">
<link rel="stylesheet" href="includes/css/style.css">
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
					<div class="pt-1 pb-4">
						<form id="fileupload" action="?event=Main.uploadFiles" method="POST" enctype="multipart/form-data" onsubmit="return beforeUpload();">
							<div class="file-field">
								<div class="btn btn-primary btn-sm">
									<span>Choose files</span>
									<input type="file" name="files[]" multiple>
								</div>
								<div class="file-path-wrapper">
									<input class="file-path validate" type="text" placeholder="Upload one or more files">
								</div>

								<button type="submit" class="btn btn-primary">
									<i class="glyphicon glyphicon-upload"></i>
									<span>Start upload</span>
								</button>
							</div>

							
						</form>
					</div>

					<!--- <a id="upload_pdf_btn" class="btn btn-info btn-lg" data-toggle="modal" data-target="#fileUploadModal">Upload PDF</a> --->
					<!--- <a target="_blank" href="https://mdbootstrap.com/material-design-for-bootstrap/" 
					   class="btn btn-default btn-lg" rel="nofollow">
						Learn more
					</a> --->
				</li>
			</ul>
		</div>
	</div>
	<!--/.First row-->
	<hr class="extra-margins">
	
	<div class="row">
	
		<cfoutput >
		 	#myPDFFiles()#
		</cfoutput>
	</div>
	<!--Second row-->
	<!--- <div class="row">
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
	</div> --->
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
    
