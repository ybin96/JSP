<%@page import="com.sist.vo.DeptVO"%>
<%@page import="com.sist.dao.DeptDAO"%>
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
	int dno = Integer.parseInt(request.getParameter("dno"));
	DeptDAO dao = new DeptDAO();
	DeptVO d =dao.findByNo(dno);
%>

<h2>부서 수정</h2>
<form action="updateDeptProcess.jsp" method="post">
	부서번호 :<%=d.getDno() %> 
	<input type="hidden" name="dno" value="<%=d.getDno()%>"><br>
	부서이름 : <input type="text" name="dname" value="<%=d.getDname()%>"><br>
	부서위치 : <input type="text" name="dloc" value="<%=d.getDloc()%>"><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
</form>
</body>
</html>











