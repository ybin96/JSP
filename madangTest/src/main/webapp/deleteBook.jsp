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
	int bookid =Integer.parseInt(request.getParameter("bookid"));

%>

	<jsp:useBean id="dao" class="com.sist.dao.BookDAO"/>
	<%
		int re = dao.deleteBook(bookid);
	 if(re==1){
		 response.sendRedirect("listBook.jsp");
	 }else{
		 response.sendRedirect("listBook.jsp");
	 }
	%>
	
</body>
</html>