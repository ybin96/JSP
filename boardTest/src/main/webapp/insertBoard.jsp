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
		int no = 0;
		String title="게시물 등록";
		if(request.getParameter("no") != null){
			no = Integer.parseInt(request.getParameter("no"));
			title = "답글달기";
		}
	%>
	
	<h2><%=title %></h2>
	<hr>
	<form action="insertBoardOK.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="no" value="<%=no%>">		
		작성자 : <input type="text" name="writer" required="required"><br>
		글암호 : <input type="password" name="pwd" required="required"><br>
		글제목 : <input type="text" name="title" required="required"><br>
		글내용 : 
		<textarea rows="10" cols="60" name="content" required="required"></textarea><br>	
		첨부파일 : <input type="file" name="uploadFile"><br>	
		<input type="submit" value="등록">
		<input type="reset" value="다시입력">
	</form>
</body>
</html>















