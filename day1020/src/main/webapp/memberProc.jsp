<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#996600">
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="regBean" class="com.sist.vo.MemberBean"/>
<jsp:setProperty property="*" name="regBean"/>
	<table width="80%" align="center" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center" valign="middle" bgcolor="#ffffcc">
				<table width="90%" border="1" cellspacing="0" cellpadding="2" align="center">
					<tr align="center" bgcolor="#996600">
						<td colspan="3">
							<jsp:getProperty property="name" name="regBean"/>
							회원님이 작성하신 내용입니다. 확인해 주세요
						</td>						
					</tr>
					<tr>
						<td width="24%">아이디</td>
						<td width="41%">
							<jsp:getProperty property="id" name="regBean"/>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><jsp:getProperty property="name" name="regBean"/></td>
					</tr>
					<tr>
						<td>패스워드</td>
						<td><jsp:getProperty property="pwd" name="regBean"/></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><jsp:getProperty property="birthday" name="regBean"/></td>
					</tr>
			<jsp:getProperty property="id" name="regBean"/>		<tr>
						<td>이메일</td>
						<td><jsp:getProperty property="email" name="regBean"/></td>
					</tr>
					
					<tr>
						<td colspan="2">
							 <input type="button" value="확인완료">
							 <input type="button" value="다시쓰기" onclick="history.back()">
						</td>
					</tr>
					
				</table>
			</td>
		</tr>	
	</table>
</body>
</html>



















