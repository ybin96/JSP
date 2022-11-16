<%@page import="com.sist.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
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
	<h2>게시물 목록</h2>
	<hr>
	<%

		String searchColumn = "";
		String keyword = "";
		
		if(session.getAttribute("keyword") != null){
			searchColumn = (String)session.getAttribute("searchColumn");
			keyword = (String)session.getAttribute("keyword");
		}
	
		if(request.getParameter("keyword") != null){
			keyword = request.getParameter("keyword");
			searchColumn = request.getParameter("searchColumn");
		}
		
		System.out.println("칼럼이름:"+searchColumn);
		System.out.println("검색어:"+keyword);

	
		int pageNUM=1;
		if(request.getParameter("pageNUM")!= null){
			pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		}
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.findAll(pageNUM,searchColumn,keyword);
		
		// 상태유지하기
		session.setAttribute("searchColumn", searchColumn);
		session.setAttribute("keyword", keyword);
	%>
	<a href="insertBoard.jsp">글 등록</a>
	
	<form action="listBoard.jsp">
	<select name="searchColumn">
		<option value="">선택하세요</option>
		<option value="writer">작성자</option>
		<option value="title">제목</option>
		<option value="content">글내용</option>
	</select>
	<input type="search" name="keyword">
	<input type="submit" value="검색">
	</form>
	
	<table border="1" width="80%">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		
		<%
			for(BoardVO b:list){
				%>
					<tr>
						<td><%=b.getNo() %> </td>
						<td>
							<%
								for(int i=1;i<=b.getB_level();i++){
									out.print("&nbsp;&nbsp");
								}
							%>
							<a href="detailBoard.jsp?no=<%=b.getNo()%>"><%=b.getTitle() %></a> 
						</td>
						<td><%=b.getWriter() %> </td>
					</tr>
				<%
			}
		%>
	</table>
	
	<%
		for(int i=1;i<=dao.totalPage;i++){
			%>
				<a href="listBoard.jsp?pageNUM=<%=i%>"><%=i %>&nbsp;</a>
			<%
		}
	%>
</body>
</html>














