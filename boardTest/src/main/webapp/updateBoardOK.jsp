<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.sist.dao.BoardDAO"%>
<%@page import="com.sist.vo.BoardVO"%>
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
		BoardVO b = new BoardVO();
		BoardDAO dao = new BoardDAO();
		
		String path = request.getRealPath("data");
		MultipartRequest multi = new MultipartRequest(
										request, 
										path, 
										1024*1024*5,
										"utf-8", 
										new DefaultFileRenamePolicy()
									);
		
		b.setNo(Integer.parseInt(multi.getParameter("no")));
		b.setTitle(multi.getParameter("title"));
		b.setPwd(multi.getParameter("pwd"));
		b.setContent(multi.getParameter("content"));
		String oldFname = multi.getParameter("oldFname");
		if(oldFname != null &&  oldFname.equals("null")){
			oldFname = "";
		}
		
		String fname = "";
		File file = multi.getFile("uploadFile");
		if(file != null){
			fname = file.getName();
			b.setFname(fname);
		}else{
			b.setFname(oldFname);
		}
				
		int re = dao.updateBoard(b);
		if(re > 0){
			if( !fname.equals("")  && oldFname != null && !oldFname.equals("") ){
				File file2 = new File(path + "/" + oldFname);
				file2.delete();			
			}
			response.sendRedirect("listBoard.jsp");
		}else{
			if(!fname.equals("")){
				File file3  = new File(path + "/"+ fname);
				file3.delete();
				out.println("수정 실패");
			}
		}
	%>
</body>
</html>






