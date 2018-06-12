<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String homeType = (String)request.getSession().getAttribute("homeType");%>
<jsp:useBean id="login" class="java.lang.String" scope="session" />
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
<!-- WARNING: Respond.js doesnt work if you view the page via file:// -->
<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<%
		if (login.equals("")){
		%>
	<jsp:include page="welcome.jsp" />
	<%
		} else {
			if (homeType.equals("home")) {
			%>
	<jsp:include page="welcomeUser.jsp" />
	<%
			} else { %>
	<jsp:include page="gestion.jsp" />	
	<%
			}
		}
%>

<!--  SCRIPT JS ET JQUERY -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
