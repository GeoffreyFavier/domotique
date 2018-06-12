<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="java.lang.String" scope="session"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	    <title>Domotique</title>
	
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
		<div class="jumbotron" style="text-align: center;">
		  <h1>Dom-Ezi</h1>
		  <p>Bienvenue sur Dom-Ezi blablabla lorem ipsum ...</p>
		  <p><% if (login.equals("")){ %>
		  	<a class="btn btn-primary btn-lg" href="login.jsp" role="button">Login</a>
		  	<a class="btn btn-primary btn-lg" href="signin.jsp" role="button">Sign in</a>
		  	 <% }else {%>
		  	 Bonjour <b><%=login %></b> <a class="btn btn-primary btn-lg" href="Servlet?op=logout" role="button">Log out</a>
		  	 <% } %>
		  </p>
		</div>
	</body>
</html>
