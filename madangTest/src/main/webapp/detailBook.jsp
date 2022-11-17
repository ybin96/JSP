<%@page import="com.sist.vo.BookVO"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkDelete(bookid){
		var re = confirm("정말로 삭제하시겠습니까?");
		if(re == true){
			location.href="deleteBook.jsp?bookid="+bookid;
		}
	}
</script>
</head>
<body>
<%
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	BookDAO dao = new BookDAO();
	BookVO b = dao.findById(bookid);
%>
<h2>도서상세</h2>
<hr>
도서번호 : <%= b.getBookid() %><br>
도서이름 : <%= b.getBookname() %><br>
출판사명 : <%= b.getPublisher() %><br>
도서가격 : <%= b.getPrice() %><br>

<a href="listBook.jsp">목록</a>
&nbsp;&nbsp;&nbsp;
<a href="updateBook.jsp?bookid=<%=b.getBookid()%>">수정</a>
&nbsp;&nbsp;&nbsp;
<a href="#" onclick="checkDelete(<%=bookid%>)">삭제</a>
</body>
</html>










