<cfscript>
	util = new CFSummit2017.src.Util();
	root = util.getColdFusionRootPath();

	currentFolder = getDirectoryFromPath( getCurrentTemplatePath() );
	des = currentFolder & "SpeakerFormCFSummit2017_user_password.pdf";
    src = currentFolder & "SpeakerFormCFSummit2017.pdf";
	
	cfpdf( action="protect" 
		  ,source=src
		  ,destination=des
		  ,newUserPassword="userP@ss"		  
		  ,overwrite="yes");
</cfscript>

<a href="/CFSummit2017/src/index.cfm">Back</a>
<h4>User password added</h4>
<p><cfoutput>#des#</cfoutput></p>