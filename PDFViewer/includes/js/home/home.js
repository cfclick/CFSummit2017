
function Home(){
	home = this;
	//buttons
	this.upload_pdf_btn = $('#upload_pdf_btn');	
	
	
	this.setEventListeners();
}

//Defined application configuration and make is part of main object	
Home.prototype.config = new Config(); 

Home.prototype.setEventListeners = function(event){
	
	main.upload_pdf_btn.on('click', function(event){
		var url = main.config.urls.root + "?event=main.preview&pdfFile=" + main.pdfFile.val();
		main.myIframe.attr("src", url);
	})
	
	main.add_password_btn.on('click', function(){
		var view_model = {};
		view_model.newuserpassword = main.newuserpassword.val();
		view_model.pdfFile = main.pdfFile.val();
		var url = main.config.urls.main.passwordProtect;
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
    	});		
	});
	
	main.sanitize_meta_btn.on('click', function(){
		var view_model = {};
		view_model.newuserpassword = main.newuserpassword.val();
		view_model.pdfFile = main.pdfFile.val();
		var url = main.config.urls.main.sanitize;
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
    	});		
	});
	
	main.metadata_modal.on('shown.bs.modal', function (){
	  	main.readMetadata();
	});
	
	main.redact_modal.on('shown.bs.modal', function (){
		
	  	if( !application.redact )
			application.redact = new Redact();
			
	});
	
	main.reset_to_btn.on('click',function(e){
		var view_model ={orgPDFFile : main.orgPdfFile.val(),fileName: main.fileName.val()};
    	var url = main.config.urls.main.resetToOrginal;
					
		$.ajax(	{
        	type: "post",
        	url: url,		
        	data: view_model,
       		beforeSend: function( xhr ){  	 
			},
    		success: function( data ){
    			//console.log(data);
    			main.loadPDF(data);
    			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
    		},
			error: function( objRequest, strError ){
        		console.log(objRequest);   
        		console.log(strError);   
        	},
       	 	async: true
    	});		
    	

	});
	
	main.add_signature_field_btn.on('click',function(e){
			var view_model = {
						pdfFile: main.pdfFile.val()
						,newuserpassword: main.newuserpassword.val()
						,x1:main.d_x1.val()
						,y1:main.d_y1.val()
						,x2:main.d_x2.val()
						,y2:main.d_y2.val()
						,page:1
						,fieldName:main.fieldName.val()
						,fileName:main.fileName.val()
					};
					var url = main.config.urls.main.addDigitalSignatureField;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  	 
						},
			    		success: function( data ){
			    			//console.log(data);
			    			main.loadPDF(data);
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

Home.prototype.loadPDF = function( pdfobj ){
	
    if( !pdfobj )
     	file=main.pdfFile.val();
    else
     	file=pdfobj.PDFFILE;
     	
    var url = main.config.urls.main.preview + "&pdfFile=" + file +'&newuserpassword=' + main.newuserpassword.val();	
	main.pdfLink.html(file);
	main.pdfFile.val(file);
	main.myIframe.attr("src", url);

}

Home.prototype.readMetadata = function(){
	var view_model = {};
	view_model.newuserpassword = main.newuserpassword.val();
	view_model.pdfFile = main.pdfFile.val();
	var url = main.config.urls.main.readMetadata;
	$.ajax(	{
    	type: "post",
    	url: url,		
    	data: view_model,
   		beforeSend: function( xhr ){  	 
		},
		success: function( data ){
			console.log(data);
			$('#rc_reader_author').val( data.reader.Author );
			$('#rc_reader_subject').val( data.reader.Subject );
			$('#rc_reader_title').val( data.reader.Title );
			$('#rc_reader_keywords').val( data.reader.Keywords );
			
			$('#rc_reader_created').html( data.reader.Created );
			$('#rc_reader_modified').html( data.reader.Modified );
			$('#rc_reader_created').html( data.reader.Producer );
			$('#rc_reader_application').html( data.reader.Application );
			$('#rc_reader_version').html( data.reader.Version );
			
			$('#rc_reader_CenterWindowOnScreen').html(data.reader.CenterWindowOnScreen);
			$('#rc_reader_ChangingDocument').html(data.reader.ChangingDocument);
			$('#rc_reader_Commenting').html(data.reader.Commenting);
			$('#rc_reader_ContentExtraction').html(data.reader.ContentExtraction);
			$('#rc_reader_CopyContent').html(data.reader.CopyContent);
			$('#rc_reader_DocumentAssembly').html(data.reader.DocumentAssembly);
			$('#rc_reader_Encryption').html(data.reader.Encryption);
			$('#rc_reader_FillingForm').html(data.reader.FillingForm);
			$('#rc_reader_FitToWindow').html(data.reader.FitToWindow);
			$('#rc_reader_HideMenubar').html(data.reader.HideMenubar);
			$('#rc_reader_HideToolbar').html(data.reader.HideToolbar);
			$('#rc_reader_HideWindowUI').html(data.reader.HideWindowUI);
			
			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
		},
		error: function( objRequest, strError ){
    		console.log(objRequest);   
    		console.log(strError);   
    	},
   	 	async: true
	});		
}
