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
	
	function preview( event, rc, prc ){
		
		//if( isdefined('rc.istemp') && len(rc.istemp) ){
			rc.pathAndName = GetTempDirectory() & rc.fileName;
		/*}else{
			rc.pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\";
			rc.pathAndName = rc.pathtosave & rc.fileName;
		}*/
		if( fileexists( rc.pathAndName ) ){
			var binaryobj = filereadBinary( rc.pathAndName  );
			event.renderData( data=binaryobj, type="PDF" ).nolayout();
		}else{
			writedump(rc);abort;
			throw(message:"file #rc.fileName# not found.");
		}
		
	}


	function restore( event, rc, prc ){
		
		rc.originalFile = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\original\" & rc.fileName;
		rc.destination1 = GetTempDirectory() & rc.fileName;
		rc.destination2 = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\";

		thread name="restoreThread01" action="run" priority="high" src=rc.originalFile dest=rc.destination1 {
			try{
					cffile(action="copy",
					source=src,
					destination=dest, mode="644");
			}catch( any e ){
				mailerService = new mail(); 
				mailerService.setTo( 'shirak.avakian@qbillc.com'); 
				mailerService.setFrom( "no-reply@qbillc.com"); 
				mailerService.setSubject( "debug"); 
				mailerService.setType("html"); 
				savecontent variable="mailBody"{ 
									writeDump(src); 
									writeDump(dest); 
									writeDump(e);  } 
				mailerService.send(body=mailBody);
			}
			
		}

		thread action="sleep" duration="300";
		
		thread name="restoreThread03" action="run" priority="high" src=rc.originalFile dest=rc.destination2 {
			try{
					cffile(action="copy",
					source=src,
					destination=dest, mode="644");
			}catch( any e ){
				mailerService = new mail(); 
				mailerService.setTo( 'shirak.avakian@qbillc.com'); 
				mailerService.setFrom( "no-reply@qbillc.com"); 
				mailerService.setSubject( "debug"); 
				mailerService.setType("html"); 
				savecontent variable="mailBody"{
									writeDump(src); 
									writeDump(dest); 
									writeDump(e);  } 
				mailerService.send(body=mailBody);
			}
		}

		thread name="restoreThread01,restoreThread03" action="join";
	
		event.renderData( data=rc.fileName, type="json" ).nolayout();
	}


	function delete( event, rc, prc ){
		
		rc.originalFile 	= application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\original\" & rc.fileName;
		rc.thumbnailFolder 	= application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\thumbnail\";
		rc.tempWorkFile 	= GetTempDirectory() & rc.fileName;
		rc.workFile 		= application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\" & rc.fileName;

		filedelete( rc.originalFile );
		filedelete( rc.tempWorkFile );
		filedelete( rc.workFile );
		cfdirectory( directory=rc.thumbnailFolder, action="delete", recurse="true");
	
		event.renderData( data=rc.fileName, type="json" ).nolayout();
	}
		
	
	function workbench(event,rc,prc){
		rc.homepage = application.cbcontroller.getconfigSettings().urls.homepage;
		rc.pathtosave = GetTempDirectory(); // application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\";
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
