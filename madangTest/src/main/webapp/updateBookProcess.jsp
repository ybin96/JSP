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
	request.setCharacterEncoding("utf-8");	
	%>
	<jsp:useBean id="b" class="com.sist.vo.BookVO"/>
	<jsp:setProperty property="*" name="b"/>
	<jsp:useBean id="dao" class="com.sist.dao.BookDAO"/>
	<%
		int re = dao.updateBook(b);
	if(re == 1){
		out.print("<h2>수정성공이요~~</h2><br>");
		out.print("<a href='listBook.jsp'>도서 목록으로 돌아가기</a>");
	}else{
		out.print("<h2>수정실패요~~</h2><br>");
		out.print("<a href='listBook.jsp'>도서 목록으로 돌아가기</a>");
	}	
	%>
</body>
</html>