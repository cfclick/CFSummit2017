<div class="container">
<cfoutput>
	<h3>Viewer Handler</h3>
</cfoutput>

 <!--Main column-->
    <div class="col-sm-12 col-md-12 col-lg-12">
        <cfdump var = "#rc.qry_workingfolder#" >
        <!--First row-->
        <div class="row wow fadeIn" data-wow-delay="0.4s">
        	
            <!--Carousel Wrapper-->
            <div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">

                <!--Controls-->
                <div class="controls-top">
                    <a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
                    <a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fa fa-chevron-right"></i></a>
                </div>
                <!--/.Controls-->

                <!--Indicators-->
                <ol class="carousel-indicators">
                    <li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
                    <li data-target="#multi-item-example" data-slide-to="1"></li>
                    <li data-target="#multi-item-example" data-slide-to="2"></li>
                </ol>
                <!--/.Indicators-->

                <!--Slides-->
                <div class="carousel-inner" role="listbox">

                    <!--First slide-->
                    <cfloop query="rc.qry_workingfolder">
                        <div class="carousel-item active">

                            <div class="col-md-4">
                                <div class="card">
                                    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Card title</h4>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a class="btn btn-primary">Button</a>
                                    </div>
                                </div>
                            </div>

                            <!--<div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card">
                                    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(18).jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Card title</h4>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a class="btn btn-primary">Button</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 clearfix d-none d-md-block">
                                <div class="card">
                                    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Card title</h4>
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <a class="btn btn-primary">Button</a>
                                    </div>
                                </div>
                            </div>-->

                        </div>
                    </cfloop>
                    <!--/.First slide-->

                    <!--Second slide-->
                    <!--<div class="carousel-item">

                        <div class="col-md-4">
                            <div class="card">
                                <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Card title</h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a class="btn btn-primary">Button</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 clearfix d-none d-md-block">
                            <div class="card">
                                <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(47).jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Card title</h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a class="btn btn-primary">Button</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 clearfix d-none d-md-block">
                            <div class="card">
                                <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(48).jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Card title</h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a class="btn btn-primary">Button</a>
                                </div>
                            </div>
                        </div>

                    </div>-->
                    <!--/.Second slide-->

                    <!--Third slide-->
                    <!--<div class="carousel-item">

                        <div class="col-md-4">
                            <div class="card">
                                <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(53).jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Card title</h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a class="btn btn-primary">Button</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 clearfix d-none d-md-block">
                            <div class="card">
                                <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(45).jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Card title</h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a class="btn btn-primary">Button</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 clearfix d-none d-md-block">
                            <div class="card">
                                <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(51).jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title">Card title</h4>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a class="btn btn-primary">Button</a>
                                </div>
                            </div>
                        </div>

                    </div>-->
                    <!--/.Third slide-->

                </div>
                <!--/.Slides-->

            </div>
            <!--/.Carousel Wrapper-->
            <!--- <div class="col-lg-12">
            	<dl class="row">
					<dt>File</dt>
					<dd>
						<abbr title="" >
							<a href="" id="pdfLink">{{FileName}}</a>
						</abbr>
					</dd>
                </dl>
                <div class="row">
	                <iframe id="myIframe" height="750" width="100%" src="">
					</iframe>
				</div>		
              
            </div> --->
        </div>
        <!--/.First row-->
        <br>
        <hr class="extra-margins">
    </div>
    <!--/.Main column-->
</div>