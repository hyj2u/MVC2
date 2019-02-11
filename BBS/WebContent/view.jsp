<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="reply.ReplyDAO"%>
<%@ page import="reply.Reply"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>JSP 게시판 웹사이트</title>
</head>
<script type="text/javascript">
	var registerRequest = new XMLHttpRequest();
	
	function registerFunction() {
		registerRequest.open("Post",
				"./ReplyRegisterServlet?br_writer="
						+ encodeURIComponent(document
								.getElementById("br_writer").value)+"&br_content="+
								encodeURIComponent(document.getElementById("br_content").value)+
								"&sabun="+encodeURIComponent(document.getElementById("br_sabun").value),
								true);
		registerRequest.onreadystatechange = registerProcess;
		registerRequest.send(null);
	}
	function registerProcess() {
		
		if (registerRequest.readyState == 4 && registerRequest.status == 200) {
			var result =registerRequest.responseText;
			if(result != 1){
				alert('등록에 실패했습니다');
			}else{
				var writer = document.getElementById("br_writer");
				var content = document.getElementById("br_content");
				writer.value="";
				content.value="";
				location.reload();
			}
			
			
		}
	}
</script>
<body>
	<%
		int sabun = 0;
		if (session.getAttribute("sabun") != null) {
			sabun = (int) session.getAttribute("sabun");
		}
		int no = 0;
		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
		}
		if (no == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 게시글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		User user = userDAO.getUser(no);
		int temp = user.getCnt() + 1;
		userDAO.updateCnt(temp, user.getSabun());
		
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
				<li class="nav-item active"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item "><a class="nav-link" href="images.jsp">사진첩<span
						class="sr-only">(current)</span>
				</a></li>&nbsp;&nbsp;&nbsp;
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
						<!-- <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a> -->
					</div></li>
				<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li> -->
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

	<div class="mx-auto" style="width: 1000px;">
		<div
			class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
			<h1 class="display-4">
				사번
				<%=user.getSabun()%>
				/
				<%=user.getName()%>
				님의 세부정보
			</h1>
			<br>
			<h2 class="lead">
				제목:
				<%=user.getTitle()%></h2>
		</div>

		<div class="container">
			<div class="card-deck mb-3 text-center">
				<div class="card mb-4 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">내용</h4>
					</div>
					<div class="card-body">
						<h3 class="card-title pricing-card-title"><%=user.getContent()%>
						</h3>
					</div>
				</div>
				<div class="card mb-4 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">연락처</h4>
					</div>
					<div class="card-body">
						<h3 class="card-title pricing-card-title">Phone</h3>
						<ul class="list-unstyled mt-3 mb-4">
							<li><%=user.getPhone()%></li>
						</ul>
						<h3 class="card-title pricing-card-title">Email</h3>
						<ul class="list-unstyled mt-3 mb-4">
							<li><%=user.getEmail()%></li>
						</ul>
					</div>
				</div>
				<div class="card mb-4 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">주소</h4>
					</div>
					<div class="card-body">
						<ul class="list-unstyled mt-3 mb-4">
							<li><%=user.getJuso1()%></li>
							<br>
							<li><%=user.getJuso2()%></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-6 col-md">
					<h5>
						조회수
						<%=temp%></h5>
				</div>
				<div class="col-6 col-md">
					<h5>
						작성일:&nbsp;<%=user.getWdate()%></h5>
				</div>
			</div>
		</div>

		<hr>
		<br>
		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<h6 class="border-bottom border-gray pb-2 mb-0">댓글</h6>
			<%
				ReplyDAO replyDAO = new ReplyDAO();
				ArrayList<Reply> replyList = replyDAO.getList(user.getSabun());
				for (int i = 0; i < replyList.size(); i++) {
			%>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">@<%=replyList.get(i).getBr_writer()%></strong>
					<%=replyList.get(i).getBr_content()%>
				</p>
			</div>
			<%
				}
			%>
		</div>

		<form class="needs-validation" novalidate="">
			<h4 class="mb-3">댓글 등록</h4>

			<div class="row">
				<div class="col-md-3 mb-3">
					<label for="writer">작성자</label> <input type="text"
						class="form-control" id="br_writer" name="br_writer"
						placeholder="작성자" required="required">
					<div class="invalid-feedback">writer is required</div>
				</div>
				<br>
				<div class="col-md-9 mb-3">
					<label for="content">댓글</label> <input type="text"
						class="form-control" id="br_content" name="br_content"
						placeholder="댓글" required="required">
					<div class="invalid-feedback">content is required</div>
				</div>
				<input type="hidden" name="sabun" id="br_sabun" value=<%=user.getSabun()%> />
			</div>
			<hr class="mb-4">
			<button class="btn btn-primary btn-lg btn-block"
				onclick="registerFunction();" type="button">등록하기</button>
		</form>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('_$tag____________________________________________________$tag_____')
	</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
	<script>
		Holder.addTheme('thumb', {
			bg : '#55595c',
			fg : '#eceeef',
			text : 'Thumbnail'
		});
	</script>


</body>

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