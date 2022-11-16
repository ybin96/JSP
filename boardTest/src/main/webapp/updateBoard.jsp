<%@page import="com.sist.util.SistUtil"%>
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
	<h2>게시물 수정</h2>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDAO dao = new BoardDAO();
		BoardVO b = dao.findByNo(no);
		String oldFname = b.getFname();
	%>
	<hr>
	<form action="updateBoardOK.jsp" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="no" value="<%=b.getNo()%>">	
		<input type="hidden" name="oldFname" value="<%=oldFname%>">
		작성자 : <%= b.getWriter() %><br>
		글암호 : <input type="password" name="pwd"><br>
		글제목 : <input type="text" name="title" value="<%=b.getTitle()%>"><br>
		글내용 : 
		<textarea rows="10" cols="60" name="content"><%=b.getContent() %></textarea><br>
		<%
			if(oldFname != null && !oldFname.equals("")){
				if(SistUtil.isImg(oldFname)){
					%>
						<img src="data/<%=oldFname %>" width="50" height="50">
					<%
				}else{
					out.print("첨부파일명:"+oldFname+"<br>");
				}
			}
		%>
				
		<input type="file" name="uploadFile"><br>
		<input type="submit" value="수정">
		<input type="reset" value="다시입력">
	</form>
</body>
</html>















