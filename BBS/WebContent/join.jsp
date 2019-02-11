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
<link href="form-validation.css" rel="stylesheet">
<title>JSP 게시판 웹사이트</title>
</head>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict';

		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');

			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>

<script type="text/javascript">
	function move() {
		document.myform.submit();
	}//move end

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

	}
	function jusoCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.joinForm.juso1.value = roadFullAddr;
	}
	
</script>
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
				</a></li>&nbsp;&nbsp;&nbsp;

				<li class="nav-item dropdown"><a
					class="btn btn-secondary dropdown-toggle" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 접속하기 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item " href="login.jsp">로그인</a> <a
							class="dropdown-item disabled" href="join.jsp">회원가입</a>
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
	<div class="mx-auto" style="width: 1400px; padding-left: 300px;">
		<div class="col-md-8 order-md-1">
			<br>
			<h4 class="mb-3" style="text-align: center;">회원가입 화면</h4>
			<form class="needs-validation" novalidate="" name="joinForm"
				action="joinAction.jsp">
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="sabun">사번</label> <input type="text"
							class="form-control" id="sabun" name="sabun" placeholder=""
							value="" required="required">
						<div class="invalid-feedback">Your sabun is required.</div>
					</div>
					<div class="col-md-6 mb-3">
						<label for="pwd">비밀번호</label> <input type="password"
							class="form-control" id="pwd" name="pwd" placeholder="" value=""
							required="required">
						<div class="invalid-feedback">Your password is required.</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="name">이름</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">@</span>
						</div>
						<input type="text" class="form-control" id="name" name="name"
							placeholder="name" required="required">
						<div class="invalid-feedback" style="width: 100%;">Your name
							is required.</div>
					</div>
				</div>
				<div class="mb-3">
					<label for="address">제목</label> <input type="text" name="title"
						class="form-control" id="title" required="required">
					<div class="invalid-feedback">Please enter your title.</div>
				</div>

				<div class="mb-3">
					<label for="content">내용 <span class="text-muted"></span></label> <input
						type="text" class="form-control" id="content" name="content"
						required="required">
						<div class="invalid-feedback">Please enter your content.</div>
				</div>
				<div class="mb-3">
					<label for="phone">전화번호</label> <input type="text"
						class="form-control" id="phone" name="phone"
						placeholder="010-xxxx-xxxx" required="required">
					<div class="invalid-feedback">Please enter your phone number.</div>
				</div>
				<div class="mb-3">
					<p>
						<label for="juso1">주소</label>&nbsp;
						<button type="button" class="btn btn-primary" onclick="goPopup()">검색</button>
					</p>
					<input type="text" class="form-control" id="juso1" name="juso1"
						required="required" readonly="readonly">

					<div class="invalid-feedback">Please enter your address.</div>
				</div>

				<div class="mb-3">
					<label for="juso2">상세주소<span class="text-muted"></span></label> <input
						type="text" class="form-control" id="juso2" name="juso2" required="required">
						<div class="invalid-feedback">Please enter your detail address.</div>
				</div>
				<div class="mb-3">
					<label for="email">Email <span class="text-muted"></span></label> <input
						type="email" class="form-control" id="email" name="email" required="required"
						placeholder="you@example.com" >
					<div class="invalid-feedback">Please enter a valid email
						address</div>
				</div>
				<hr class="mb-4">
				<button class="btn btn-primary btn-lg btn-block"
					type="submit">회원가입</button>
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