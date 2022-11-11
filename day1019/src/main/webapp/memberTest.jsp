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
		/* MemberVO m = new MemberVO();
		m.setId("tiger");
		m.setPwd("1234");
		out.print(m.getId());
		out.print(m.getName());
		out.print(m.get()); */
	%>
	<jsp:useBean id="m" class="com.sist.vo.MemberVO"/>
	<jsp:setProperty property="id" name="m" value="tiger"/>
	<jsp:setProperty property="name" name="m" value="hong"/>
	<jsp:setProperty property="pwd" name="m" value="1234"/>
	<jsp:getProperty property="id" name="m"/>
	<jsp:getProperty property="name" name="m"/>
	<jsp:getProperty property="pwd" name="m"/>
</body>
</html>