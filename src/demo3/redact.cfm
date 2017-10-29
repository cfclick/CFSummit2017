<cfscript>
		util = new CFSummit2017.src.Util();
		root = util.getColdFusionRootPath();

		currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	    des = currentFolder & "SpeakerFormCFSummit2017_redact.pdf";
	    src = currentFolder & "SpeakerFormCFSummit2017.pdf";
	    cfpdf( action="redact" 
			 ,source=src 
			 ,destination=des 
			 ,overwrite="yes"){
			 	cfpdfparam(coordinates="180,450,400,500", pages="1");
			 };
</cfscript>


<a href="/CFSummit2017/src/index.cfm">Back</a>
<h4>Redact added</h4>
<cfoutput>
	<p>#des#</p>
<iframe src="SpeakerFormCFSummit2017_redact.pdf" height="100%" width="100%" />
</cfoutput>