<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="java.lang.String" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ServletGestion" method="post">
		<ul>
			<li><input type="hidden" name="op" value="createZone"></li>
			<li><input type="text" name="nomZone"></li>
			<li><input type="text" name="description"></li>
			<li><input type="submit" name="ok"></li>
		</ul>
	</form>
</body>
</html>