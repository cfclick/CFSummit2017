<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Sign a pdf</title>
</head>

<body>
	<h2>You have to run demo2 first</h2>
	<cfscript>
		currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	    des = currentFolder & "SpeakerFormCFSummit2017_signature_field_signed.pdf";
	    src = "C:\ColdFusion2016\cfusion\wwwroot\cfsummit2017\src\demo2\SpeakerFormCFSummit2017_signature_field.pdf";
	    cert = "C:\ColdFusion2016\jre\bin\my_keys.pfx";
	      
	    cfpdf( action="sign" ,source=src, destination=des ,keystore=cert ,keystorepassword="123456", signaturefieldname="mysignature") ;	
	    
	   
    </cfscript>
	<h2>PDF signed #des#</h2>	
</body>
</html>
