<%@page import="com.sist.dao.DeptDAO"%>
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
		request.setCharacterEncoding("utf-8");

	%>
	<jsp:useBean id="d" class="com.sist.vo.DeptVO"/>
	<jsp:setProperty property="*" name="d"/>
	<%
		DeptDAO dao = new DeptDAO();
		int re = dao.insertDept(d);
		if(re == 1){
			out.print("부서 등록");
			out.print("<br><a href='listDept.jsp'>부서 목록</a>");
		}else{
			out.print("실패");
		}
	%>
	<hr>
	<a href="insertDept.jsp"></a>
</body>
</html>