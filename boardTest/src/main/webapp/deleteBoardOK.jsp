<%@page import="java.io.File"%>
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
		request.setCharacterEncoding("utf-8");
		int no = Integer.parseInt(request.getParameter("no"));
		String pwd = request.getParameter("pwd");
		BoardDAO dao = new BoardDAO();
		String oldFname = dao.findByNo(no).getFname();
		int re = dao.deleteBoard(no, pwd);
		if(re > 0){
				if(oldFname != null && !oldFname.equals("") && !oldFname.equals("null")){
					String path = request.getRealPath("data");
					File file = new File(path + "/" + oldFname);
					file.delete();
				}
						
			%>
				<script type="text/javascript">
					alert("게시물을 삭제하였습니다.");
					location.href = "listBoard.jsp";
				</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("게시물을 삭제에 실패하였습니다.");
				history.back();
			</script>
		<%
		}
	%>
</body>
</html>









