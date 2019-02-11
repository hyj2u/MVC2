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
<jsp:setProperty property="name" name="user" />
<jsp:setProperty property="title" name="user" />
<jsp:setProperty property="content" name="user" />
<jsp:setProperty property="phone" name="user" />
<jsp:setProperty property="juso1" name="user" />
<jsp:setProperty property="juso2" name="user" />
<jsp:setProperty property="email" name="user" />
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%
		int sabun = 0;
		if (session.getAttribute("sabun") != null) {
			sabun = (int) session.getAttribute("sabun");
		}
		if (sabun != 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}

		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 사번입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			session.setAttribute("sabun", user.getSabun());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	%>

</body>
</html>