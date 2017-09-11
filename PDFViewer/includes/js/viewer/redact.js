function Redact(){
	redact = this;
	
	//buttons
	this.redact_apply_btn = $('#redact_apply_btn');
	
	//inputs
	this.fileName = $('#fileName');
	this.fieldName = $('#fieldName');
	this.r_x1 = $("#r_x1");
	this.r_y1 = $("#r_y1");
	this.r_x2 = $("#r_x2");
	this.r_y2 = $("#r_y2");
	this.page = $("#page");
	
	
	this.setEventListeners();
}

//Defined application configuration and make is part of main object	 

Redact.prototype.setEventListeners = function(event){
	
	redact.redact_apply_btn.on('click',function(e){
			var view_model = {
						newuserpassword: main.newuserpassword.val()
						,x1:redact.r_x1.val()
						,y1:redact.r_y1.val()
						,x2:redact.r_x2.val()
						,y2:redact.r_y2.val()
						,page:redact.page.val()
						,fileName:workBench.fileName.val()
					};
					var url = main.config.urls.redact.add;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  
							   main.preload_div.removeClass('invisible');	 
						},
			    		success: function( fileName ){
			    			main.preload_div.addClass('invisible');
			    			workBench.preview( fileName, true );
			    			//$('#tab'+nextTab).html( data ).append( new Client( main.loggedInIdentity, viewModel ) );
			    		},
						error: function( objRequest, strError ){
							main.preload_div.addClass('invisible');
			        		console.log(objRequest);   
			        		console.log(strError);   
			        	},
			       	 	async: true
			    	});		
	});
								
}

