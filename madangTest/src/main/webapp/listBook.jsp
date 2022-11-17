<%@page import="com.sist.vo.BookVO"%>
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
<body bgcolor="Khaki">
	<h2>부서목록</h2>
	<table border="1" width="80%">
		<tr>
			<th>도서번호</th>
			<th>도서명</th>
		</tr>
		<%
			BookDAO dao = new BookDAO();
			ArrayList<BookVO> list = dao.findAll();
			for(BookVO b : list){
				%>
				<tr>
					<td><%=b.getBookid() %> </td>
					<td>
						<a href="detailBook.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname() %></a> 
					</td>
				</tr>
				<%
			}			
		%>
	</table>
	<a href="insertBook.jsp">도서 등록</a>
</body>
</html>














