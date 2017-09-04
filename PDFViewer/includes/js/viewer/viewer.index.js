function ViewerIndex(){
	viewerIndex = this;
	
	//buttons

	//inputs
	this.fileName = $('#fileName');
	
	
	//modals
	this.digital_signature_modal = $('#digital_signature_modal');
	
	//other
	this.pdf_iframe = $('#pdf_iframe');
	
	
	this.setEventListeners();
}

//Defined application configuration and make is part of main object	 

ViewerIndex.prototype.setEventListeners = function(event){
	
	viewerIndex.digital_signature_modal.on('shown.bs.modal', function (){
		
			digitalSignature = new DigitalSignature();
			
	});
				
}

ViewerIndex.prototype.preview = function( fileName, istemp ){
	
	    	
    var url = main.config.urls.viewer.preview + "&fileName=" + fileName + '&istemp' + istemp;	
	viewerIndex.pdf_iframe.attr("src", url);

}
