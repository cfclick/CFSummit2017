﻿component output="false"{	function index(event, rc, prc ){		prc.welcomeMessage = "Welcome to PDF Viewer";				if( !isDefined( "rc.pdfFile" ) )			rc.pdfFile = application.cbcontroller.getconfigSettings().blankPDF;		try
        {			if( isdefined("rc.newuserpassword" ) ){				cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword );				rc.reader = reader;				event.setView("Main/index");			}else{				cfpdf( action="getinfo", name="reader", source=rc.pdfFile );				rc.reader = reader;				event.setView("Main/index");			}
        	
        }
        catch(Any e)
        {			if( findNocase( e.message, 'Error: The password provided' ) ){							}
        }
	}		function preview( event, rc, prc ){				if( !isDefined( "rc.pdfFile" ) )			rc.pdfFile = application.cbcontroller.getconfigSettings().blankPDF;				if( isDefined( "rc.orgPdfFile" ) )			rc.pdfFile = rc.orgPdfFile;		if( isdefined("rc.newuserpassword" ) ){				cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword );			}else{				cfpdf( action="getinfo", name="reader", source=rc.pdfFile);			}		var binaryobj = filereadBinary( rc.pdfFile  );		//cfpdf( action="getinfo", name="reader", source=rc.pdfFile);		rc.reader = reader;	  		event.renderData( data=binaryobj, type="PDF" ).nolayout();	}	public any function uploadFiles( event, rc, prc ){				if( isdefined('rc.ping'))			return rc.ping;				        rc.files = [];        var validMimeTypes =  {'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}};        try        {        	var uploadResult = "";        	f = getFileInfo(rc["FILES[]"]);        	if( f.size > 29999000 ){        		throw(message="Invalid file size, max file size allowed is 29.9mb.", type='file',detail='',errorcode='801');        	}        	        	cffile(action="upload", filefield="files[]",	            destination="#GetTempDirectory()#", mode="600",	            accept="#StructKeyList(validMimeTypes)#",	            strict="true",	            result="uploadResult",	            nameconflict="makeunique");						rc.CLIENTFILE = uploadResult.CLIENTFILE;	       //writeDump(uploadResult);    abort;         }        catch(Any e)        {       		        var showerror = "";        	if (FindNoCase("No data was received in the uploaded", e.message) )		        showerror="Zero length file";				    // prevent invalid file types --->		    else if( FindNoCase("The MIME type or the Extension of the uploaded file", e.message) )		        showerror="Invalid file type";				    // prevent empty form field --->		    else if (FindNoCase("did not contain a file.", e.message) )		        showerror="Empty form field";				    // all other errors --->                           		    else		        showerror=e.message;		    		    throw(message=showerror);        }                        try        {        	var actualMimeType = FileGetMimeType(uploadResult.ServerDirectory & '/' & uploadResult.ServerFile, true);			// redundant check with strict="true", does not hurt to double check Adobe --->  			if (NOT StructKeyExists(validMimeTypes, actualMimeType) ){				 cffile( action="delete", file="#uploadResult.ServerDirectory#/#uploadResult.ServerFile#");			    rc.files.append({uploadedFile=uploadResult.ServerFile,error="Invalid file type uploaded",success=false});		    				return event.renderData(data=rc, type="json");			}						var orgpathtosave = application.cbcontroller.getconfigSettings().uploadFolder;			if( !directoryExists( orgpathtosave ) )				cfdirectory(action="create" ,directory=orgpathtosave);			cffile(action="copy",			       source="#uploadResult.ServerDirectory#\#uploadResult.ServerFile#",			       destination=orgpathtosave, mode="644");			var pathtosave = application.cbcontroller.getconfigSettings().workFolder;			if( !directoryExists( pathtosave ) )				cfdirectory(action="create" ,directory=pathtosave);						uploadFile.destination = pathtosave & replace(uploadResult.ServerFile, "&", "_");			sleep(200);			cffile(action="move",			       source="#uploadResult.ServerDirectory#\#uploadResult.ServerFile#",			       destination="#uploadFile.destination#", mode="644");														    rc.files.append({success:true}); 			setNextEvent(event="main.index",queryString="pdfFile=#uploadFile.destination#&FileName=#uploadResult.ServerFile#");      		   // return event.renderData(data=uploadFile.destination, type="json").noLayout();   		            }        catch(Any e)        {	      /*  rc.files.append({error=e.message,success=false});	        	        return event.renderData(data=rc, type="json").noLayout();*/	        throw( e );        }	}	public any function passwordProtect( event, rc, prc ){						if( !isDefined( "rc.pdfFile" ) )			return "Please select PDF file to Protect!";				if( isdefined("rc.newuserpassword") and len( rc.newuserpassword ) ){			cfpdf( action="protect" 				,source=rc.pdfFile				, newuserpassword=rc.newuserpassword				, overwrite="yes" );		}		cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword);		rc.reader = reader;		event.renderData(type='json',data=rc ).nolayout();		//setNextEvent(event="main.index",queryString="pdfFile=#rc.pdfFile#&newuserpassword=#rc.newuserpassword#");	}	public any function sanitize( event, rc, prc ){				cfpdf( action="sanitize" ,source=rc.pdfFile, overwrite="yes");		cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword);		rc.reader = reader;		event.renderData(type='json',data=rc ).nolayout();	}	public any function readMetadata( event, rc, prc ){		cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword );		rc.reader = reader;	  		event.renderData( data=rc, type="json" ).nolayout();	}	public any function redact( event, rc, prc ){		rc.cord = "#rc.x1#,#rc.y1#,#rc.x2#,#rc.y2#";		cfpdf(action="redact"				, source=rc.pdfFile				, overwrite=true ) {	 	 		cfpdfparam( coordinates=rc.cord, pages=1);  		};		cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword );		rc.reader = reader;	  		event.renderData( data=rc, type="json" ).nolayout();	}	public any function resetToOriginal( event, rc, prc ){	}}	