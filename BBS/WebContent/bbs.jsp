<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
<title>JSP 게시판 웹사이트</title>
</head>
<script type="text/javascript">
	var searchRequest = new XMLHttpRequest();
	
	function searchFunction() {
		searchRequest.open("Post",
				"./UserSearchServlet?name="
						+ encodeURIComponent(document
								.getElementById("searchName").value), true);
		searchRequest.onreadystatechange = searchProcess;
		searchRequest.send(null);
	}
	function searchProcess() {
		var table = document.getElementById("ajaxBbs");
		
		table.innerHTML = "";
		if (searchRequest.readyState == 4 && searchRequest.status == 200) {
			var object = eval('(' + searchRequest.responseText + ')');
			var result = object.result;
			for (var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for (var j = 0; j < result[i].length; j++) {
						var cell = row.insertCell(j);
						var v =result[i][j].value;
						if(j==0)
							var no =result[i][j].value;
						if(j==3){
							cell.innerHTML="<a href='view.jsp?no="+no+"'>"+v+"</a>";
						}else{
							cell.innerHTML=v;
						}
						
						
				}
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
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
					placeholder="Search" aria-label="Search" id="searchName"
					onkeyup="searchFunction();">
				<button class="btn btn-outline-success my-2 my-sm-0" type="button"
					onclick="searchFunction();">Search</button>
			</form>
		</div>

	</nav>

	<div class="mx-auto" style="width: 1000px;">
		<br> <br> <br>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">#</th>
					<th scope="col">사번</th>
					<th scope="col">이름</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody id=ajaxBbs>
				<%
					UserDAO userDAO = new UserDAO();
					ArrayList<User> list = userDAO.getList(pageNumber);
					System.out.print(list.size());
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<th scope="row"><%=list.get(i).getNo()%></th>
					<td><%=list.get(i).getSabun()%></td>
					<td><%=list.get(i).getName()%></td>
					<td ><a href="view.jsp?no=<%=list.get(i).getNo()%>"><%=list.get(i).getTitle()%></a></td>
					<td><%=list.get(i).getWdate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<%
			if (pageNumber != 1) {
		%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
			class="btn btn-primary">이전</a>
		<%
			}
			if (userDAO.nextPage(pageNumber + 1)) {
		%>
		<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
			class="btn btn-primary">다음</a>
		<%
			}
		%>

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