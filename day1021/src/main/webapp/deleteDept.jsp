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
		int dno = Integer.parseInt(request.getParameter("dno"));
		DeptDAO dao = new DeptDAO();
		int re = dao.deleteDept(dno);
		if(re == 1){
			response.sendRedirect("listDept.jsp");
		}else{
			%>
			부서 삭제 실패 <br>
			<a href="listDept.jsp">부서 목록</a>	
			<%	
		}
	%>
</body>
</html>