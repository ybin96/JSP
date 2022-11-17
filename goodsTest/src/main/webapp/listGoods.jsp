<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="com.sist.vo.GoodsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#op{
		display: none;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#searchColumn").change(function(){
			var col = $(this).val();
			if(col =="price" || col =="qty"){
				$("#op").css("display","inline");
			}else{
				$("#op").css("display","none");
			}
		})
	})

</script>
	
</head> 	
<body>
	<h2>상품목록</h2>

	<form action="listGoods.jsp">
		<select name="searchColumn" id="searchColumn">
			<option value="">선택하세요</option>
			<option value="no">상품번호</option>
			<option value="name">상품이름</option>
			<option value="price">상품가격</option>
			<option value="qty">상품수량</option>
		</select> :
		
	<select name="op" id="op">
		<option value=">=">>=</option>
		<option value="<="><=</option>
		<option value="=">=</option>
		<option value=">">></option>
		<option value="<"><</option>
	</select>	
		
		 <input type="search" name="keyword">
		<input type="submit" value="검색">		
	</form>
	
	<br>
	<table border="1" width="60%">
		<tr>
			<td><a href="listGoods.jsp?sortColumn=no">상품번호</a> </td>
			<td><a href="listGoods.jsp?sortColumn=name"> 상품이름</a> </td>
			<td><a href="listGoods.jsp?sortColumn=price"> 상품가격</a> </td>
			<td><a href="listGoods.jsp?sortColumn=qty"> 상품수량</a> </td>
		</tr>
		
		<%
			String sortColumn = "";
			String keyword = "";
			String searchColumn = "";
			String op = "";
			
			HashMap<String,String> map = new HashMap<String,String>();
			if(session.getAttribute("map") != null){
				map = (HashMap<String,String>)session.getAttribute("map");			
				sortColumn = map.get("op");
				keyword = map.get("keyword");
				searchColumn = map.get("searchColumn");
			}
			
			if(request.getParameter("keyword") != null){
				keyword = request.getParameter("keyword");
				searchColumn = request.getParameter("searchColumn");
				op = request.getParameter("op");
			}
			
			sortColumn = request.getParameter("sortColumn");
			
			System.out.println("정렬칼럼:"+sortColumn);
			System.out.println("검색어:"+keyword);
			System.out.println("검색칼럼:"+searchColumn);
			System.out.println("연산자:"+op);
					
			GoodsDAO dao = new GoodsDAO();
			
			map.put("sortColumn",sortColumn);
			map.put("keyword",keyword);
			map.put("searchColumn",searchColumn);
			map.put("op",op);
			
			ArrayList<GoodsVO> list = dao.findAll(map);
			session.setAttribute("map", map);
			for(GoodsVO g:list){
				%>
				<tr>
					<td><%=g.getNo() %></td>
					<td>
						<a href="detailGoods.jsp?no=<%=g.getNo()%>"><%=g.getName() %></a>
					</td>
					<td><%=g.getPrice() %></td>
					<td><%=g.getQty() %></td>
				</tr>
				<%
			}
		%>
	</table>
	<hr>
	<a href="insertGoods.jsp">상품등록</a><br>
</body>
</html>






