<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>도서수정</h2>
	<hr>
	<form action="updateBookOK.do" method="post">
		도서번호 : ${b.bookid }<br> 
		<input type="hidden" name="bookid" value="${b.bookid }">
		도서명 : <input type="text" name="bookname" value="${b.bookname }"><br>
		출판사 : <input type="text" name="publisher" value="${b.publisher }"><br>
		가격 : <input type="number" name="price" value="${b.price }"><br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
</body>
</html>