function Redact(){
	redact = this;
	
	//buttons
	this.redact_btn			= $('#redact_btn');
	this.redact_apply_btn   = $('#redact_apply_btn');
	
	
	//inputs
	this.pdfFile 			= $('#pdfFile');
	this.newuserpassword 	= $('#newuserpassword');
	
	/*this.myIframe 			= $('#myIframe');
	this.pdfLink 			= $('#pdfLink');
	
	this.orgPdfFile 		= $('#orgPdfFile');
	this.add_password_btn 	= $('#add_password_btn');
	
	this.sanitize_meta_btn 	= $('#sanitize_meta_btn');
	this.metadata_modal 	= $('#metadata_modal');
	this.redact_btn			= $('#redact_btn');
	this.redact_apply_btn   = $('#redact_apply_btn');
	this.reset_to_btn		= $('#reset_to_btn');
	this.add_signature_field_btn = $('#add_signature_field_btn');
	this.fieldName				 = $('#fieldName');
	this.fileName				 = $('#fileName');*/
	
	
	this.r_x1 = $("#r_x1");
	this.r_y1 = $("#r_y1");
	this.r_x2 = $("#r_x2");
	this.r_y2 = $("#r_y2");
	
	
	
	this.setEventListeners();
	//this.loadPDF();
}


Redact.prototype.setEventListeners = function(event){
	
	redact.redact_apply_btn.on(
		'click', function(e){
					var view_model = {
						pdfFile: redact.pdfFile.val()
						,newuserpassword: redact.newuserpassword.val()
						,x1:redact.r_x1.val()
						,y1:redact.r_y1.val()
						,x2:redact.r_x2.val()
						,y2:redact.r_y2.val()
						,page:1
						
					};
					var url = main.config.urls.redact.doRedact;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  	 
						},
			    		success: function( data ){
			    			console.log(data);
			    			main.loadPDF(data);
			    			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
			    		},
						error: function( objRequest, strError ){
			        		console.log(objRequest);   
			        		console.log(strError);   
			        	},
			       	 	async: true
			    	});//ajax		
					
				}//function
			);	//on
}

