
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
		String method = request.getMethod();
		if(method.equals("GET")){
			%>
			<h2>계산기</h2>
			<hr>
			<form action="calculator.jsp" method="post">
				<input type="number" name="first">
				<select name="op">
					<option value="+">+</option>		
					<option value="-">-</option>		
					<option value="*">*</option>		
					<option value="/">/</option>		
				</select>
				<input type="number" name="second">
				<input type="submit" value="실행">
			</form>
			<%
		}else{
			request.setCharacterEncoding("utf-8");
			int first =Integer.parseInt(request.getParameter("first")); 
			int second =Integer.parseInt(request.getParameter("second"));
			String op =request.getParameter("op");
			int re = 0;
			switch(op){
			case "+":re=first+second;break;
			case "-":re=first-second;break;
			case "*":re=first*second;break;
			case "/":re=first/second;break;
			}
			%>
				계산결과 : <%= re %>
			<%
		}	
	%>
</body>
</html>