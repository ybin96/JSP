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
	<h2>사원목록</h2>
	<hr>
	<a href="insertEmp.do">사원등록</a>
	<table border="1" width="50%">
	 <tr>
	 	<th>사원번호</th>
	 	<th>사원이름</th>
	 	<th>부서번호</th>
	 	<th>급여</th>
	 </tr>
	 <c:forEach var="e" items="${list }">
	 	<tr>
	 		<td>${e.eno }</td>
	 		<td>
	 			<a href="detailEmp.do?eno=${e.eno }">${e.ename }</a>
	 		</td>
	 		<td>${e.dno }</td>
	 		<td>${e.salary }</td>
	 	</tr>
	 </c:forEach>
	</table>
</body>
</html>