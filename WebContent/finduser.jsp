<%@ page language="java" contentType="text/html; charset=UTF-8" import="beans.*, java.util.List"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find a user</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesnt work if you view the page via file:// -->
<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->

</head>
<body>
	<jsp:include page="navbar.jsp" />
	<form action="ServletGestion" method="post">
		<input type="hidden" name="op" value="findUser">
		<input type="test" name="userToFind">
		<input type="submit" value="Find">
	</form>
	<%
		List<User> usersFind = (List<User>)request.getAttribute("usersFind");
		if (usersFind != null){
			
		%>
		<div class="container">
		<h2>Users Find</h2>
 		<p>Here are the user we find :</p>            
		<table class="table table-hover">
 		<thead>
		<tr>
        	<th>Login</th>
        	<th>Name</th>
        	<th>AImplémenter</th>
      	</tr>
    	</thead>
		
		<%
			for (User user : usersFind){
		%>
 
		<tbody>
		<tr>
        	<td><%=user.getLogin()%></td>
        	<td><%=user.getName() %></td>
        	<td><a href="ServletUser?op=aImplementre">Set</a></td>
		</tr>
		<%
		}
		%>
		</tbody>
  		</table>
		</div>
		<%
	}
			
	%>
</body>
</html>