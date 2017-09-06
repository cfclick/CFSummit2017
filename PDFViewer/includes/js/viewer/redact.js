function Redact(){
	redact = this;
	
	//buttons
	this.redact_apply_btn = $('#redact_apply_btn');
	
	//inputs
	this.fileName = $('#fileName');
	this.fieldName = $('#fieldName');
	this.d_x1 = $("#d_x1");
	this.d_y1 = $("#d_y1");
	this.d_x2 = $("#d_x2");
	this.d_y2 = $("#d_y2");
	this.page = $("#page");
	
	
	this.setEventListeners();
}

//Defined application configuration and make is part of main object	 

Redact.prototype.setEventListeners = function(event){
	
	redact.redact_apply_btn.on('click',function(e){
			var view_model = {
						newuserpassword: main.newuserpassword.val()
						,x1:redact.d_x1.val()
						,y1:redact.d_y1.val()
						,x2:redact.d_x2.val()
						,y2:redact.d_y2.val()
						,page:redact.page.val()
						,fileName:workBench.fileName.val()
					};
					var url = main.config.urls.redact.add;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  	 
						},
			    		success: function( fileName ){
			    			console.log(fileName);
			    			workBench.preview( fileName, true );
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

