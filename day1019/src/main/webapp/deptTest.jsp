<%@page import="com.sist.vo.DeptVO"%>
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
		/* DeptVO d = new DeptVO();
		d.setDno(10);
		d.setDname("총무팀");
		d.setDloc("판교");
		out.print(d.getDno());
		out.print(d.getDname());
		out.print(d.getDloc()); */
	%>
	
	<jsp:useBean id="d" class="com.sist.vo.DeptVO"/>
	<jsp:setProperty property="dno" name="d" value="10"/>
	<jsp:setProperty property="dname" name="d" value="기획팀"/>
	<jsp:setProperty property="dloc" name="d" value="판교"/>
	<jsp:getProperty property="dno" name="d"/>
	<jsp:getProperty property="dname" name="d"/>
	<jsp:getProperty property="dloc" name="d"/>
</body>
</html>