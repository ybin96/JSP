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
			<a href="logOut.jsp">로그아웃</a>
			<hr>
			<%
		}else{
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>