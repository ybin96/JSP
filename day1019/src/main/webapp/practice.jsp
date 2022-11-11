<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>입력한 숫자만큼 더하기</h1>
	<form action="practice.jsp" method="post">
		<input type="number" name="num">
		<input type="submit" value="sum">
	</form>
	
<%
	String method = request.getMethod();
	if(method.equals("POST")){
		int num = Integer.parseInt(request.getParameter("num"));
		int sum = 0;
		for(int i=1;i<=num;i++){
			out.print(i);
			sum += i;
			if(i != num){
				out.print("+");
			}
		}
		out.print("="+sum);
	}
%>

</body>
</html>