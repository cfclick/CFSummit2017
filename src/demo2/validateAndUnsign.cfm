<cfscript>
	util = new CFSummit2017.src.Util();
	root = util.getColdFusionRootPath();

	currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
    des = currentFolder & "SpeakerFormCFSummit2017_signature_field_unsigned.pdf";
    src = currentFolder & "SpeakerFormCFSummit2017_signature_field_signed.pdf";
        
    cfpdf( action="readsignaturefields"
		   ,source=src
		   ,name="signinfo"
		   );
		
		writedump(signinfo);
		
		for( q in signinfo ){

			cfpdf( action="validatesignature"
				  , source=src
				  , name="pdfInfo");
			
			writedump(pdfInfo);
			
			cfpdf( action="unsign" 
	    	  ,source=src
	    	  ,destination=des 
	    	  ,signaturefieldname=q.FIELDNAME
	    	  ,overwrite="yes") ;
	    	
	    	cfpdf( action="readsignaturefields"
			   ,source=des
			   ,name="unsignedinfo"
			   );
			   
			writedump(unsignedinfo);
		}
	    	
	    
	   
    </cfscript>
<a href="/CFSummit2017/src/index.cfm">Back</a>
<h4>PDF Signature Validated and Unsigned</h4>
<p><cfoutput>#des#</cfoutput></p>