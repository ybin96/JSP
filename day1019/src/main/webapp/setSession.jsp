<%@page import="com.sist.vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.vo.MemberVO"%>
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
	String name = "ddang";
	int year = 2022;
	boolean isMember = true;
	String []arr = {"사과","포도","수박","딸기"};
	MemberVO m = new MemberVO("tiger","1234","lee");
	ArrayList<DeptVO> list = new ArrayList<DeptVO>();
	list.add(new DeptVO(10,"총무팀","판교"));
	list.add(new DeptVO(20,"총무팀","판교"));
	list.add(new DeptVO(30,"총무팀","판교"));

	session.setAttribute("name", name);
	session.setAttribute("year", year);
	session.setAttribute("arr", arr);
	session.setAttribute("m", m);
	session.setAttribute("list", list);
	session.setAttribute("isMember", isMember);
%>

세션 값을 설정
<a href="getSession.jsp">세션값 확인</a>
</body>
</html>