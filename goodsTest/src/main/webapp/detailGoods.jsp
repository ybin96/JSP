<%@page import="com.sist.vo.GoodsVO"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkDelete(no){
		var re = confirm("정말 삭제??");
		if( re == true){
			location.href="deleteGoods.jsp?no="+no;
		}
	}
</script>
</head>
<body>
	<%
		GoodsVO g = new GoodsVO();
		GoodsDAO dao = new GoodsDAO();
		int no = 0;
		if(request.getParameter("no") != null){
			no = Integer.parseInt(request.getParameter("no"));
			g = dao.findByNo(no);
		}	
		
	%>
	<h2>상품 상세보기</h2>
	<hr>
	상품번호 : <%=g.getNo()%><br>
	상품이름 : <%=g.getName()%><br>
	상품수량 : <%=g.getQty()%><br>
	상품가격 : <%=g.getPrice()%><br>
	상품 사진  <br>
	<%
		String fname = g.getFname();
		if(fname != null){
			%>
				<img src="data/<%=g.getFname()%>" width="200" height="200"><br>
			<%
		}
	%>
	
	<a href="updateGoods.jsp?no=<%=g.getNo()%>">수정</a>
	<a href="#" onclick="checkDelete(<%=no%>)" >삭제</a>
	
	
</body>
</html>