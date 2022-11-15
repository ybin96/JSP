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
	%>
	<jsp:useBean id="c" class="com.sist.vo.CustomerVO"/>
	<jsp:setProperty property="*" name="c"/>
	<jsp:useBean id="dao" class="com.sist.dao.CustomerDAO"/>
	<% 
		int re = dao.updateCustomer(c);
		if(re > 0){
			%>
				<script type="text/javascript">
				alert("회원의 정보를 수정하였습니다.");
				location.href= "listCustomer.jsp";
				</script>
			<%
		}else{
			%>	
				<script type="text/javascript">
				alert("회원정보 수정에 실패하였습니다.");
				location.href= "listCustomer.jsp";
				</script>
			<%
		}
	%>
</body>
</html>