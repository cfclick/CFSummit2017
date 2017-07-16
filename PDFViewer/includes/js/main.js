
function Main(){
	main = this;
	this.myIframe = $('#myIframe');
	this.pdfLink = $('#pdfLink');
	this.pdfFile = $('#pdfFile');
	this.add_password_btn = $('#add_password_btn');
	this.newuserpassword = $('#newuserpassword');
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
	})
	
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