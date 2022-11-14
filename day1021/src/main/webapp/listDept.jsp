<%@page import="com.sist.vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
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
	<h2>부서목록</h2>
	<hr>
	<a href="insertDept.jsp">등록</a>
	<br>
	<table border="1" width="80%">
	 	<tr>
	 		<th>부서번호</th>	 		
	 	</tr>
	 	
	 	<jsp:useBean id="dao" class="com.sist.dao.DeptDAO"/>
	 	<%
	 		//DeptDAO dao = new DeptDAO();
	 		ArrayList<DeptVO> list = dao.findAll();
	 		for(DeptVO d:list){
	 			%>
	 				<tr>
	 					<td> <a href="detailDept.jsp?dno=<%=d.getDno()%>"><%=d.getDno() %></a> </td>	 					
	 				</tr>
	 			<%	 
	 		}	 		
	 	%>
	 	
	</table>
</body>
</html>

















