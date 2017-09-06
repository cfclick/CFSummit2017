function WorkBench(){
	workBench = this;
	
	//buttons
	this.save_btn = $('#save_btn');
	this.reset_btn = $('#reset_btn');
	this.delete_btn = $('#delete_btn');
	
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
	
	workBench.save_btn.on('click', function(){
		
	});
				
}

WorkBench.prototype.preview = function( fileName, istemp ){
		    	
    var url = main.config.urls.viewer.preview + "&fileName=" + fileName + '&istemp=' + istemp;	
	workBench.pdf_iframe.attr("src", url);

}
