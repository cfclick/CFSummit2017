function Properties(){
	properties = this;
	
	//buttons
	this.add_custom_prop_btn = $('#add_custom_prop_btn');
	this.save_properties_btn = $('#save_properties_btn');
	
	//divs
	this.custom_prop_div = $('#custom_prop_div');
	this.main_properties_body = $('#main_properties_body');
	
	//inputs
	this.fileName 			= $('#fileName');
	this.fieldName 			= $('#fieldName');
	this.custome_prop_name 	= $('#custome_prop_name');
	this.custome_prop_value = $('#custome_prop_value');
	this.title_input 		= $('#title_input');
	this.author_input 		= $('#author_input');
	this.subject_input 		= $('#subject_input');
	this.keywords_input 	= $('#keywords_input');
	
	this.setEventListeners();
}

Properties.prototype.reinitInputs = function(){
	this.title_input 		= $('#title_input');
	this.author_input 		= $('#author_input');
	this.subject_input 		= $('#subject_input');
	this.keywords_input 	= $('#keywords_input');
}
//Defined application configuration and make is part of main object	 

Properties.prototype.setEventListeners = function(event){
	
	properties.add_custom_prop_btn.on('click',function(e){
			var view_model = {
						fileName:workBench.fileName.val(),
						name: properties.custome_prop_name.val(),
						value:properties.custome_prop_value.val()
					};
					var url = main.config.urls.properties.add;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  
							   main.preload_div.removeClass('invisible');	 
						},
			    		success: function( html ){
			    			main.preload_div.addClass('invisible');
			    			properties.custom_prop_div.html( html );
			    		},
						error: function( objRequest, strError ){
							main.preload_div.addClass('invisible');
			        		console.log(objRequest);   
			        		console.log(strError);   
			        	},
			       	 	async: true
			    	});		
	});
	
	
	properties.save_properties_btn.on('click',function(e){
			
			properties.reinitInputs();
			var view_model = {
						fileName:workBench.fileName.val(),
						Title: properties.title_input.val(),
						Author:properties.author_input.val(),
						Subject:properties.subject_input.val(),
						Keywords:properties.keywords_input.val()
					};
					var url = main.config.urls.properties.save;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  
							   main.preload_div.removeClass('invisible');	 
						},
			    		success: function( html ){
			    			
			    			main.preload_div.addClass('invisible');
			    			properties.main_properties_body.html( html );
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

Properties.prototype.deleteCustomProperty = function(prop){
	var view_model = {
						fileName:workBench.fileName.val(),
						name: prop 
						
					};
					var url = main.config.urls.properties.delete;
					
					$.ajax(	{
			        	type: "post",
			        	url: url,		
			        	data: view_model,
			       		beforeSend: function( xhr ){  
							   main.preload_div.removeClass('invisible');	 
						},
			    		success: function( html ){
			    			main.preload_div.addClass('invisible');
			    			properties.custom_prop_div.html( html );
			    		},
						error: function( objRequest, strError ){
							main.preload_div.addClass('invisible');
			        		console.log(objRequest);   
			        		console.log(strError);   
			        	},
			       	 	async: true
			    	});		
}

