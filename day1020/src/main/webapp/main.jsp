<%@page import="com.sist.vo.MemberVO"%>
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
		if(session.getAttribute("member") != null){
			MemberVO m= (MemberVO)session.getAttribute("member");
			%>
			<%= m.getId() %>(<%= m.getName() %> )님 로그인 하였습니다.
			<hr>
			<%
		}else{
			response.sendRedirect("login.jsp");
		}
	%>

	서비스 문서입니다.
	<br>
	<a href="service1.jsp">서비스1</a><br>
	<a href="service2.jsp">서비스2</a><br>
	<a href="service3.jsp">서비스3</a><br>
</body>
</html>