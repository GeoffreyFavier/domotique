<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Import a new object</title>

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
	<form action="ServletUpload" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="op" value="newObject">
		<ul>
			<li>Name : <input name="objectName" type="text"></li>
			<li>Description : <input name="objectDescription" type="text"></li>
			<li>.class file : <input name="classFile" type="file"></li>
			<li><input type="submit" value="Ok"></li>
		</ul>
	</form>
</body>
</html>