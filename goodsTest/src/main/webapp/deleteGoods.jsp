<%@page import="java.io.File"%>
<%@page import="com.sist.dao.GoodsDAO"%>
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
	String oldFname = dao.findByNo(no).getFname();
	int re = dao.deleteGoods(no);
	
	if(re>0){
		if(oldFname !=null){
			String path = request.getRealPath("data");
			File file = new File(path+"/"+oldFname);
			file.delete();
		}
		%>
		<script type="text/javascript">
			alert("삭제완료");
			location.href="listGoods.jsp";
		</script>
		<%
		
	}else{
		%>
		<script type="text/javascript">
			alert("삭제실패");
			history.back();
		</script>
		<%
	}

	
%>
</body>
</html>