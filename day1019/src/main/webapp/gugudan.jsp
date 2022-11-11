<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>구구단</h1>
	<%
		for(int dan=2;dan<=9;dan++){
			out.print("<h2>"+dan+"단</h2>");
			for(int i=1;i<=9;i++){
				out.print(dan+"*" +i+"="+(dan*i));
			}
			out.print("<hr>");
		}
	%>
	
</body>
</html>