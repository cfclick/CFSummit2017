<cfcomponent output="false" hint="My App Configuration">
<cfscript>
// Configure ColdBox Application
function configure(){

	// coldbox directives
	coldbox = {
		//Application Setup
		appName 				= "PDFViewerApp",

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
		eventCaching			= false
	};

}

</cfscript>
</cfcomponent>