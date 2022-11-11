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
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String no = request.getParameter("no");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
	%>
	<h2>Request Test</h2>
	이름 : <%= name %><br>
	학번 : <%= no %><br>
	성별 : <%= gender %><br>
	전공 : <%= major %>
</body>
</html>