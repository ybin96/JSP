<%@page import="com.sist.dao.DeptDAO"%>
<%@page import="com.sist.vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkDelete(dno) {
		var re = confirm("정말로 삭제하시겠어요?");
		if(re == true){
			location.href="deleteDept.jsp?dno="+dno;
		}
	}
</script>
</head>
<body>
<%
	int dno = Integer.parseInt(request.getParameter("dno"));
	DeptDAO dao = new DeptDAO();
	DeptVO d = dao.findByNo(dno);
%>
<h2>부서 상세</h2>
<hr>
부서 번호 : <%= d.getDno() %><br>
부서 이름 : <%= d.getDname() %><br>
부서 위치 : <%= d.getDloc() %><br>
<hr>
<a href="updateDept.jsp?dno=<%=dno%>">수정</a>
<a href="#" onclick="checkDelete(<%=dno%>)">삭제</a>
</body>
</html>