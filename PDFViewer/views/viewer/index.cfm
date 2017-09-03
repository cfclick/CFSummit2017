<h4>PDF Workbench</h4>

<cfoutput>
	<div class="container" style="padding-top:130px">
		<div class="row">
			<div class="col-sm-2 col-md-2 col-lg-2" style="padding-top:30px">
				<button type="button" class="btn btn-outline-info waves-effect btn-block">Sign</button>
				<button type="button" class="btn btn-outline-info waves-effect btn-block">Sanitize</button>
				<button type="button" class="btn btn-outline-info waves-effect btn-block">Redact</button>
				<button type="button" class="btn btn-outline-info waves-effect btn-block">Stamp</button>
				<button type="button" class="btn btn-outline-info waves-effect btn-block">Properties</button>
				
			</div>
			<div class="col-sm-10 col-md-10 col-lg-10">
	        <!--First row-->
	        <div class="row wow fadeIn" data-wow-delay="0.4s">       	
	            <div class="col-lg-12">
	            	
					<abbr title="#rc.pathAndName#" ><a href="##" id="pdfLink">#rc.fileName#</a></abbr>

	             	<iframe id="myIframe2" height="800" width="100%" src="#rc.homepage#?event=viewer.preview&fileName=#rc.fileName#">
					</iframe>		
	             
	            </div>
	        </div>
	        <!--/.First row-->
	        <br>
	        <hr class="extra-margins">
	    </div>
		</div>
	</div>
</cfoutput>