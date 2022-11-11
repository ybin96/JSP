<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("login") == null || !session.getAttribute("login").equals("yse")){
			response.sendRedirect("login.html");
		}
			
	%>
	<h2>welcome</h2>
</body>
</html>