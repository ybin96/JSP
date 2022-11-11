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
		String protocol = request.getProtocol();
		String serverName = request.getServerName();
		int port = request.getServerPort();
		String remoteAddr = request.getRemoteAddr();
		String remoteHost = request.getRemoteHost();
		String method = request.getMethod();
		String requestURL = request.getRequestURL().toString();
		String requestURI = request.getRequestURI();
		String userBrowser = request.getHeader("User-Agent");
		String fileType = request.getHeader("Accept");
	%>
	<h2>request Example2</h2>
	프로토콜 : <%=protocol %><br>
	서버 이름 : <%=serverName %><br>
	서버 포트번호 : <%=port %><br>
	사용자 컴퓨터 주소 : <%=remoteAddr %><br>
	사용자 컴퓨터 이름 : <%=remoteHost %><br>
	사용 method : <%=method %><br>
	URL : <%=requestURL %><br>
	URI : <%=requestURI %><br>
	현재 사용 브라우저 : <%=userBrowser %><br>
	브라우저가 지원하는 file의 type : <%=fileType %>
</body>
</html>