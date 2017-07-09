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
						    <a href="##" class="list-group-item list-group-item-action">Read Metadata</a>
						    <a href="##" class="list-group-item list-group-item-action">Export Metadata</a>
						    <a href="##" class="list-group-item list-group-item-action">Import Metadata</a>
						    <a href="##" class="list-group-item list-group-item-action">Sanitize</a>
						    <a href="##" class="list-group-item list-group-item-action">Password Protect</a>
						    <a href="##" class="list-group-item list-group-item-action disabled">Digital Signature</a>
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
                <div class="col-lg-9">

                    <!--First row-->
                    <div class="row wow fadeIn" data-wow-delay="0.4s">
                        <div class="col-lg-12">

                            <iframe id="myIframe" height="800" width="100%" src="http://localhost:8500/CFSummit2017/PDFViewer/index.cfm?event=main.preview&pdfFile=#rc.PDFFile#">
							</iframe>		
                          
                        </div>
                    </div>
                    <!--/.First row-->
                    <br>
                    <hr class="extra-margins">
                </div>
                <!--/.Main column-->

            </div>
</cfoutput>