<cfcomponent output="false" hint="My App Configuration">
<cfscript>
// Configure ColdBox Application
function configure(){
	cfroot					= getColdFusionRootPath();
	// coldbox directives
	coldbox = {
		//Application Setup
		appName 				= "CFAcrobat",

		//Development Settings
		reinitPassword			= "",
		handlersIndexAutoReload = true,

		//Implicit Events
		defaultEvent			= "",
		requestStartHandler		= "",
		requestEndHandler		= "",
		applicationStartHandler = "",
		applicationEndHandler	= "",
		sessionStartHandler 	= "",
		sessionEndHandler		= "",
		missingTemplateHandler	= "",

		//Error/Exception Handling
		exceptionHandler		= "",
		onInvalidEvent			= "",
		customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",

		//Application Aspects

		handlerCaching 			= false,
		eventCaching			= false,
		urls					= { homepage: "http://#CGI.SERVER_NAME#:#CGI.SERVER_PORT#/CFSummit2017/PDFViewer/index.cfm",
									workingpdf: "http://#CGI.SERVER_NAME#:#CGI.SERVER_PORT#/CFSummit2017/PDFViewer/uploads/Work/" },
		environment				= "Development",
		
		uploadFolder			= cfroot & "CFSummit2017\PDFViewer\uploads\",
		workFolder				= cfroot & "CFSummit2017\PDFViewer\uploads\Work\",
		blankPDF				= cfroot & "CFSummit2017\PDFViewer\uploads\blank.pdf"
	};
	
	/*environments = {
			Development = "localhost"
			
		};
		
	function Development(){
		coldbox.settings.email 			= { from='', to='' };
		coldbox.urls 					= { site: "http://localhost/CFSummit2017/PDFViewer/index.cfm" };
		coldbox.reinitPassword 			= '';
		coldbox.debugMode 				= true;
	    coldbox.debugPassword 			= "";
		coldbox.handlersIndexAutoReload = true;
		coldbox.settings.release 		= "1.0";
		coldbox.settings.uploadFolder	= "C:\Temp\CFAcrobat";
		coldbox.settings.workFolder		= "C:\Temp\CFAcrobat\Work";
		
	}*/

}

public string function getColdFusionRootPath( base_path="./" ){
	var actual_path = ExpandPath(arguments.base_path);
	if( FileExists( ExpandPath(arguments.base_path & "Application.cfc"))){
		return replaceNoCase(actual_path,'CFSummit2017\PDFViewer\','');;
	}else if( REFind(".*[/\\].*[/\\].*", actual_path) ){
		var rootpath = getColdFusionRootPath("../#arguments.base_path#");		
		return replaceNoCase(rootpath,'CFSummit2017\PDFViewer\','');
	}else{
		cfthrow(message="Unable to determine Application Root Path", detail="#actual_path#");
	}
}  

</cfscript>
</cfcomponent>