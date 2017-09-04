function Config() { 
		var config = this;
		var theActualServer = window.location.host;//with port number
		var protocol = "http://";
		var appFolder = "";
		var CGIScriptName = "/CFSummit2017/PDFViewer/index.cfm";
		//var theActualServer = window.location.hostname; //without port number
		
		this.urls = {};
		this.urls.main = { 
	
			index 						: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.index", 
			fileUploadForm				: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.fileUploadForm",
			preview 					: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.preview",
			uploadFiles					: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.uploadFiles",
			passwordProtect				: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.passwordProtect",
			sanitize					: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.sanitize",
			readMetadata				: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.readMetadata",
			
			resetToOrginal				: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.resetToOrginal"
		 };
		 
		 this.urls.digitalsignature = {
		 	addField	: protocol + theActualServer + appFolder + CGIScriptName + "?event=digitalsignature.addField"
		 };
		 
		 this.urls.viewer = {
		 	preview	: protocol + theActualServer + appFolder + CGIScriptName + "?event=viewer.preview"
		 };
		 
		 this.urls.redact = { 
		 	doRedact						: protocol + theActualServer + appFolder + CGIScriptName + "?event=redact.doRedact",
		 };
		 
		 this.urls.root   =  protocol + theActualServer + appFolder + CGIScriptName ;
	}
