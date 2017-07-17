
function Main(){
	main = this;
	this.myIframe 			= $('#myIframe');
	this.pdfLink 			= $('#pdfLink');
	this.pdfFile 			= $('#pdfFile');
	this.add_password_btn 	= $('#add_password_btn');
	this.newuserpassword 	= $('#newuserpassword');
	this.sanitize_meta_btn 	= $('#sanitize_meta_btn');
	this.metadata_modal 	= $('#metadata_modal');
	this.redact_btn			= $('#redact_btn');
	this.redact_apply_btn   = $('#redact_apply_btn');
	
	/*this.x1 = $("#x1");
	this.y1 = $("#y1");
	this.x2 = $("#x2");
	this.y2 = $("#y2");*/
	this.r_x1 = $("#r_x1");
	this.r_y1 = $("#r_y1");
	this.r_x2 = $("#r_x2");
	this.r_y2 = $("#r_y2");
	
	this.setEventListeners();
	this.loadPDF();
}

//Defined application configuration and make is part of main object	
Main.prototype.config = new Config(); 

Main.prototype.setEventListeners = function(event){
	
	main.pdfLink.on('click', function(event){
		var url = "http://localhost:8500/CFSummit2017/PDFViewer/index.cfm?event=main.preview&pdfFile=" + main.pdfFile.val();
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
	
	main.redact_apply_btn.on('click',function(e){
					var view_model = {
						pdfFile: main.pdfFile.val()
						,newuserpassword: main.newuserpassword.val()
						,x1:main.r_x1.val()
						,y1:main.r_y1.val()
						,x2:main.r_x2.val()
						,y2:main.r_y2.val()
						,page:1
						
					};
					var url = main.config.urls.main.redact;
					
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
				
	
	
}

Main.prototype.loadPDF = function( pdfobj ){
	
   /* var $iframe = $('#' + iframeName);
    if ( $iframe.length ) {
        $iframe.attr('src',url);   
        return false;
    }
    return true;*/
    if( !pdfobj )
     	file=main.pdfFile.val();
    else
     	file=pdfobj.PDFFILE;
     	
    var url = main.config.urls.main.preview + "&pdfFile=" + file +'&newuserpassword=' + main.newuserpassword.val();	
	//var url = "http://localhost:8500/CFSummit2017/PDFViewer/index.cfm?event=main.preview&pdfFile=" + file;
	main.myIframe.attr("src", url);

}

Main.prototype.readMetadata = function(){
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
			
			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
		},
		error: function( objRequest, strError ){
    		console.log(objRequest);   
    		console.log(strError);   
    	},
   	 	async: true
	});		
}

