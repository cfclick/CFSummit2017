<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Create Signature Field</title>
</head>

<body>
	<cfscript>
		//create signature field
		public void function addSignatureField(String src, String dest, string fieldName, string page, numeric x1, numeric y1, numeric x2, numeric y2 ) {
			//Read source file
	    	reader = createobject('java','com.lowagie.text.pdf.PdfReader').init( src );
	    	//create output stream instance
	    	fileOutputStream = CreateObject("java", "java.io.FileOutputStream").init( dest );
	    	//create stamper instance
	    	stamper = createobject('java','com.lowagie.text.pdf.PdfStamper').init( reader, fileOutputStream );
	        // create a signature form field
	        pdfFormField = createobject("java","com.lowagie.text.pdf.PdfFormField");
	        field = pdfFormField.createSignature( stamper.getWriter() );
	        field.setFieldName( arguments.fieldName );
	        // set the widget properties
	        rectangle = createobject("java","com.lowagie.text.Rectangle");              
	       	pdfAnnotation = createobject("java","com.lowagie.text.pdf.PdfAnnotation");
	        field.setWidget( rectangle.init( arguments.x1, arguments.y1, arguments.x2, arguments.y2 ), pdfAnnotation.HIGHLIGHT_OUTLINE );
	        field.setFlags( pdfAnnotation.FLAGS_PRINT );    
	        
	       	// add the annotation
	        stamper.addAnnotation( field, arguments.page );	      
	        // close the stamper
	    	stamper.close();
	    }
	    currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	    des = currentFolder & "SpeakerFormCFSummit2017_signature_field.pdf";
	    src = currentFolder & "SpeakerFormCFSummit2017.pdf";
	    addSignatureField(src,des,'manager_signature_field',1,440,75,570,38);  
	    writeoutput("New signature field create #des#") ;
    </cfscript>

</body>
</html>
