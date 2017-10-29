<cfscript>
	util = new CFSummit2017.src.Util();
	root = util.getColdFusionRootPath();

	currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	des = currentFolder & "SpeakerFormCFSummit2017_encrypt.pdf";
    src = currentFolder & "SpeakerFormCFSummit2017.pdf";
	
	cfpdf( action="protect" 
		  ,source=src
		  ,destination=des
		  ,newownerpassword="ownerP@ss"
		  ,encrypt="RC4_40"
		  ,permissions="AllowPrinting"		  
		  ,overwrite="yes");
		  
	
</cfscript>
<a href="/CFSummit2017/src/index.cfm">Back</a>
<h4>PDF Encrypted</h4>
<p><cfoutput>#des#</cfoutput></p>