<%@page import="com.sist.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="searchMember.jsp" method="post">
		아이디 : <input type="search" name="id">
		<input type="submit" value="search">
	</form>
	
	<%
		MemberDAO dao = new MemberDAO();
	
		String method = request.getMethod();
		if(method.equals("POST")){
			String id = request.getParameter("id");
			MemberVO mb = dao.findById(id);
			%>
			<h2><%= id %></h2>
			<hr>
			<%= mb.getPwd() %><br>
			<%= mb.getName() %>
			<%
		}
	%>
	
	<h2>모든 고객 목록</h2>
	<hr>
	<table border="1">
	<%
		ArrayList<MemberVO> list = dao.findAll();
		for(MemberVO m : list){
			%>
			<tr>
				<td><%= m.getId()%></td>
				<td><%= m.getPwd()%></td>
				<td><%= m.getName()%></td>
			</tr>
			<%
		}
	%>
	</table>
</body>
</html>