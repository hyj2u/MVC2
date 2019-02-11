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
		int sabun=0;
		if((session.getAttribute("sabun"))!=null){
			sabun = (int)session.getAttribute("sabun");
		}
		if(sabun!=0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getSabun(),user.getPwd());
		if(result==1){
			session.setAttribute("sabun", user.getSabun());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 사번입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result==-2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>