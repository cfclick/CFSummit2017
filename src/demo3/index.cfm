<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Sign a pdf</title>
</head>

<body>
	<h2>You have to run demo2 first</h2>
	<cfscript>
		util = new CFSummit2017.src.Util();
		root = util.getColdFusionRootPath();
		writedump(root);
		currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	    des = currentFolder & "SpeakerFormCFSummit2017_signature_field_signed.pdf";
	    des_unsign = currentFolder & "SpeakerFormCFSummit2017_signature_field_unsigned.pdf";
	    src = root & "\demo2\SpeakerFormCFSummit2017_signature_field.pdf";
	    cert = "C:\F\cert\shirak_key.pfx";
	    
	    cfpdf( action="readsignaturefields"
			   ,source=src
			   ,name="signinfo"
			   );
		
		writedump(signinfo);
		
		for( q in signinfo ){
			
			cfpdf( action="sign" 
	    	  ,source=src
	    	  ,destination=des 
	    	  ,keystore=cert 
	    	  ,keystorepassword="123456"
	    	  ,signaturefieldname=q.FIELDNAME
	    	  ,overwrite="yes") ;
	    	  
	    	 cfpdf( action="readsignaturefields"
			   ,source=des
			   ,name="signedinfo"
			   );
		
			writedump(signedinfo);
			
			cfpdf( action="validatesignature"
				  , source=des
				  , name="pdfInfo");
			
			writedump(pdfInfo);
			
			cfpdf( action="unsign" 
	    	  ,source=des
	    	  ,destination=des_unsign 
	    	  ,signaturefieldname=q.FIELDNAME
	    	  ,overwrite="yes") ;
	    	
	    	cfpdf( action="readsignaturefields"
			   ,source=des_unsign
			   ,name="unsignedinfo"
			   );
			   
			writedump(unsignedinfo);
		}
	    	
	    
	   
    </cfscript>
	<h2><cfoutput>PDF signed #des#</cfoutput></h2>	
</body>
</html>
