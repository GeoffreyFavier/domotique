<jsp:useBean id="login" class="java.lang.String" scope="session"/>
<nav class="navbar navbar-default navbar-static-top">
	<a class="navbar-brand">Home-Ezi</a>
	<%
		if (login.equals("")){
		%>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">Home</a></li> 
				<li><a href="signin.jsp">Sign in</a></li> 
				<li><a href="login.jsp">Login</a></li> 
			</ul>
		</div>
		<%
		} else if ((Boolean)(request.getSession().getAttribute("admin"))){
			%>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav"> 
					<li class="active"><a href="index.jsp">Home</a></li> 
					<li><a href="admin.jsp">Administration</a></li>
					<li><a href="Servlet?op=Account"><%=login %></a></li> 
					<li><a href="Servlet?op=logout">Logout</a></li> 
				</ul>
			</div>
			<%
		} else {
			%>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav"> 
					<li class="active"><a href="index.jsp">Home</a></li> 
					<li><a href="Servlet?op=Account"><%=login %></a></li> 
					<li><a href="Servlet?op=logout">Logout</a></li> 
				</ul>
			</div>
			<%
		}
%>
</nav>