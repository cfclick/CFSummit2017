function DigitalSignature(){
	digitalSignature = this;
	
	//buttons
	this.add_signature_field_btn = $('#add_signature_field_btn');
	
	//inputs
	this.fileName = $('#fileName');
	this.fieldName = $('#fieldName');
	this.d_x1 = $("#d_x1");
	this.d_y1 = $("#d_y1");
	this.d_x2 = $("#d_x2");
	this.d_y2 = $("#d_y2");
	
	
	this.setEventListeners();
}

//Defined application configuration and make is part of main object	 

DigitalSignature.prototype.setEventListeners = function(event){
	
	digitalSignature.add_signature_field_btn.on('click',function(e){
			var view_model = {
						pdfFile: main.pdfFile.val()
						,newuserpassword: main.newuserpassword.val()
						,x1:digitalSignature.d_x1.val()
						,y1:digitalSignature.d_y1.val()
						,x2:digitalSignature.d_x2.val()
						,y2:digitalSignature.d_y2.val()
						,page:1
						,fieldName:digitalSignature.fieldName.val()
						,fileName:viewerIndex.fileName.val()
					};
					var url = main.config.urls.digitalsignature.addField;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  	 
						},
			    		success: function( fileName ){
			    			console.log(fileName);
			    			viewerIndex.preview( fileName, true );
			    			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
			    		},
						error: function( objRequest, strError ){
			        		console.log(objRequest);   
			        		console.log(strError);   
			        	},
			       	 	async: true
			    	});		
	});
								
}

