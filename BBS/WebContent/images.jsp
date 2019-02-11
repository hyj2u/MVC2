<%@page import="java.net.URLEncoder"%>
<%@page import="file.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="file.FileDAO"%>
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
		int sabun = 0;
		if (session.getAttribute("sabun") != null) {
			sabun = (int) session.getAttribute("sabun");
		}
	%>
	<nav class="navbar navbar-expand-lg navbar navbar-light"
		style="background-color: #e3f2fd;">
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="main.jsp">메인<span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="images.jsp">사진첩<span class="sr-only">(current)</span>
				</a></li> &nbsp;&nbsp;&nbsp;
				<%
					if (sabun == 0) {
				%>
				<li class="nav-item dropdown"><a
					class="btn btn-secondary dropdown-toggle" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 접속하기 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="login.jsp">로그인</a> <a
							class="dropdown-item" href="join.jsp">회원가입</a>
					</div></li>
				<%
					} else {
				%>
				<li class="nav-item dropdown"><a
					class="btn btn-secondary dropdown-toggle" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 회원관리</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
						<!-- <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a> -->
					</div></li>
				<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li> -->
				<%
					}
				%>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" disabled="disabled">
				<button class="btn btn-outline-success my-2 my-sm-0"
					disabled="disabled">Search</button>
			</form>
		</div>

	</nav>


	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
		integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
		crossorigin="anonymous">
	<br>
	<br>
	<br>
	<%
		ArrayList<FileDTO> files = new FileDAO().getList();
	%>
	<div class="container">
		<div class="row">
			<div class="row">
				<%
					for (FileDTO file : files) {
				%>
				<div class="col-lg-3 col-md-4 col-xs-6 thumb">
					<a class="thumbnail"
						href="downloadImage?file=
		<%=URLEncoder.encode(file.getFileRealName(), "UTF-8")%>"
						data-image-id="" data-toggle="modal" data-title=""
						data-image="https://images.pexels.com/photos/853168/pexels-photo-853168.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
						data-target="#image-gallery"> <img class="img-thumbnail"
						src="upload/<%=file.getFileRealName()%>">
					</a>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<br>
	<%
		if (sabun != 0) {
	%>
	<div class="mx-auto" style="width: 600px;">
		<form class="md-form" action="imageUpload.jsp" method="post"
			enctype="multipart/form-data">
			<div class="file-field">
				<div class="file-path-wrapper">
					<input type="file" class="file-path validate" type="text"
						name="file" placeholder="Upload file"> <input
						class="btn btn-primary " type="submit" value="업로드">
				</div>
			</div>
		</form>
	</div>
	<%
		}
	%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>
