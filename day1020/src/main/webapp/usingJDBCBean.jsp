<%@page import="com.sist.vo.RegisterBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#ffffcc">
	<jsp:useBean id="regMgr" class="com.sist.dao.RegisterMgr"/>
	<table bordercolor="#0000ff" border="1">
		<tr>
			<th>ID</th>
			<th>PWD</th>
			<th>NAME</th>
			<th>NUM1</th>
			<th>NUM2</th>
			<th>EMAIL</th>
			<th>PHONE</th>
			<th>ZIPCODE/ADDRESS</th>
			<th>JOB</th>
		</tr>
		<%
			ArrayList<RegisterBean> list= regMgr.getRegisterList();	
			int counter = list.size();
			for(RegisterBean regBean :list){
				%>
					<tr>
						<td><%= regBean.getId() %> </td>
						<td><%= regBean.getPwd() %> </td>
						<td><%= regBean.getName() %> </td>
						<td><%= regBean.getNum1() %> </td>
						<td><%= regBean.getNum2() %> </td>
						<td><%= regBean.getEmail() %> </td>
						<td><%= regBean.getPhone() %> </td>
						<td><%= regBean.getZipcode() %>/ <%= regBean.getAddress() %> </td>
						<td><%= regBean.getJob() %> </td>
					</tr>
				<%
			}
		%>	
	</table>
	<br>
	<br>
	total records : <%= counter %>
</body>
</html>








