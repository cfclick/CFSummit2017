﻿
<cffunction name = "myPDFFiles" >
	<cfset rc.pathtosave = application.cbcontroller.getconfigSettings().workFolder & session.sessionID & "\" />
	<cfset	rc.currentWorkingURL = application.cbcontroller.getconfigSettings().urls.workingpdf & session.sessionID & "/" />	
	<cfdirectory directory="#rc.pathtosave#" action="list" name="qry_workingfolder" filter="*.pdf" recurse="false" />
	<cfset rc.qry_workingfolder = qry_workingfolder />
	<h4>My PDFs</h4>
	
	<div class="col-sm-12 col-md-12 col-lg-12">       
        <!--First row-->
        <div class="row wow fadeIn" data-wow-delay="0.4s">
            <!--First slide-->           
            <cfoutput>
            	<cfloop query="rc.qry_workingfolder" >
                	<cfset noextFileName = replace(name, ".pdf", "") />
                	<cfset thumb_img = "#rc.currentWorkingURL#thumbnail/#noextFileName#/#noextFileName#_page_1.jpg" />
                	<div class="col-md-2" style="padding-top:15px;padding-bottom:15px">
                        <div class="card">
                        	<a href="?event=viewer.workbench&fileName=#name#">
                            <img class="img-fluid" src="#thumb_img#" alt="Card image cap" />
                            </a>
                            <!---<div class="card-body">
                                <!---<h4 class="card-title">#name#</h4>--->
                                <!---<a class="btn btn-primary">Open</a>--->
                            </div>--->
                        </div>
                    </div>                		
                </cfloop>
                <!--/.First slide-->               
            </cfoutput>  
        </div>
        <!--/.First row-->
        <br>
        <hr class="extra-margins">
    </div>
	<cfreturn/>
</cffunction>
