function Config() { 
		var config = this;
		var theActualServer = window.location.host;//with port number
		var protocol = "http://";
		var appFolder = "";
		var CGIScriptName = "/CFSummit2017/PDFViewer/index.cfm";
		//var theActualServer = window.location.hostname; //without port number
		
		this.urls = {};
		this.urls.main = { 
	
			index 			: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.index", 
			preview 		: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.preview",
			uploadFiles		: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.uploadFiles",
			passwordProtect	: protocol + theActualServer + appFolder + CGIScriptName + "?event=main.passwordProtect"
			
		 };
		 
		
	}