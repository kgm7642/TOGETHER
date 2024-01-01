<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>공지사항 작성 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location
					.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:set var="cp" value="${pageContext.request.contextPath}" />

	<!-- Page Wrapper -->

	<div id="page-wrapper">

		<!-- Header -->

		<header id="header">
			<a href="${cp}/index/Index.ix" class="logo"><span>admin(관리자)</span></a>
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->

		<nav id="menu">
			<ul class="links">
				<li><a href="${cp}/index/Index.ix">Home</a></li>
				<li><a href="${cp}/admin/MoimList.ad">모임 관리</a></li>
				<li><a href="${cp}/admin/AdminMoimBoard.ad">홍보 게시판 관리</a></li>
				<li><a href="${cp}/admin/AdminBoardList.ad">게시판 관리</a></li>
				<li><a href="${cp}/admin/AdminNoticeList.ad">공지사항 관리</a></li>
			</ul>
			<ul class="actions stacked">
				<c:if test="${session.userid == null}">
					<li><a href="${cp}/user/UserJoin.us"
						class="button primary fit">SIGN UP</a></li>
					<li><a href="${cp}/user/UserLogin.us" class="button fit">LOGIN</a></li>
				</c:if>
				<c:if test="${session.userid != null }">
					<li><a href="${cp}/user/UserLogoutOk.us"
						class="button primary fit">LOGOUT</a></li>
				</c:if>
			</ul>
		</nav>

		<!-- Banner -->

		<!-- Wrapper -->

		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<header class="major">
						<h1>공지사항 작성</h1>
						<hr>
					</header>
					<form method="post" name="boardForm"
						action="${cp}/admin/AdminNoticeWriteOk.ad">
						<input type="hidden" name="userid" value="${session.userid}">
						<!-- 게시글 작성하는 인풋들 배치 테이블 -->
						<table border="1" style="border-collapse: collapse;">
							<tr height="30px">
								<th width="150px"><strong>제 목</strong></th>
								<td><input type="text" name="boardtitle" size=100
									maxlength="100" placeholder="제목을 입력하세요"></td>
							</tr>
							<tr height="30px">
								<th width="150px"><strong>작성자</strong></th>
								<td><strong>${session.userid}</strong></td>
							</tr>
							<tr height="300px">
								<th width="150px"><strong>내 용</strong></th>
								<td><textarea name="contents"
										style="height: 250px; resize: none;"></textarea></td>
							</tr>
						</table>
						<br>
						<table class="btn_area">
							<tr align="right" valign="middle">
								<td><a class="button primary" href="javascript:sendit()">등록</a>&nbsp;&nbsp;
									<a class="button primary" href="${cp}/admin/AdminNoticeList.ad?page=${param.page == null?1:param.page}">목록</a>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
		</div>

		<!-- Footer -->

		<footer id="footer">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon brands alt fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands alt fa-facebook-f"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands alt fa-youtube"><span
							class="label">YouTube</span></a></li>
					<li><a href="#" class="icon brands alt fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon solid alt fa-envelope"><span
							class="label">Email</span></a></li>
				</ul>
			</div>
			<p class="copyright">&copy; Untitled. All rights reserved.</p>
		</footer>
	</div>
</body>

<!-- Scripts -->

<script src="${cp}/assets/js/jquery.min.js"></script>
<script src="${cp}/assets/js/jquery.scrolly.min.js"></script>
<script src="${cp}/assets/js/jquery.scrollex.min.js"></script>
<script src="${cp}/assets/js/browser.min.js"></script>
<script src="${cp}/assets/js/breakpoints.min.js"></script>
<script src="${cp}/assets/js/util.js"></script>
<script src="${cp}/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
	const sendit = function() {
		let boardForm = document.boardForm;
		let boardtitle = boardForm.boardtitle;
		if (boardtitle.value == "") {
			alert("게시글 제목을 작성하세요!")
			boardtitle.focus();
			return false;
		}
		let contents = boardForm.contents;
		if (contents.value == "") {
			alert("게시글 내용을 작성하세요!");
			contents.focus();
			return false;
		}
		boardForm.submit();
	}
</script>
</html>