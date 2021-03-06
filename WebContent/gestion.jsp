<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="beans.*, java.util.Collection, java.util.ArrayList, java.util.ArrayDeque" %>
<jsp:useBean id="zoneList" class="beans.Zone" scope="session" />

ID de la zone <%=zoneList.getId() + request.getRemoteAddr() %>
<div id="grid" class="row" style="margin: 5% 20% 5% 20%;">
<div class="panel panel-primary">
<div class="panel-heading">
<!-- Fil d'Ariane -->
<% Zone cursor = zoneList;
ArrayDeque<Zone> breadCrumb = new ArrayDeque<Zone>();
while(!cursor.getRoot()){
	cursor = cursor.getParent();
	breadCrumb.addFirst(cursor);
}

while(!breadCrumb.isEmpty()) {
	cursor = breadCrumb.poll();
	%>
	<form name="changeZone<%= cursor.getId() %>" action="ServletGestion" method="POST" style="display: inline-block;">
    <input type="hidden" name="op" value="manageZone">
    <input type="hidden" name="zoneId" value="<%=cursor.getId()%>">
    <a href="#" style="color: white;" onclick="document.changeZone<%= cursor.getId() %>.submit()">
	<% out.println(cursor.getName()); %></a> ></form>
<% }
out.println(" <u>" + zoneList.getName() + "</u>");%></div>
<div class="row">

<%
User user = (User)(request.getSession().getAttribute("user"));
Collection<Objet> objets = user.getObjets();
//Collection<Objet> objets = new ArrayDeque<Objet>();
Collection<Zone> zones = zoneList.getSubZones();
int i = 0;
if (zones != null){
for (Zone z: zones) {
	%>
	<div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
			    <form action="ServletGestion" name="manageZone<%=z.getId() %>" method="POST">
		        <input type="hidden" name="op" value="manageZone">
		        <input type="hidden" name="zoneId" value="<%=z.getId()%>">
		        </form>
			      <a href="#" style="color: black;text-decoration:none;" onclick="document.manageZone<%=z.getId() %>.submit()">
				      <img src="images/room.png" alt="..." style="width: 100px; height: auto;cursor: Pointer;">
				        <div class="caption">
				        	<h4 style="text-align: center;"><%=z.getName() %></h4>
				        </div>
				  </a>
		    </div>
	</div>
		        
		        
<!-- <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <div class="caption"><br>
	        <h3><%=z.getName()%></h3>
	        <form action="ServletGestion" method="POST">
	        <input type="hidden" name="op" value="manageZone">
	        <input type="hidden" name="zoneId" value="<%=z.getId()%>">
	        <button class="btn btn-default" type="submit">Manage</button>
	        </form>
	        <br>
	        <form action="ServletGestion" method="POST">
	        <input type="hidden" name="op" value="deleteZone">
	        <input type="hidden" name="zoneId" value="<%=z.getId()%>">
	         <button class="btn btn-default" type="submit">Delete</button>
	        </form>
	        <br>
	        <form action="ServletGestion" method="POST">
	        <input type="hidden" name="op" value="addObject">
	        <input type="hidden" name="zoneId" value="<%=z.getId()%>">
	         <button class="btn btn-default" type="submit">Add object</button>
	        </form>
	      </div>
	    </div>
</div> -->

<%}
}
%>

	<div class="col-sm-6 col-md-4">
	
		    <div class="thumbnail"><a href="#" data-toggle="modal" data-target="#myModal" style="text-decoration:none;">
		    
		      <img src="images/house.png" alt="..." style="width: 100px; height: auto;cursor: Pointer;">
		      <div class="caption">

		        <h4 style="text-align: center">Create Zone</h4>


		      </div></a>
		    </div>
		  </div>

	<div class="col-sm-6 col-md-4">
	
		    <div class="thumbnail"><a href="#" data-toggle="modal" data-target="#myModal2" style="text-decoration:none;">
		    
		      <img src="images/house.png" alt="..." style="width: 100px; height: auto;cursor: Pointer;">
		      <div class="caption">

		        <h4 style="text-align: center">Add Object</h4>


		      </div></a>
		    </div>
		  </div>
	</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Create zone</h4>
      </div>
      
	      <div class="modal-body">
	      <form action="ServletGestion" method="POST">
		        <input type="hidden" name="op" value="createZone">
		        <input type="hidden" name="zoneParent" value="<%= zoneList.getId() %>">
		        <label>Zone name</label> : <input type="text" name="zoneName" required /><br />
		        <label>Description</label> : <input type="text" name="description" /><br />
		        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->  
		        <button class="btn btn-default" type="submit" style="display: none;" id="createZone">Create Zone</button>
		        </form>  
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" type="submit" onclick="document.getElementById('createZone').click()">Create Zone</button>
	      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add object</h4>
      </div>
      
	      <div class="modal-body">
	      <form action="ServletGestion" method="POST">
		        <input type="hidden" name="op" value="addObject">
		        <input type="hidden" name="zone" value="<%= zoneList.getId() %>">
		        <label>Object</label> : 
					<select class="form-control" name="objet">
					  <option disabled selected>Select an object</option>
					  <!-- ICI TU METS LA LISTE DES OBJETS -->
					  <%for (Objet objet:objets) { %>
						<option value="<%= objet.getId() %>"> <%= objet.getNom()%> </option>  
					  <% } %>
					</select>
				<br />
		        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->  
		        <button class="btn btn-default" type="submit" style="display: none;" id="addObject">Add Object</button>
		        </form>  
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" type="submit" onclick="document.getElementById('addObject').click()">Add Object</button>
	      </div>
    </div>
  </div>
</div>
</div>
</div>
