<%@page import="com.sist.vo.CustomerVO"%>
<%@page import="com.sist.dao.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkDelete(custid){
		if(confirm("정말로 삭제하시겠어요?")){
			location.href = "deleteCustomer.jsp?custid="+custid;
		}
	}
</script>
</head>
<body>
	<%
		int custid = 0 ;
		if(request.getParameter("custid")  != null){
			custid = Integer.parseInt( request.getParameter("custid")  );
			CustomerDAO dao = new CustomerDAO();
			CustomerVO c = dao.findBycustId(custid);
			%>
				<h2>고객상세</h2>
				<hr>
				고객번호 : <%= c.getCustid() %><br>
				이름 : <%= c.getName() %><br>
				주소 : <%= c.getAddress() %><br>
				전화 : <%= c.getPhone() %>
				<hr>				
			<%
		}
	%>
	
	<a href="updateCustomer.jsp?custid=<%=custid%>">수정</a>
	<a href="#" onclick="checkDelete(<%=custid%>)">삭제</a>
</body>
</html>
















