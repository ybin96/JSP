<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String color = request.getParameter("color");
%>
<body bgcolor="<%=color%>">
<h1>If-else Example</h1>
<p><%= name %>이 좋아하는 색깔은 <b><%=color %></b>입니다</p>
</body>
</html>