<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${re==1 }">
		삭제성공
	</c:if>
	<c:if test="${re!=1 }">
		삭제실패
	</c:if>
	<a href="listBook.do">도서목록</a>
</body>
</html>