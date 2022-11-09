<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="sist?name=hong&age=20">sist</a>
	<hr>
	<form action="sist">
		<input type="text" name="name"><br>
		<input type="text" name="age"><br>
		<input type="submit" value="sist">
	</form>
	<hr>
	<form action="sist" method="post">
		<input type="text" name="name"><br>
		<input type="text" name="age"><br>
		<input type="submit" value="sistPost">
	</form>
</body>
</html>