<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<h2>${title }</h2>
	<hr>
	<form action="updateBoardOK.do" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="no" value="${b.no }">
		작성자 : ${b.writer }<br>
		글암호 : <input type="password" name="pwd" required="required"><br>
		글제목 : <input type="text" name="title" required="required" value="${b.title }"><br>
		글내용 : 
		<textarea rows="10" cols="60" name="content" required="required">${b.content }</textarea><br>	
		${b.fname}<br>
		<input type="hidden" name="oldFname" value="${b.fname }">
		첨부파일 : <input type="file" name="uploadFile"><br>	
		<input type="submit" value="수정">
		<input type="reset" value="다시입력">
	</form>
</body>
</html>















