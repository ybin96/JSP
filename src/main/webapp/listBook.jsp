<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
	BookDAO dao = new BookDAO();
	ArrayList<BookVO> list = dao.bookAll(); 
%>

<table class="table table-dark">
	<thead>
	<tr>
		<th>도서번호</th>
		<th>도서명</th>
		<th>출판사</th>
		<th>가격</th>
	</tr>
	</thead>
	<tbody>
	<%
		for(BookVO b : list){
			%>
			<tr>
				<td><%= b.getBookid() %></td>
				<td><%= b.getBookname() %></td>
				<td><%= b.getPublisher() %></td>
				<td><%= b.getPrice() %></td>
				
			</tr>
			<%
		}
	%>
</tbody>
</table>
</body>
</html>