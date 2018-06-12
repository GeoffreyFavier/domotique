<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="beans.*, java.util.Collection" %>
<jsp:useBean id="login" class="java.lang.String" scope="session"/>
<jsp:useBean id="zoneList" class="beans.Zone" scope="session"/>



<%
Collection<Zone> zones = zoneList.getSubZones();
if (zones != null){
for (Zone z: zones) {
	%>
	<div class="row">
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <img src="..." alt="...">
	      <div class="caption">
	        <h3><%=z.getName() %></h3>
	        <p><a href="#" class="btn btn-default" role="button">Manage</a></p>
	      </div>
	    </div>
	  </div>
	</div>
<%}
}
%>
<div id="grid" class="row" style="margin: 5% 20% 5% 20%;">
	<div class="row">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
		      <img src="..." alt="..." style="width: 100px; height: auto;">
		      <div class="caption">
		        <p><a href="#" class="btn btn-default" role="button">Create zone</a></p>
		      </div>
		    </div>
		  </div>
	</div>
</div>