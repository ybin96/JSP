<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkDelete(bookid){
		if(confirm("정말로 삭제?")){
			location.href="deleteBook.do?bookid="+bookid;
		}
	}
</script>
</head>
<body>
	<h2>상세페이지</h2>
	<hr>
	도서번호 : ${b.bookid }<br>
	도서명 : ${b.bookname }<br>
	출판사 : ${b.publisher }<br>
	가격 : ${b.price }<br>
	
	<a href="updateBook.do?bookid=${b.bookid }">수정하기</a>
	<a href="#" onclick="checkDelete(${b.bookid})">삭제하기</a>
</body>
</html>