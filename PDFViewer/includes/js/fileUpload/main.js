/*
 * jQuery File Upload Plugin JS Example
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/* global $, window */

$(function () {
    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        url: '?event=Main.UploadFiles'
    });

    // Enable iframe cross-domain access via redirect option:
    $('#fileupload').fileupload(
        'option',
        'redirect',
        window.location.href.replace(
            /\/[^\/]*$/,
            '?event=Main.UploadFiles'
        )
    );

    //if (window.location.hostname === 'shirak-dms.qbillc.com') {
        // Demo settings:
        $('#fileupload').bind('fileuploaddone', function (e, data) {
        	 //	toastr["success"]( "Your file(s) has been uploaded to <u>Client Files</u> folder." );
        	 
        	  			 
        	  			//console.log(data)
        	  	if(!$('.modal-backdrop').hasClass('in')){
        	  		
					var dialog = bootbox.dialog({
			    		message: '<h4 style="color:green;text-align:center;">Success <i class="fa fa-check" aria-hidden="true"></i> </h4> <p class="text-center">Your file(s) has been uploaded to  <span class=" fa fa-folder-o fa-lg text-warning"></span> <u>Client Files</u> folder.</p> <hr> <p class="text-right"> </p>  <p class="text-right"><button type="button" onClick="refreshPage();"  class="btn btn-default"  >Continue</button></p> ', 
			    		closeButton: false
				});
				}
				
				/*setTimeout(function(){
					window.location = '/Client/files';
				} , 1500);*/
				
        });
        
        $('#fileupload').fileupload('option', {
        	
            url: '?event=Main.UploadFiles',
            // Enable image resizing, except for Android and Opera,
            // which actually support image resizing, but fail to
            // send Blob objects via XHR requests:
            disableImageResize: /Android(?!.*Chrome)|Opera/
                .test(window.navigator.userAgent),
            maxFileSize: 29999000,
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png|pdf|docx|doc|xlsx|xls)$/i
        });
        // Upload server status check for browsers with CORS support:
        if ($.support.cors) {
            $.ajax({
                url: '?event=Main.UploadFiles&ping=true',
                type: 'HEAD'
            }).fail(function () {
                $('<div class="alert alert-danger"/>')
                    .text('Upload server currently unavailable - ' +
                            new Date())
                    .appendTo('#fileupload');
            }) ;
        }
   /* } else {
        // Load existing files:
        $('#fileupload').addClass('fileupload-processing');
        $.ajax({
            // Uncomment the following to send cross-domain cookies:
            //xhrFields: {withCredentials: true},
            url: $('#fileupload').fileupload('option', 'url'),
            dataType: 'json',
            context: $('#fileupload')[0]
        }).always(function () {
            $(this).removeClass('fileupload-processing');
          
        }).done(function (result) {
            $(this).fileupload('option', 'done')
                .call(this, $.Event('done'), {result: result});
           
        });
    }*/

});

/*function beforeUpload(){
		
	var obj = $("li.node-selected");
		//console.log( obj[0].innerText );
	if( obj.length > 0 ){
		var allowedFolders = ["Archives","Contracts", "Proposals", "Year End Package"];
		var index = $.inArray(obj[0].innerText, allowedFolders);
		if( index != -1 ){
			$('#documentPackage').val(obj[0].innerText);
		}
		
	}
	return true;
}*/
function refreshPage(){
	window.location = '/Client/files'
}
function beforeUpload(){
	return true;
}
