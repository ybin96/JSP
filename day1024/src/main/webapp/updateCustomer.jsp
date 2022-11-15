<%@page import="com.sist.dao.CustomerDAO"%>
<%@page import="com.sist.vo.CustomerVO"%>
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
			CustomerVO c  = dao.findBycustId(custid);			
			%>
			<h2>고객 수정</h2>
			<hr>
			<form action="updateCustomerOK.jsp" method="post">
				고객번호 : <%= c.getCustid() %><br>
				<input type="hidden" name="custid" value="<%=c.getCustid()%>">
				고객이름 : <input type="text" name="name" value="<%=c.getName()%>"><br>
				고객주소 : <input type="text" name="address" value="<%=c.getAddress()%>"><br>
				고객전화 : <input type="text" name="phone" value="<%=c.getPhone()%>"><br>
				<input type="submit" value="수정">
				<input type="reset" value="다시입력">
			</form>			
			<%
		}
	%>

	
</body>
</html>