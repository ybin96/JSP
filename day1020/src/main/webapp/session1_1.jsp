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
	request.setCharacterEncoding("utf-8");
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	String id = (String)session.getAttribute("idKey");
	String sessionId = session.getId();
	int intervalTime = session.getMaxInactiveInterval();	
	if(id != null){
		%>
			<h1>Session Example1</h1>
			<b><%=id %></b>님이 좋아하는 계절과 과일은 <br>
			<b><%=season %></b>과 <b><%=fruit %></b>입니다.<br>
			세션아이디 : <%= sessionId %><br>
			세션 유지 시간 : <%= intervalTime %>초
		<%
	}else{
		out.print("세션의 시간이 경과되었거나 다른 이유로 연결 할 수 없습니다.");
	}
%>

</body>
</html>