/**
* I am a new handler
*/
component{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";		
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
	
	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler(event,rc,prc,action,eventArguments){
		var rc = event.getCollection();
	}
	function postHandler(event,rc,prc,action,eventArguments){
		var rc = event.getCollection();
	}
	function aroundHandler(event,rc,prc,targetAction,eventArguments){
		var rc = event.getCollection();
		// executed targeted action
		arguments.targetAction(event);
	}
	function onMissingAction(event,rc,prc,missingAction,eventArguments){
		var rc = event.getCollection();
	}
	function onError(event,rc,prc,faultAction,exception,eventArguments){
		var rc = event.getCollection();
	}
	*/
	
	function preview( event, rc, prc ){
		
		if( isdefined('rc.istemp') && len(rc.istemp) ){
			rc.pathAndName = GetTempDirectory() & session.sessionID & '_' & rc.fileName;
		}else{
			rc.pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\";
			rc.pathAndName = rc.pathtosave & rc.fileName;
		}
	
		var binaryobj = filereadBinary( rc.pathAndName  );
		event.renderData( data=binaryobj, type="PDF" ).nolayout();
	}
		
	/*function mypdffiles(event,rc,prc){
		rc.pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\";
		rc.currentWorkingURL = application.cbcontroller.getconfigSettings().urls.workingpdf & session.sessionID & "/";
		
	//	writeDump(rc);
	//	var pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "/";
		cfdirectory( directory =rc.pathtosave, action = "list", name = "qry_workingfolder", filter = "*.pdf", recurse = "false");
		rc.qry_workingfolder = qry_workingfolder;
		return event.setView("viewer/mypdffiles");
	}	*/

	
	function workbench(event,rc,prc){
		rc.homepage = application.cbcontroller.getconfigSettings().urls.homepage;
		rc.pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\";
		rc.pathAndName = rc.pathtosave & rc.fileName;
		if( fileexists( rc.pathAndName ) )
			event.setView("viewer/index");
		else
			setNextEvent(event='main.index');
		/*rc.currentWorkingURL = application.cbcontroller.getconfigSettings().urls.workingpdf & session.sessionID & "/";
		rc.currentWorkingURLAndName = rc.currentWorkingURL & rc.fileName;
		*/
		
	}
	
}
