<cfscript>
		util = new CFSummit2017.src.Util();
		root = util.getColdFusionRootPath();

		currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	    des = currentFolder & "SpeakerFormCFSummit2017_sanitized.pdf";
	    src = currentFolder & "SpeakerFormCFSummit2017.pdf";
	    cfpdf( action="sanitize" 
			 ,source=src 
			 ,destination=des 
			 ,overwrite="yes");
</cfscript>


<a href="/CFSummit2017/src/index.cfm">Back</a>
<h4>PDF Sanitized</h4>
<cfoutput>
	<p>#des#</p>
<iframe src="SpeakerFormCFSummit2017_sanitized.pdf" height="100%" width="100%" />
</cfoutput>