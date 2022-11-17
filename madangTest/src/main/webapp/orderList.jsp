<%@page import="com.sist.vo.CustomerOrdersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form action="orderList.jsp" method="post">
		고객명 : <input type="search" name="name">
		<input type="submit" value="검색">
	</form>
	
	<%
		request.setCharacterEncoding("utf-8");		
		String method = request.getMethod();
		if(method.equals("POST")){
			String name = request.getParameter("name");
			BookDAO dao = new BookDAO();
			ArrayList<CustomerOrdersVO> list = dao.listOrders(name);
			%>
			<h2><%=name %>님의 주문목록</h2>
			<hr>
			<table border="1" width="60%">
				<tr>
					<th>도서명 </th>
					<th>가격 </th>
					<th>날짜 </th>
				</tr>
				<%
					for(CustomerOrdersVO c:list){
						%>
							<tr>
								<td><%= c.getBookname() %> </td>
								<td><%= c.getPrice() %> </td>
								<td><%= c.getOrderdate() %> </td>
							</tr>
						<%
					}
				%>
			</table>
			
			<%
		}
	%>
</body>
</html>
















