<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>구구단</h2>
	<form action="practice2.jsp" method="post">
	몇단 ? <input type="number" name="dan">
	<input type="submit" value="click">
	</form>
	
	<%
		String method = request.getMethod();
		if(method.equals("POST")){
			int n = Integer.parseInt(request.getParameter("dan"));
			for(int i=1;i<=9;i++){
				out.print("<h3>"+n+"x"+i+"="+(n*i)+"</h3>" );
			}
		}
	%>
</body>
</html>