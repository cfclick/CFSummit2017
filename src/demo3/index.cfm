
<cfpdf action="redact" 
		source="SpeakerFormCFSummit2017.pdf" 
		destination="SpeakerFormCFSummit2017_redact.pdf" 
		overwrite="yes" >
		
		<cfpdfparam coordinates="180,450,400,500" pages="1">
</cfpdf>

<iframe src="SpeakerFormCFSummit2017_redact.pdf" height="100%" width="100%" />