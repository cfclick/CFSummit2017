<cfscript>
		util = new CFSummit2017.src.Util();
		root = util.getColdFusionRootPath();

		currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	    des = currentFolder & "SpeakerFormCFSummit2017_signature_field_signed.pdf";
	    src = currentFolder & "SpeakerFormCFSummit2017_signature_field.pdf";
	    cert = root & "\cert\shirak_key.pfx";
	    
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
		}	
			
		
	    	
	    
	   
    </cfscript>
<a href="/CFSummit2017/src/index.cfm">Back</a>
<h4>PDF Signed</h4>
<p><cfoutput>#des#</cfoutput></p>