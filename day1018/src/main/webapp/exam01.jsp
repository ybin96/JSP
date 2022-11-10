<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date today = new Date();
	int year = today.getYear()+1900;
	int month = today.getMonth()+1;
	int date = today.getDate();
%>								
<%= year%><%= month%><%= date%>	
</body>
</html>