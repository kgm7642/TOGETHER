<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.project.app.user.dao.UserDAO"%>
<%@page import="com.project.app.user.dao.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>개인 정보 수정 완료</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
table {
	border-collapse: initial;
	width: 70%;
	text-align: center;
	margin: 0 auto;
}

.align-center, p, th {
	text-align: center;
}
</style>
</head>
<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:if test="${not empty param.login}">
		<script>
			alert("로그인 실패! 다시 시도해 주세요...");
		</script>
	</c:if>

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<a href="${cp}/index/Index.ix" class="logo"><span>together
					${session.userid}</span></a>
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="${cp}/index/Index.ix">HOME</a></li>
				<li><a href="${cp}/moim/CreatePlace.mo">CREATE MOIM</a></li>
				<li><a href="${cp}/moim/SearchMoim.mo">SEARCH MOIM</a></li>
				<li><a href="${cp}/moim/AdMoim.mo">PROMOTION BOARD</a></li>
				<li><a href="${cp}/board/BoardList.bo">BOARD</a></li>
				<li><a href="${cp}/board/NoticeList.bo">NOTICE</a></li>	
			</ul>
			<ul class="actions stacked">
				<c:if test="${session.userid == null}">
					<li><a href="${cp}/user/UserJoin.us"
						class="button primary fit">SIGN UP</a></li>
					<li><a href="${cp}/user/UserLogin.us" class="button fit">LOGIN</a></li>
				</c:if>
				<c:if test="${session.userid != null }">
					<li><a
						href="${pageContext.request.contextPath}/user/UserMypageIndex.us"
						class="button primary fit">MyPage</a></li>
					<li><a href="${cp}/user/UserLogoutOk.us"
						class="button fit">LOGOUT</a></li>
				</c:if>
			</ul>
		</nav>

		<!-- Banner -->
		<section id="banner" data-video="${cp}/images/banner">
			<div class="inner">
				<header>
					<h1>UPDATE MY INFO</h1>
				</header>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="${cp}/images/mainbanner.mp4" muted autoplay loop
				playsinline></video>
		</section>

		<!-- Wrapper -->
		<div id="wrapper">
			<div id="inner" style="margin-left: auto; margin-right: auto; width: 70%;">
				<h1 style="text-align: center;">UPDATE CONFIRM</h1>
				<hr>
				<br>
				<div>
				<table>
					<!-- 아이디 -->
					<tr>
						<th width="45%" style="text-align: center;"><label for="userid">유저아이디</label></th>
						<th style="text-align: center;">${session.userid}</th>
					</tr>
					<!-- 이름 -->
					<tr>
						<th style="text-align: center;"><label for="username">이름</label></th>
						<th style="text-align: center;">${session.username}</th>
					</tr>

					<!-- 비밀번호 -->
					<tr>
						<th style="text-align: center;"><label for="userpw">비밀번호</label></th>
						<th style="text-align: center;">${session.userpw}</th>
					</tr>
					
					<!-- 주소 -->
					<tr>
						<th style="text-align: center;"><label for="userpw">주소</label></th>
						<th style="text-align: center;">${session.useraddr}</th>
					</tr>
					
					<!-- 상세주소 -->
					<tr>
						<th style="text-align: center;"><label for="userpw">상세주소</label></th>
						<th style="text-align: center;">${session.useraddrd}</th>
					</tr>

					<!-- 전화번호 -->
					<tr>
						<th style="text-align: center;"><label for="userphone">전화번호</label></th>
						<th style="text-align: center;">${session.userphone}</th>
					</tr>

					<!-- 이메일 -->
					<tr>
						<th style="text-align: center;"><label for="useremail">이메일</label></th>
						<th style="text-align: center;">${session.useremail}</th>
					</tr>
					<tr></tr>
					<tr>
						<td colspan=2><a class="button primary"
							href="${cp}/index/Index.ix">TOGETHER MAIN</a></td>
					</tr>
				</table>
				</div>
			</div>
			<!-- CTA -->
			<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<ul class="icons">
						<li><a href="https://twitter.com/?lang=ko"
							class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="https://ko-kr.facebook.com/"
							class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="https://www.youtube.com/"
							class="icon brands alt fa-youtube"><span class="label">YouTube</span></a></li>
						<li><a href="https://www.instagram.com/?hl=ko"
							class="icon brands alt fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="https://www.google.com/intl/ko/gmail/about/"
							class="icon solid alt fa-envelope"><span class="label">Email</span></a></li>
					</ul>
				</div>
				<p class="copyright">&copy; Untitled. All rights reserved.</p>
			</footer>
		</div>
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

</html>