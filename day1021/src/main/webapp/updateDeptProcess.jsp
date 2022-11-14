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
<jsp:useBean id="dao" class="com.sist.dao.DeptDAO"/>
<%
	int re = dao.updateDept(d);
	if(re == 1){
		response.sendRedirect("listDept.jsp");
	}else{
		out.print("부서수정에 실패하였습니다.<hr>");
		out.print("<a href='listDept.jsp'>부서목록</a>");
	}
%>
</body>
</html>

















