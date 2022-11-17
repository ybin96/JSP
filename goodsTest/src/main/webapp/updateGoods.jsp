<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="com.sist.vo.GoodsVO"%>
<%@page import="java.util.ArrayList"%>
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
	int no = Integer.parseInt(request.getParameter("no")); 
	GoodsDAO dao = new GoodsDAO();
	GoodsVO g = dao.findByNo(no);

	
%>
	<form action="updateGoodsOK.jsp" method="post" enctype="multipart/form-data">
	상품번호 : <%=g.getNo() %> <br>
	<input type="hidden" name="no" value="<%=g.getNo()%>">
	상품이름 : <input type="text" name="name" value="<%=g.getName()%>"><br>
	상품수량 : <input type="text" name="qty" value="<%=g.getQty()%>"><br>
	상품가격 : <input type="text" name="price" value="<%=g.getPrice()%>"><br>
	상품사진  <br>
	<img src="data/<%=g.getFname()%>" width="200" height="200"><br>
	사진 수정 : <input type="hidden" name="oldFname" value="<%=g.getFname()%>">
	<input type="file" name="uploadFile"><br>
	<hr>
	<input type="submit" value="수정">
	<input type="reset" value="취소">
	</form>
</body>
</html>