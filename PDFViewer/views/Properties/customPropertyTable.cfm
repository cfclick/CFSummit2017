<cfoutput>
	<table class="table">
	
		<!--Table head-->
		<thead class="mdb-color darken-3">
			<tr class="text-white">
				<th>
					##
				</th>
				<th>
					Name
				</th>
				<th>
					Value
				</th>
				<th>
				</th>
			</tr>
		</thead>
		<!--Table head-->
		
		<!--Table body-->
		<tbody>
			<cfloop collection="#rc.pdf.Properties#" item="prop">
				<tr>
					<th scope="row">
						1
					</th>
					<td>
						#prop#
					</td>
					<td>
						#rc.pdf.Properties[prop]#
					</td>
					<td>
						delete
					</td>
				</tr>
			</cfloop>
		</tbody>
		<!--Table body-->
	</table><!--Table-->
</cfoutput>