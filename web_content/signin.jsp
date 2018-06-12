<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="java.lang.String" scope="session"/>
<%
	//si l'utilisateur est deja connecte, on le redirige
	if (!login.equals(""))
		request.getRequestDispatcher("index.jsp").forward(request, response);
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>SignIn</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
		</style>
	</head>
	<body>
		<div class="container">
			<form class="form-signin" action="Servlet" method="POST">
				<input type="hidden" name="op" value="signin">
				<h2 class="form-signin-heading">Sign In</h2>
				<label for="inputName" class="sr-only">Name</label>
				<input type="text" id="inputName" name="name" class="form-control" placeholder="Name" required autofocus>
				<label for="inputEmail" class="sr-only">E-mail</label>
				<input type="email" id="inputEmail" name="email" class="form-control" placeholder="Email" required autofocus>
				<label for="inputLogin" class="sr-only">Login</label>
				<input type="text" id="inputLogin" name="login" class="form-control" placeholder="Login" required autofocus>
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required autofocus onchange="form.passwordRepeated.pattern = this.value;">
				<label for="inputPasswordRepeated" class="sr-only">PasswordRepeated</label>
				<input type="password" id="inputPasswordRepeated" name="passwordRepeated" class="form-control" placeholder="Repeat Password" required autofocus>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			</form>
		</div>
	</body>
</html>
