<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty property="sabun" name="user" />
<jsp:setProperty property="pwd" name="user" />
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>