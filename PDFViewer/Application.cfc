/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************
*/
component{
	// Application properties
	this.name = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,5,0);
	this.setClientCookies = true;

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE 	 = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY 		 = "";

	// application start
	public boolean function onApplicationStart(){
		application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// request start
	public boolean function onRequestStart(String targetPage){
		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onSessionStart(){
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		try{

			var dir = arguments.appScope.cbcontroller.getconfigSettings().workFolder & arguments.sessionScope.sessionID & "/";
			writelog(text=dir,application="yes", file="cfsummit2017_info", type="Info");
			cfdirectory( directory = dir, action = "delete", name = "deletedDir", recurse = "true");
			arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
		}catch( any e ){
			writelog(text=e.message,application="yes", file="cfsummit2017_error", type="Error");
		}
		
	}

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}

}