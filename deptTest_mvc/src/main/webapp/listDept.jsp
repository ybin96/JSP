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
	<h2>부서목록</h2>
	<a href="insertDept.do">부서등록</a>
	<hr>
	<ul>
		<c:forEach var="d" items="${list }">
			<li><a href="detailDept.do?dno=${d.dno }">${d.dname }</a></li>
		</c:forEach>
	</ul>
</body>
</html>