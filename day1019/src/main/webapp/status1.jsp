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
	request.setAttribute("a", 100);
	session.setAttribute("b", 100);
	application.setAttribute("c", 100);
	
	/* int a = (Integer)request.getAttribute("a");
	int b = (Integer)session.getAttribute("b");
	int c = (Integer)application.getAttribute("c"); */
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("status2.jsp");
	dispatcher.forward(request, response);
%>
	
</body>
</html>