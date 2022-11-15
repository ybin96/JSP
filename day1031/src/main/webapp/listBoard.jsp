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
	<h2>게시물 목록</h2>
	
	<form action="listBoard.do">
		<select name="searchColumn">
			<option value="writer">작성자</option>
			<option value="title">글제목</option>
			<option value="content">글내용</option>
		</select>
		<input type="search" name="keyword">
		<input type="submit" value="검색">
	</form>
	<br>
	<table border="1" width="80%">
		<tr>
			<td>글번호</td>
			<td width="40%">글제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>등록일</td>
		</tr>
		
		<c:forEach var="b" items="${list }">
			<tr>
				<td>${b.no }</td>
				<td>
					<c:if test="${b.b_level > 0 }">
						<c:forEach begin="1" end="${b.b_level }">
							&nbsp;&nbsp;
						</c:forEach>
					</c:if>
					
					<a href="detailBoard.do?no=${b.no }">${b.title }</a>
				</td>
				<td>${b.writer }</td>
				<td>${b.hit }</td>
				<td>${b.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	<c:forEach var="i" begin="1" end="${totalPage }">
		<a href="listBoard.do?pageNUM=${i }">${i }</a>&nbsp;
	</c:forEach>
</body>
</html>



















