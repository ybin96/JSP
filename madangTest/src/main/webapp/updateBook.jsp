<%@page import="com.sist.dao.BookDAO"%>
<%@page import="com.sist.vo.BookVO"%>
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
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookDAO dao = new BookDAO();
		BookVO b = dao.findById(bookid);
	%>
	<h2>도서 수정</h2>
	<form action="updateBookProcess.jsp" method="post">
		도서번호 : <%=b.getBookid() %>
		<input type="hidden" name="bookid" value="<%=b.getBookid() %>"><br>
		도서명 : <input type="text" name="bookname" value="<%=b.getBookname()%>"><br>
		출판사 : <input type="text" name="publisher" value="<%=b.getPublisher()%>"><br>
		가격 : <input type="text" name="price" value="<%=b.getPrice()%>"><br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
</body>
</html>