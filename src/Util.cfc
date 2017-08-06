component  output="false"
{
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
}