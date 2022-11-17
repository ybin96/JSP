<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 등록</h2>
<hr>
<form action="insertGoodsOK.jsp" method="post" enctype="multipart/form-data">
상품 번호 : <input type="number" name="no"><br>
상품 이름 : <input type="text" name="name"><br>
상품 수량 : <input type="number" name="qty"><br>
상품 가격 : <input type="number" name="price"><br>
상품 사진 : <input type="file" name="uploadFile"><br>
<hr>
<input type="submit" value="등록">
<input type="reset" value="취소">
</form>
</body>
</html>