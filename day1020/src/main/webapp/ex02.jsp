<%@page import="java.util.Enumeration"%>
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
		String queryString = request.getQueryString();		
		Enumeration<String> list = request.getParameterNames();
		while(list.hasMoreElements()){
			String key = list.nextElement();
			String value = request.getParameter(key);
			out.print(key + "===>" + value+ "<br>");
		}
	%>
	<hr>
	queryString : <%= queryString %>
	
	
</body>
</html>