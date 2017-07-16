<cfoutput>

<div class="row">

                <!--Sidebar-->
                <div class="col-lg-3 wow fadeIn" data-wow-delay="0.2s">

                    <div class="widget-wrapper">
                    	 <form id="fileupload" action="#cgi.scrIPT_NAME#?event=main.uploadFiles" method="POST" enctype="multipart/form-data">
						  <div class="file-field">
						    <div class="btn btn-primary btn-sm">
						        <span>Choose file</span>
						        <input type="file" name="files[]" multiple>
						    </div>
						    <input type="submit" value="Upload your file" name="submit_btn" class="btn btn-primary">
						    <!---<div class="file-path-wrapper">
						       <input class="file-path validate" type="text" placeholder="Upload your file">
						    </div>--->
						  </div>
						</form>
                        <!---<h4>Categories:</h4>--->
                        <br>
                        <div class="list-group">
						    <a href="##" class="list-group-item active">
						        Preview
						    </a>
						    <a href="##" class="list-group-item list-group-item-action" data-toggle="modal" data-target="##basicExample">Read Metadata</a>						    
						    <a href="##" class="list-group-item list-group-item-action">Sanitize</a>
						    <a href="##" class="list-group-item list-group-item-action" data-toggle="modal" data-target="##modalLogin">Password Protect</a>
						    <a href="##" class="list-group-item list-group-item-action disabled">Digital Signature</a>
						</div>
                        
                    </div>
                    
                    <!--Panel-->
					<div class="card">
					    <h5 class="card-header primary-color white-text">File Info</h5>
					    <div class="card-block">
					       
					        <dl class="row">
								  <dt class="col-sm-3">Created</dt>
								  <dd class="col-sm-9">#rc.reader.Created#</dd>
								
								  <dt class="col-sm-3">Modified</dt>
								  <dd class="col-sm-9">#rc.reader.Modified#</dd>
								<!---text-truncate --->
								  <dt class="col-sm-3 ">Producer</dt>
								  <dd class="col-sm-9 ">#rc.reader.Producer#</dd>
								  
								  <dt class="col-sm-3">Application</dt>
								  <dd class="col-sm-9">#rc.reader.Application#</dd>
								  
								  <dt class="col-sm-3">Version</dt>
								  <dd class="col-sm-9">#rc.reader.Version#</dd>
								  
								</dl>
					    </div>
					</div>
					<!--/.Panel-->

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
                <div class="col-lg-9">

                    <!--First row-->
                    <div class="row wow fadeIn" data-wow-delay="0.4s">
                    	<input name="pdfFile" id="pdfFile" type="hidden" value="#rc.reader.FilePath#" />
                        <div class="col-lg-12">
                        	<dl class="row">
								<dt class="col-sm-3">File</dt>
								<dd class="col-sm-9 text-truncate"><abbr title="#rc.reader.FilePath#" ><a href="##" id="pdfLink"> #rc.reader.FilePath#</a></abbr></dd>
	                        </dl>
	                        
                            <iframe id="myIframe" height="800" width="100%" src="">
							</iframe>		
                          
                        </div>
                    </div>
                    <!--/.First row-->
                    <br>
                    <hr class="extra-margins">
                </div>
                <!--/.Main column-->

            </div>
            
            <!-- Full Height Modal Right -->


