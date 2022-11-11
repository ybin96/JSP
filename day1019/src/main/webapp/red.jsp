<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="red">
 red~~~
 
 <%
 // URL이 노출
 	response.sendRedirect("yellow.jsp");
 %>
 <%-- URL이 노출되지 않음 --%>
 <jsp:forward page="yellow.jsp"></jsp:forward>
</body>
</html>