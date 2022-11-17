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
	<h2>사원 상세페이지</h2>
	<hr>
	사원번호 : ${e.eno }<br>
	사원이름 : ${e.ename }<br>
	부서번호 : ${e.dno }<br>
	연봉 : ${e.salary }<br>
	수당 : ${e.comm }<br>
	입사일 : ${e.hiredate }<br>
	전화번호 : ${e.phone }<br>
	주소 : ${e.addr }<br>
	직책 : ${e.job }<br>
	관리자 번호 : ${e.mgr }<br>
	주민번호 : ${e.jumin }<br>
	이메일 : ${e.email }<br>
	<hr>
	<a href="updateEmp.do?eno=${e.eno }">수정하기</a>
	<a href="deleteEmp.do?eno=${e.eno }">삭제하기</a>
</body>
</html>