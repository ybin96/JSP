<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@page import="com.sist.vo.GoodsVO"%>
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
	GoodsVO g = new GoodsVO();
	GoodsDAO dao = new GoodsDAO();
	
	String path = request.getRealPath("data");
	System.out.print(path);
	MultipartRequest multi = 
			new MultipartRequest(
						request, 
						path, 
						1024*1024*5,
						"utf-8",
						new DefaultFileRenamePolicy()
					);
	
	g.setNo(Integer.parseInt(multi.getParameter("no")));
	g.setName(multi.getParameter("name"));
	g.setQty(Integer.parseInt(multi.getParameter("qty")));
	g.setPrice(Integer.parseInt(multi.getParameter("price")));
	String oldFname = multi.getParameter("oldFname");
	
	File file = multi.getFile("uploadFile");

	if(file != null){
		g.setFname(file.getName());
	}else{
		g.setFname(oldFname);
	}
	
	
	int re = dao.updateGoods(g);
	if(re > 0){
		if( file != null  ){ 
			File file2 = new File(path + "/" + oldFname);
			file2.delete();			
		}
		response.sendRedirect("listGoods.jsp");
	}else{
		if(file != null){
			file.delete();
			
		}
		out.print("실패");
	}

	%>
</body>
</html>