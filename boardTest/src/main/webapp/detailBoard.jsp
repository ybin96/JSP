<%@page import="com.sist.util.SistUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.vo.BoardVO"%>
<%@page import="com.sist.dao.BoardDAO"%>
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
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	
	int no =  0;
	if(request.getParameter("no") != null){
		no = Integer.parseInt(request.getParameter("no"));
		dao.updateHit(no);
		BoardVO b = dao.findByNo(no);
		%>
			<h2>게시물 상세</h2>
			<hr>
			글번호 : <%= b.getNo() %><br>
			작성자 : <%= b.getWriter() %><br>
			글제목 : <%= b.getTitle() %><br>
			글내용 :<br>
			<textarea rows="10" cols="60" readonly="readonly"><%=b.getContent() %></textarea>
			<br>
			조회수 : <%= b.getHit() %><br>
			등록일 : <%= b.getRegdate() %><br>
			<%
			
				String fname = b.getFname();
				if( fname != null && !fname.equals("")  ){
					if(SistUtil.isImg(fname)){
						 %>
						 	<img src="data/<%=fname%>" width="100" height="100">
						 <%
					}else{
						%>
							첨부파일 : <a href="data/<%=b.getFname()%>"><%=b.getFname() %></a>
						<%
					}
				}
			%>
			
			<hr>
			<a href="insertBoard.jsp?no=<%=b.getNo()%>">답글달기</a>
			<a href="updateBoard.jsp?no=<%=b.getNo()%>">수정하기</a>
			<a href="deletBoard.jsp?no=<%=b.getNo()%>">삭제하기</a>
		<%
	}
%>


</body>
</html>











