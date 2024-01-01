<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<c:if test="${not empty param.flag}">
		<script>
			alert("아이디와 비밀번호를 다시 확인해주세요.");
		</script>
	</c:if>

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<a href="${cp}/index.jsp" class="logo"><span>together
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
					<h1>LOGIN TOGETHER</h1>
				</header>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="${cp}/images/banner.mp4" muted autoplay loop playsinline></video>
		</section>
		<!-- Wrapper -->
		<div id="wrapper">
		<section id="main" class="main">
				<div class="inner">
			<form name="loginForm"
				action="${pageContext.request.contextPath}/user/UserLoginOk.us"
				method="post" onsubmit="return sendit();">
				<table>
					<tr>
						<th width="15%">
							<strong>아이디</strong>
						</th>
						<td width="50%">
							<input type="text" name="userid" placeholder="아이디를 입력하세요" value="${param.userid!=null?param.userid:''}" tabindex="1">
						</td>
						<td width="35%" rowspan="2" style="vertical-align: bottom;">
							<div>
								<input type="submit" class="button primary large" value="LOGIN" style="height:140px;padding:0px;" tabindex="3">
							</div>
						</td>
					</tr>
					<tr>
						<th width="15%">
							<strong>비밀번호</strong>
						</th>
						<td width="50%">
							<input type="password" name="userpw" placeholder="비밀번호를 입력하세요" tabindex="2">
						</td>
						<td width="35%">
							
						</td>
					</tr>
					<tr>
						<td colspan = "3" style="text-align: center;">
							<a href="${pageContext.request.contextPath}/user/UserFindId.us"	class="button large" tabindex="4">아이디 찾기</a>
							<a href="${pageContext.request.contextPath}/user/UserFindpw.us"	class="button large" tabindex="5">비밀번호 찾기</a>
							<a href="${pageContext.request.contextPath}/user/UserJoin.us" class="button large" tabindex="6">회원 가입</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		</section>

		<!-- CTA -->

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
	</div>
	<!-- Scripts -->
	<script src="${cp}/assets/js/jquery.min.js"></script>
	<script src="${cp}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${cp}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${cp}/assets/js/browser.min.js"></script>
	<script src="${cp}/assets/js/breakpoints.min.js"></script>
	<script src="${cp}/assets/js/util.js"></script>
	<script src="${cp}/assets/js/main.js"></script>
	<script>
		let cp = "${pageContext.request.contextPath}"
		let idTag = document.loginForm.userid;
		let pwTag = document.loginForm.userpw;
		function sendit() {
			if (idTag.value != null) {
				if (idTag.value == "") {
					alert("아이디를 입력하세요!");
					idTag.focus();
					return false;
				}
				if (pwTag.value == "") {
					alert("비밀번호를 입력하세요!");
					pwTag.focus();
					return false;
				}
			}
			return true;
		}
	</script>
</html>