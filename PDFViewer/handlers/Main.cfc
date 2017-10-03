﻿component output="false"{

	function index(event, rc, prc ){
		prc.welcomeMessage = "Welcome to PDF Viewer";
		
		if( !isDefined( "rc.pdfFile" ) )
			rc.pdfFile = application.cbcontroller.getconfigSettings().blankPDF;

		try
        {
			if( isdefined("rc.newuserpassword" ) ){
				cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword );
				rc.reader = reader;
				
				event.setView("Main/index");
			}else{
				cfpdf( action="getinfo", name="reader", source=rc.pdfFile );
				rc.reader = reader;
				
				//event.setView("Main/index");
				event.setView("Main/home");
			}
        	
        }
        catch(Any e)
        {
			throw(message=e.message);
        }

	}

	function fileUploadForm( event, rc, prc ){
		event.setView("Main/fileUploadForm").noLayout();
	}
  
	
	function ping( event, rc, prc ){

		event.renderData( data=session, type="json" ).nolayout();
	}
	
	function logout( event, rc, prc ){
		sessioninvalidate();
		getPageContext().getSession().invalidate();
		//event.renderData( data=session, type="json" ).nolayout();
	}
	

	public any function uploadFiles( event, rc, prc ){
		
		if( isdefined('rc.ping'))
			return rc.ping;
		
		//writeDump(rc);abort;
        rc.files = [];
        var validMimeTypes =  {'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}};

        try
        {
        	var uploadResult = "";
        	f = getFileInfo(rc["FILES[]"]);
        	if( f.size > 29999000 ){
        		throw(message="Invalid file size, max file size allowed is 29.9mb.", type='file',detail='',errorcode='801');
        	}
        	var tempdir = GetTempDirectory()& session.sessionID;
        	if( ! directoryExists( tempdir ) ){
        		cfdirectory(action="create" ,directory=tempdir);
        	}
        	
        	cffile(action="upload", filefield="files[]",
	            destination=tempdir, mode="600",
	            accept="#StructKeyList(validMimeTypes)#",
	            strict="true",
	            result="uploadResult",
	            nameconflict="overwrite");
			
			rc.CLIENTFILE = uploadResult.CLIENTFILE;
	       //writeDump(uploadResult);    abort; 
        }
        catch(Any e)
        {       	
	        var showerror = "";
        	if (FindNoCase("No data was received in the uploaded", e.message) )
		        showerror="Zero length file";
		
		    // prevent invalid file types --->
		    else if( FindNoCase("The MIME type or the Extension of the uploaded file", e.message) )
		        showerror="Invalid file type";
		
		    // prevent empty form field --->
		    else if (FindNoCase("did not contain a file.", e.message) )
		        showerror="Empty form field";
		
		    // all other errors --->                           
		    else
		        showerror=e.message;
		    
		    throw(message=showerror);

        }
        
        
        try
        {
        	var actualMimeType = FileGetMimeType(uploadResult.ServerDirectory & '/' & uploadResult.ServerFile, true);

			// redundant check with strict="true", does not hurt to double check Adobe --->  
			if (NOT StructKeyExists(validMimeTypes, actualMimeType) ){
				 cffile( action="delete", file="#uploadResult.ServerDirectory#/#uploadResult.ServerFile#");

			    rc.files.append({uploadedFile=uploadResult.ServerFile,error="Invalid file type uploaded",success=false});		    
				return event.renderData(data=rc, type="json");
			}
			
		//	var orgpathtosave = application.cbcontroller.getconfigSettings().uploadFolder;
			if( !directoryExists( application.cbcontroller.getconfigSettings().uploadFolder ) )
				cfdirectory(action="create" ,directory=application.cbcontroller.getconfigSettings().uploadFolder);

			/*cffile(action="copy",
			       source="#uploadResult.ServerDirectory#\#uploadResult.ServerFile#",
			       destination=orgpathtosave, mode="644");*/

			var pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "/";

			if( !directoryExists( pathtosave ) )
				cfdirectory(action="create" ,directory=pathtosave);
			
			var org = pathtosave & "original/";	

			if( !directoryExists( org ) )
				cfdirectory(action="create" ,directory=org);

			cffile(action="copy",
			       source="#uploadResult.ServerDirectory#\#uploadResult.ServerFile#",
			       destination=org, mode="644");

			var fileName = replace(uploadResult.ServerFile, "&", "_");
			var noextFileName = replace(fileName, ".pdf", "");
			uploadFile.destination = pathtosave & fileName;
			sleep(200);
			cffile(action="copy",
			       source="#uploadResult.ServerDirectory#\#uploadResult.ServerFile#",
			       destination="#uploadFile.destination#", mode="644");
			
			var thumb = pathtosave & "thumbnail/" & noextFileName & "/";
			if( !directoryExists( thumb ) )
				cfdirectory(action="create" ,directory=thumb);
			
			cfpdf( action="thumbnail", source=uploadFile.destination, destination=thumb, overwrite="yes", pages="1" );
			/*thread name="thumbThread" action="run" priority="low" src=uploadFile.destination dest=thumb {
				cfpdf( action="thumbnail", source=src, destination=dest, overwrite="yes", pages="1" );
			}*/
			sleep(1550);		
		    //rc.files.append({success:true}); 
			setNextEvent(event="main.index",queryString="pdfFileName=#uploadResult.ServerFile#"); 
     
		   // return event.renderData(data=uploadFile.destination, type="json").noLayout();
   
		    
        }
        catch(Any e)
        {
	      /*  rc.files.append({error=e.message,success=false});	        
	        return event.renderData(data=rc, type="json").noLayout();*/
	        throw( e );
        }
	}
	
	
	public any function urlToPDF( event, rc, prc ){
		
		if( !directoryExists( application.cbcontroller.getconfigSettings().uploadFolder ) )
				cfdirectory(action="create" ,directory=application.cbcontroller.getconfigSettings().uploadFolder);
				
		var pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "/";
		//  /^(?:www\.)?(.*?)\.(?:com|au\.uk|co\.in)$/
		//  .*([^\.]+)(com|net|org|info|coop|int|co\.uk|org\.uk|ac\.uk|uk)$
		var filename = ReplaceNoCase( rc.url_input, "https://", "", "all");
		filename = ReplaceNoCase( filename, "http://", "", "all");
		filename = ReplaceNoCase( filename, "www.", "", "all");
		
	
		filename = filename & '.pdf';
		var noextFileName = replace(fileName, ".pdf", "");
		if( !directoryExists( pathtosave ) )
			cfdirectory(action="create" ,directory=pathtosave);
			
		var org = pathtosave & "original/";	

		if( !directoryExists( org ) )
			cfdirectory(action="create" ,directory=org);
		
		var tempdir = GetTempDirectory()& session.sessionID;
    	if( ! directoryExists( tempdir ) ){
    		cfdirectory(action="create" ,directory=tempdir);
    	}
				
		cfhtmlTopdf( source="#rc.url_input#", destination="#pathtosave##filename#", overwrite="true" );
		
		cffile(action="copy",
			       source="#pathtosave##fileName#",
			       destination="#org#", mode="644");
		
		cffile(action="copy",
			       source="#pathtosave##fileName#",
			       destination="#tempdir#", mode="644");
			       
		var thumb = pathtosave & "thumbnail/" & noextFileName & "/";
			if( !directoryExists( thumb ) )
				cfdirectory(action="create" ,directory=thumb);
					       
		thread name="thumbThread" action="run" priority="low" src="#pathtosave##fileName#" dest=thumb {
				cfpdf( action="thumbnail", source=src, destination=dest, overwrite="yes", pages="1" );
			}
			sleep(550);			
		    //rc.files.append({success:true}); 
			event.renderData(type='json',data=rc ).nolayout();
			//setNextEvent(event="main.index",queryString="pdfFileName=#fileName#"); 
	}

	public any function passwordProtect( event, rc, prc ){
		
		
		if( !isDefined( "rc.pdfFile" ) )
			return "Please select PDF file to Protect!";
		
		if( isdefined("rc.newuserpassword") and len( rc.newuserpassword ) ){
			cfpdf( action="protect" 
				,source=rc.pdfFile
				, newuserpassword=rc.newuserpassword
				, overwrite="yes" );
		}
		cfpdf( action="getinfo", name="reader", source=rc.pdfFile, password=rc.newuserpassword);
		rc.reader = reader;
		event.renderData(type='json',data=rc ).nolayout();
		//setNextEvent(event="main.index",queryString="pdfFile=#rc.pdfFile#&newuserpassword=#rc.newuserpassword#");
	}

	

	

	/*public any function addDigitalSignatureField( event, rc, prc ){
		
		var source = trim( rc.pdfFile );
		var destination = GetTempDirectory() & rc.fileName;//"C:\Temp\pdfs\_signfield.pdf";// trim( arguments.destinationPDFPath );
		var reader = createobject("java","com.lowagie.text.pdf.PdfReader").init( source );
		var fileOutputStream = CreateObject("java", "java.io.FileOutputStream").init( destination );
		var stamper = createobject("java","com.lowagie.text.pdf.PdfStamper").init( reader, fileOutputStream );		
    	// create a signature form field
        var pdfFormField = createobject("java","com.lowagie.text.pdf.PdfFormField");
        var field = pdfFormField.createSignature( stamper.getWriter() );
        field.setFieldName( rc.fieldName );
        // set the widget properties
        var rectangle = createobject("java","com.lowagie.text.Rectangle");              
       	var pdfAnnotation = createobject("java","com.lowagie.text.pdf.PdfAnnotation");
        field.setWidget( rectangle.init(rc.x1, rc.y1, rc.x2, rc.y2), pdfAnnotation.HIGHLIGHT_OUTLINE);
        field.setFlags( pdfAnnotation.FLAGS_PRINT );
        // add the annotation        
        var pdfAppearance = createobject("java","com.lowagie.text.pdf.PdfAppearance");
        stamper.addAnnotation( field, rc.page );
        // close the stamper
    	stamper.close();
		sleep(200);
		cfpdf( action="getinfo", name="reader", source=destination, password=rc.newuserpassword );
		rc.reader = reader;	  
		rc.PDFFILE = destination;
		event.renderData( data=rc, type="json" ).nolayout();
	}*/
	
	public any function resetToOrginal( event, rc, prc ){
		//filecopy( rc.orgPDFFile, rc.pdfFile,  );
		var workingFolder = application.cbcontroller.getconfigSettings().workFolder;
		cffile(action="copy", source= rc.orgPDFFile, destination=workingFolder  );
		var destFile = workingFolder & '\' & fileName;
		//cfpdf( action="getinfo", name="reader", source=destFile );
		rc.PDFFILE = destFile;	  
		event.renderData( data=rc, type="json" ).nolayout();
	}
    
}

	