<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>For Example</h1>
	1~10 합<br>
	<%
		int n = 10;
		int sum = 0;
		for(int i=1;i<=n;i++){
			sum += i;
			out.print(i);
			if( i != n){
				out.print("+");
			}
		}
		out.print("="+sum);
	%>
</body>
</html>