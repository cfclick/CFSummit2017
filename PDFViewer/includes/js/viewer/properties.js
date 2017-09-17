function Properties(){
	properties = this;
	
	//buttons
	this.add_custom_prop_btn = $('#add_custom_prop_btn');
	
	//divs
	this.custom_prop_div = $('#custom_prop_div');
	
	//inputs
	this.fileName = $('#fileName');
	this.fieldName = $('#fieldName');
	this.custome_prop_name = $('#custome_prop_name');
	this.custome_prop_value = $('#custome_prop_value');
	
	
	
	this.setEventListeners();
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
								
}

