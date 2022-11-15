<%@page import="com.sist.vo.CustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>고객목록</h2>
	<hr>
	<a href="insertCustomer.jsp">고객등록</a><br>
	<jsp:useBean id="dao" class="com.sist.dao.CustomerDAO"/>
	<%
		ArrayList<CustomerVO> list= dao.findAll();
	%>
	<ul>
		<%
			for(CustomerVO c:list){
				%>
					<li>
						<a href="detailCustomer.jsp?custid=<%=c.getCustid()%>"><%= c.getName() %></a>
					</li>
				<%
			}
		%>
	</ul>
</body>
</html>










