<%@page import="com.sist.dao.CustomerDAO"%>
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
		int custid = 0;
		if(request.getParameter("custid")  != null){
			custid = Integer.parseInt(request.getParameter("custid"));
			CustomerDAO dao = new CustomerDAO();
			int re = dao.deleteCustomer(custid);
			if(re > 0){
				%>
				<script type="text/javascript">
					alert("고객의 정보를 삭제하였습니다.");
					location.href = "listCustomer.jsp";
				</script>
				<%
			}else{
				%>
				<script type="text/javascript">
					alert("고객의 정보 삭제에 실패하였습니다.");
					location.href = "listCustomer.jsp";
				</script>
				<%
			}
		}
	%>
</body>
</html>






