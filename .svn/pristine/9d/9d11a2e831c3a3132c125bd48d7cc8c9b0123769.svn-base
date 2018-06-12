<%@ page language="java" contentType="text/html; charset=UTF-8" import="beans.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="java.lang.String" scope="session"/>
<% User user = (User)(request.getSession().getAttribute("user")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	    <title>Personal informations</title>
	
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
	<h2>Change your personnal informations : </h2>
	<form action="ServletUser" method="post">
		<ul>
			<input type="hidden" name="op" value="changeInfo">
			<li><%=user.getLogin()%></li>
			<li><input type="text" name="name" value="<%=user.getName()%>"></li>
			<li><input type="email" name="email" value="<%=user.getEmail() %>"></li>
			<li><a href="ServletUser?op=changePassword">Change password</a></li>
			<li><input type="submit" value="OK"></li>
		</ul>
	</form>
</body>
</html>