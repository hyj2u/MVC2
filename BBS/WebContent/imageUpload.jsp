<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="file.FileDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
		<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy());
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");

		if (!(fileName.endsWith(".png")|| fileName.endsWith(".jpg")|| fileName.endsWith(".jpeg"))) {
			File file = new File(directory + fileRealName);
			file.delete();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('업로드 할 수 없는 확장자입니다.')");
			script.println("history.back()");
			script.println("</script>");
			
		} else {
			new FileDAO().upload(fileName, fileRealName);
			response.sendRedirect("images.jsp");
		}
	%>
</body>
</html>