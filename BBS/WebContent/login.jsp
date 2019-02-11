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
				<li class="nav-item active"><a class="nav-link" href="main.jsp">메인<span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item "><a class="nav-link" href="images.jsp">사진첩<span
						class="sr-only">(current)</span>
				</a></li>
				&nbsp;&nbsp;&nbsp;

				<li class="nav-item dropdown"><a
					class="btn btn-secondary dropdown-toggle" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 접속하기 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item disabled" href="login.jsp">로그인</a> <a
							class="dropdown-item" href="join.jsp">회원가입</a>
						<!-- <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a> -->
					</div></li>
				<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li> -->
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" disabled="disabled">
				<button class="btn btn-outline-success my-2 my-sm-0" disabled="disabled">Search</button>
			</form>
		</div>

	</nav>

	<div class="text-center">
		<br> <br> <br>
		<div class="mx-auto" style="width: 400px;">
			<form class="form-signin" action="loginAction.jsp">
				<img class="mb-4" src="images/login.png" alt="" width="72"
					height="72">
				<h1 class="h3 mb-3 font-weight-normal">로그인 화면</h1>
				<br>
				<p>
					<label for="inputSabun" class="sr-only">사번</label> <input
						type="text" id="inputSabun" name="sabun" class="form-control" placeholder="사번"
						required="" autofocus="autofocus">
				</p>
				<p>
					<label for="inputPassword" class="sr-only">비밀번호</label> <input
						type="password" id="inputPassword" name="pwd"class="form-control"
						placeholder="비밀번호" required="">
				</p>
				<!--  <div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>-->

				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
				<p class="mt-5 mb-3 text-muted">© 2018-12</p>
			</form>
		</div>
	</div>
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