<!-- Modal -->
<div class="modal fade" id="basicExample" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
<!---<div id="basicExample" class="modal modal-lg fade right" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fluid modal-right" role="document">
--->
        <!--Content-->
        <div class="modal-content">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>
            </div>
            <!--Body-->
            <div class="modal-body">
            	<!--Accordion wrapper-->
				<div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
				    <div class="card">
				        <div class="card-header" role="tab" id="headingOne">
				            <a data-toggle="collapse" data-parent="##accordion" href="##collapseOne" aria-expanded="true" aria-controls="collapseOne">
				                <h5 class="mb-0">
				                Description <i class="fa fa-angle-down rotate-icon"></i>
				            </h5>
				            </a>
				        </div>
				        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
				            <div class="card-block">
				            	<!--FORM-->
						        						        
						        <div class="md-form form-sm">          
						            <input type="text" id="Author" class="form-control" value="#rc.reader.Author#">
						            <label for="Author">Author</label>
						        </div>
						        
						         <div class="md-form form-sm">
						            <input type="text" id="Subject" class="form-control" value="#rc.reader.Subject#">
						            <label for="Subject">Subject</label>
						        </div>
						
						        <div class="md-form form-sm">          
						            <input type="text" id="Title" class="form-control" value="#rc.reader.Title#">
						            <label for="Title">Title</label>
						        </div>
						        
						        <div class="md-form form-sm">          
						            <input type="text" id="Keywords" class="form-control" value="#rc.reader.Keywords#">
						            <label for="Keyword">Keywords</label>
						        </div>
						        
						        <dl class="row">
								  <dt class="col-sm-3">Created</dt>
								  <dd class="col-sm-9">#rc.reader.Created#</dd>
								
								  <dt class="col-sm-3">Modified</dt>
								  <dd class="col-sm-9">#rc.reader.Modified#</dd>
								
								  <dt class="col-sm-3">File</dt>
								  <dd class="col-sm-9 text-truncate"><abbr title="#rc.reader.FilePath#" >#rc.reader.FilePath#</abbr></dd>
								<!---text-truncate --->
								  <dt class="col-sm-3 ">Producer</dt>
								  <dd class="col-sm-9 ">#rc.reader.Producer#</dd>
								  
								  <dt class="col-sm-3">Application</dt>
								  <dd class="col-sm-9">#rc.reader.Application#</dd>
								  
								  <dt class="col-sm-3">Version</dt>
								  <dd class="col-sm-9">#rc.reader.Version#</dd>
								  
								</dl>

						        <!--/FORM-->
				            </div>
				        </div>
				    </div>
				    <div class="card">
				        <div class="card-header" role="tab" id="headingTwo">
				            <a class="collapsed" data-toggle="collapse" data-parent="##accordion" href="##collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				                <h5 class="mb-0">
				                Restriction Summary <i class="fa fa-angle-down rotate-icon"></i>
				            </h5>
				            </a>
				        </div>
				        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
				            <div class="card-block">
				            	<dl class="row">
					            	<dt class="col-sm-3">Center Window On Screen</dt>
									<dd class="col-sm-9">#rc.reader.CenterWindowOnScreen#</dd>
									  
									<dt class="col-sm-3">Changing Document</dt>
									<dd class="col-sm-9">#rc.reader.ChangingDocument#</dd>
									
									<dt class="col-sm-3">Commenting</dt>
									<dd class="col-sm-9">#rc.reader.Commenting#</dd>
									
									<dt class="col-sm-3">Content Extraction</dt>
									<dd class="col-sm-9">#rc.reader.ContentExtraction#</dd>
									
									<dt class="col-sm-3">CopyContent</dt>
									<dd class="col-sm-9">#rc.reader.CopyContent#</dd>
									
									<dt class="col-sm-3">Document Assembly</dt>
									<dd class="col-sm-9">#rc.reader.DocumentAssembly#</dd>
									
									<dt class="col-sm-3">Encryption</dt>
									<dd class="col-sm-9">#rc.reader.Encryption#</dd>
									
									<dt class="col-sm-3">Filling Form</dt>
									<dd class="col-sm-9">#rc.reader.FillingForm#</dd>
									
									<dt class="col-sm-3">Fit To Window</dt>
									<dd class="col-sm-9">#rc.reader.FitToWindow#</dd>
									
									<dt class="col-sm-3">HideMenubar</dt>
									<dd class="col-sm-9">#rc.reader.HideMenubar#</dd>
									
									<dt class="col-sm-3">HideToolbar</dt>
									<dd class="col-sm-9">#rc.reader.HideToolbar#</dd>
									
									<dt class="col-sm-3">Hide Window UI</dt>
									<dd class="col-sm-9">#rc.reader.HideWindowUI#</dd>
								</dl> 
				            	
						        
						        
						        
				            </div>
				        </div>
				    </div>
				    <div class="card">
				        <div class="card-header" role="tab" id="headingThree">
				            <a class="collapsed" data-toggle="collapse" data-parent="##accordion" href="##collapseThree" aria-expanded="false" aria-controls="collapseThree">
				                <h5 class="mb-0">
				                Custom Properties <i class="fa fa-angle-down rotate-icon"></i>
				            </h5>
				            </a>
				        </div>
				        <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree">
				            <div class="card-block">
				            	
				            	<form class="form-inline">

								    <div class="md-form form-group form-sm">
								        <input type="text" id="name" class="form-control" >
						            	<label for="name">Name</label>
								    </div>
								
								    <div class="md-form form-group form-sm">
								        <input type="text" id="value" class="form-control" >
						            <label for="value">Value</label>
								    </div>
								
								    <div class="md-form form-group">
								        <a href="" class="btn btn-primary btn-lg">Add</a>
								    </div>
								
								</form>
				            	
						        
						        <table class="table">
								    <thead>
								        <tr>
								            <th>##</th>
								            <th>Name</th>
								            <th>Value</th>
								            
								        </tr>
								    </thead>
								    <tbody>
								    	<cfloop collection="#rc.reader.Properties#" item="prop" >
								        <tr>
								            <th scope="row">1</th>
								            <td>#prop#</td>
								            <td>#rc.reader.Properties[prop]#</td>
								            
								        </tr>
								        </cfloop>
								       
								
								    </tbody>
								</table>
				            </div>
				        </div>
				    </div>
				</div>
				<!--/.Accordion wrapper-->
                
            </div>
            <!--Footer-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-default">Export Metadata</button>
                <button type="button" class="btn btn-success">Import Metadata</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- /Modal -->

   
    <!-- Modal -->
    <div class="modal fade" id="modalLogin" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4><i class="fa fa-user"></i> Protect PDF </h4>
                </div>
                <div class="modal-body" style="padding:40px 50px;">
                    <div class="row">
                        <form action="#CGI.SCRIPT_NAME#?event=Main.passwordProtect" method="post"  class="col-md-12">
                        	<input type="hidden" value="#rc.pdfFile#" name="pdfFile">
                            <div class="row">
                                
								<div class="md-form form-group form-sm">
							        <input type="text" name="newuserpassword" id="newuserpassword" class="form-control" >
					            	<label for="newuserpassword">New User Password</label>
							    </div>
							    
							    <div class="md-form form-group form-sm">
							        <input type="text" name="newownerpassword" id="newownerpassword" class="form-control" >
					            	<label for="newownerpassword">New Owner Password</label>
							    </div>
								
                               
                                <div class="text-center">
                                    <button name="add_password_btn" id="add_password_btn" type="button" class="btn btn-primary waves-effect waves-light">Submit</button>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!--Footer-->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal">X</button>
                    
                </div>
                <!--/.Footer-->
            </div>
            <!-- /.Modal content-->
        </div>
    </div>
    <!--/ Modal -->
    
</cfoutput>



<script >
	//main = new Main();
	//http://localhost:8500/CFSummit2017/PDFViewer/index.cfm?event=main.preview&pdfFile=#rc.PDFFile#
	
	application.main.loadPDF();
</script>
	
</script>
	
</script>