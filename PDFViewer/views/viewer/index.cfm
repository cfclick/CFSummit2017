<style>
	.fluidMedia {
	position: relative;
	padding-bottom: 94.00%; /* proportion value to aspect ratio 16:9 (9 / 16 = 0.5625 or 56.25%) */
	padding-top: 20px;
	height: 0;
	overflow: hidden;
	}
	.fluidMedia iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	}
	.modal-heade-black{
	color:#000000;
	}
</style>
<cfoutput>
	<input type="hidden" name="fileName" id="fileName" value="#rc.fileName#" />
	<div class="container" style="padding-top:10px">
	
		<div class="row">
			<div class="col-sm-2 col-md-2 col-lg-2">
				<button type="button" class="btn btn-outline-info waves-effect btn-block" data-toggle="modal" 
				        data-target="##digital_signature_modal">
					Signature
				</button>
				<button type="button" class="btn btn-outline-info waves-effect btn-block" data-toggle="modal" data-target="##redact_modal">
					Redact
				</button>
				<button type="button" class="btn btn-outline-info waves-effect btn-block">
					Sanitize
				</button>				
				<button type="button" class="btn btn-outline-info waves-effect btn-block">
					Stamp
				</button>
				<button type="button" class="btn btn-outline-info waves-effect btn-block">
					Properties
				</button>
			</div>
			<div class="col-sm-10 col-md-10 col-lg-10">
				<!--First row-->
				
				<!--/.First row-->

				<div class="row wow fadeIn" data-wow-delay="0.4s">
					<div class="col-sm-12 col-md-12 col-lg-12">
						
						<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary">
							<input type="radio" name="options" id="option1" autocomplete="off" > <i class="fa fa-floppy-o fa-3x" aria-hidden="true"></i>
						</label>
						<label class="btn btn-primary">
							<input type="radio" name="options" id="option2" autocomplete="off"> <i class="fa fa-undo" aria-hidden="true"></i>
						</label>
						<label class="btn btn-danger">
							<input type="radio" name="options" id="option3" autocomplete="off"> <i class="fa fa-trash-o" aria-hidden="true"></i>
						</label>
					</div>
						<div class="fluidMedia">
							<iframe id="pdf_iframe" src="#rc.homepage#?event=viewer.preview&fileName=#rc.fileName#" frameborder="0">
							</iframe>
						</div>
					</div>
				</div>
				
				<br>
			</div>
		</div>
	</div>
	
	<!-- ============================================ SIGNATURE MODAL 
	=============================================== -->
	<!-- Modal -->
	<div class="modal fade right" id="digital_signature_modal" tabindex="-1" role="dialog"
	     aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-full-height modal-right" role="document">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header text-center modal-heade-black">
					<h4>
						<i class="fa fa-file">
						</i>
						Digital Signature
					</h4>
					<button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">
						X
					</button>
				</div>
				<div class="modal-body" style="padding:40px 50px;">
					<div class="row">
						<form class="col-md-12">
							<div class="row">
								<div class="md-form form-group form-sm">
									<input type="text" id="d_x1" value="440" class="form-control"
									       style="width:40px"/>
									<label for="d_x1">
										x1
									</label>
								</div>
								
								<div class="md-form form-group form-sm">
									<input type="text" id="d_y1" value="75" class="form-control"
									       style="width:40px"/>
									<label for="d_y1">
										y1
									</label>
								</div>
							</div>
							
							<div class="row">
								<div style="width:300px;height:100px;border:1px solid ##000;margin-left:40px">
								</div>
							</div>
							<br>
							<br>
							<div class="row pull-right">
								<div class="md-form form-group form-sm">
									<input type="text" id="d_x2" value="570" class="form-control"
									       style="width:40px"/>
									<label for="d_x2">
										x2
									</label>
								</div>
								
								<div class="md-form form-group form-sm">
									<input type="text" id="d_y2" value="38" class="form-control"
									       style="width:40px"/>
									<label for="d_y2">
										y2
									</label>
								</div>
							</div>
							<br>
							<br>
							<br>
							<br>
							<div class="row">
								<div class="md-form form-group form-sm">
									<input type="text" id="fieldName" value="Signature1" class="form-control"/>
									<label for="fieldName">
										Signature Field Name
									</label>
								</div>
							</div>

							<div class="row">
								<div class="md-form form-group form-sm">
									<input type="text" id="page" class="form-control" value="1" style="width:60px"/>
									<label for="page">
										Page Number
									</label>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--Footer-->
				<div class="modal-footer">
					<button type="button" id="reset_to_btn" class="btn btn-danger btn-success pull-right">
						Reset
					</button>
					<button type="button" id="add_signature_field_btn" class="btn btn-danger btn-danger pull-right">
						Add
					</button>
				</div>
				<!--/.Footer-->
			</div>
			<!-- /.Modal content-->
		</div>
	</div><!--/ Modal -->
	<!-- ========================================END SIGNATURE MODAL============================================= -->
	
	
	
	<!-- ================================================REDACT MODAL================================================== -->
	<!-- Modal -->
	<div class="modal fade right" id="redact_modal" tabindex="-1" role="dialog"
	     aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-full-height modal-right" role="document">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header text-center modal-heade-black">
					<h4>
						<i class="fa fa-user">
						</i>
						Redact 
					</h4>
					
					<button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">
						X
					</button>
				</div>
				<div class="modal-body" style="padding:40px 50px;">
					<div class="row">
						<form class="col-md-12">
							<div class="row">
								<div class="md-form form-group form-sm">
									<input type="text" id="d_x1" value="440" class="form-control"
									       style="width:40px"/>
									<label for="d_x1">
										x1
									</label>
								</div>
								
								<div class="md-form form-group form-sm">
									<input type="text" id="d_y1" value="75" class="form-control"
									       style="width:40px"/>
									<label for="d_y1">
										y1
									</label>
								</div>
							</div>
							
							<div class="row">
								<div style="width:300px;height:100px;border:1px solid ##000;margin-left:10px">
								</div>
							</div>
							<br>
							<br>
							<div class="row pull-right">
								<div class="md-form form-group form-sm">
									<input type="text" id="d_x2" value="570" class="form-control"
									       style="width:40px"/>
									<label for="d_x2">
										x2
									</label>
								</div>
								
								<div class="md-form form-group form-sm">
									<input type="text" id="d_y2" value="38" class="form-control"
									       style="width:40px"/>
									<label for="d_y2">
										y2
									</label>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--Footer-->
				<div class="modal-footer">
					
					<button type="button" id="reset_to_btn" class="btn btn-danger btn-success pull-right">
						Reset
					</button>
					<button type="button" id="redact_apply_btn" class="btn btn-danger btn-danger pull-right">
						Apply
					</button>
				</div>
				<!--/.Footer-->
			</div>
			<!-- /.Modal content-->
		</div>
	</div><!--/ Modal -->
	<!-- ==============================================END REDACT MODAL================================================ -->
</cfoutput>

<script src="includes/js/viewer/viewer.index.js" type="application/javascript" ></script>
<script src="includes/js/viewer/viewer.digitalsignature.js" type="application/javascript" ></script>

<script >

	$(document).ready( function() {
		
		//if( viewerIndex == 'undefined' )	
			viewerIndex = new ViewerIndex();
	});
</script>