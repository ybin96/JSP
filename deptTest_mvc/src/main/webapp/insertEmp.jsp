<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사원등록</h2>
	<hr>
	<form action="insertEmpOK.do" method="post">
	사원번호 : <input type="number" name="eno"><br>
	사원이름 : <input type="text" name="ename"><br>
	부서번호 : <input type="number" name="dno"><br>
	급여 : <input type="number" name="salary"><br>
	수당 : <input type="number" name="comm"><br>
	입사일 : <input type="date" name="hiredate"><br>
	전화번호 : <input type="text" name="phone"><br>
	주소 : <input type="text" name="addr"><br>
	직책 : <input type="text" name="job"><br>
	관리자 번호 : <input type="number" name="mgr"><br>
	주민번호 : <input type="text" name="jumin"><br>
	이메일 : <input type="email" name="email"><br>
	<input type="submit" value="등록">
	<input type="reset" value="취소">
	</form>
</body>
</html>