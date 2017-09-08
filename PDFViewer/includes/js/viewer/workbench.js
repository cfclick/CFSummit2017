function WorkBench(){
	workBench = this;
	
	//buttons
	this.reset_btn   = $('#reset_btn');
	this.delete_btn  = $('#delete_btn');
	this.restore_btn = $('#restore_btn');

	
	//inputs
	this.fileName = $('#fileName');
	
	
	//modals
	this.digital_signature_modal = $('#digital_signature_modal');
	this.redact_modal = $('#redact_modal');
	
	//other
	this.pdf_iframe = $('#pdf_iframe');
	
	
	this.setEventListeners();
}

//Defined application configuration and make is part of main object	 

WorkBench.prototype.setEventListeners = function(event){
	
	workBench.digital_signature_modal.on('shown.bs.modal', function (){
		
			digitalSignature = new DigitalSignature();
			
	});
	
	workBench.redact_modal.on('shown.bs.modal', function (){
		
			redact = new Redact();
			
	});
	
	workBench.delete_btn.on('click', function(){
		
		var view_model = {
			fileName:workBench.fileName.val()
		};

		var url = main.config.urls.viewer.delete;
		$.ajax(	{
        	type: "post",
        	url: url,		
        	data: view_model,
       		beforeSend: function( xhr ){  	 
			},
    		success: function( fileName ){
    			self.location = main.config.urls.root;
    			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
    		},
			error: function( objRequest, strError ){
        		console.log(objRequest);   
        		console.log(strError);   
        	},
       	 	async: true
		});		
		
	});

	workBench.restore_btn.on('click', function(event){

		var view_model = {
			fileName:workBench.fileName.val()
		};

		var url = main.config.urls.viewer.restore;
		$.ajax(	{
        	type: "post",
        	url: url,		
        	data: view_model,
       		beforeSend: function( xhr ){  	 
			},
    		success: function( fileName ){
    			workBench.preview( fileName, true );
    			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
    		},
			error: function( objRequest, strError ){
        		console.log(objRequest);   
        		console.log(strError);   
        	},
       	 	async: true
    	});		
	})
	
				
}

WorkBench.prototype.preview = function( fileName, istemp ){
		    	
    var url = main.config.urls.viewer.preview + "&fileName=" + fileName + '&istemp=' + istemp;	
	workBench.pdf_iframe.attr("src", url);

}
