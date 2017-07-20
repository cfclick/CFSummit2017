<cfcomponent output="false" hint="My App Configuration">
<cfscript>
// Configure ColdBox Application
function configure(){

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
		urls					= { homepage: "http://localhost/CFSummit2017/PDFViewer/index.cfm" },
		environment				= "Development",
		uploadFolder			= "inetpub\wwwroot\CFSummit2017\PDFViewer\uploads\",
		workFolder				= "C:\inetpub\wwwroot\CFSummit2017\PDFViewer\uploads\Work\",
		blankPDF				= "C:\inetpub\wwwroot\CFSummit2017\PDFViewer\uploads\blank.pdf"
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

</cfscript>
</cfcomponent>