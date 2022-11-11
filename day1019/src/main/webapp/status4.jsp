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
	int a = 0;
	int b = 0;
	
	if(session.getAttribute("a")!=null){
		a = (Integer)session.getAttribute("a");
	}
	if(application.getAttribute("b")!= null){
		b = (Integer)application.getAttribute("b");
	}
	
	a++;
	b++;
	session.setAttribute("a", a);
	application.setAttribute("b", b);	
	%>
	session a:<%=a%><br>
	application b:<%=b%><br>
</body>
</html>