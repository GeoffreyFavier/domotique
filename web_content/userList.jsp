<%@ page language="java" contentType="text/html; charset=UTF-8" import="domotique.*, java.util.List"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="java.lang.String" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Users' List</title>
 <!-- Bootstrap -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	<jsp:include page="navbar.jsp"/>
	<table>
	<tr><th>Login</th><th>Name</th><th>E-mail</th><th>Is admin</th></tr>
	<%
		List<User> userList = (List<User>)(request.getAttribute("userList"));
		for (User iUser : userList){
			%>
			<tr><td><%=iUser.getLogin()%></td> <td><%=iUser.getName()%></td> <td><%=iUser.getEmail() %></td> <td><%=iUser.getAdmin()%></td> <td><a href="Servlet?op=deleteUser&log=<%=iUser.getLogin() %>">supprimer</a></td></tr>
			<%
		}
	%>
	</table>
</body>
</html>