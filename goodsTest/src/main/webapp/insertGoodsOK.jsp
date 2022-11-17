<%@page import="javax.swing.plaf.multi.MultiMenuItemUI"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.sist.vo.GoodsVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
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
		
		String path = request.getRealPath("data");
		System.out.print(path);
		MultipartRequest multi = new MultipartRequest(request,path,1024*1024*5,"utf-8",new DefaultFileRenamePolicy());
		
		GoodsVO g = new GoodsVO();
		g.setNo( Integer.parseInt(multi.getParameter("no")));
		g.setName(multi.getParameter("name"));
		g.setQty( Integer.parseInt(multi.getParameter("qty")));
		g.setPrice( Integer.parseInt(multi.getParameter("price")));
		
		// 파일 객체 생성
		File uploadFile = multi.getFile("uploadFile");
		String fname = "";
		if(uploadFile != null){
			fname = uploadFile.getName();
		}
		g.setFname(fname);
		
		GoodsDAO dao = new GoodsDAO();
		
		int re = dao.insertGoods(g);
		if(re > 0){
			out.print("<h2>등록성공<h2>");
			response.sendRedirect("listGoods.jsp");
		}else{
			out.print("<h2>등록실패<h2>");
			out.print("<a href='insertGoods.jsp'>상품등록</a>");
		}
	%>
</body>
</html>