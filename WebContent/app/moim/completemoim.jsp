<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Formula by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>모임 생성_완료</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
	</head>
	<style>
		
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	
		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header">
						<a href="${cp}/index/Index.ix" class="logo"><span>together ${session.userid}</span></a>
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

				<!-- Wrapper -->
					<div id="wrapper">

						<!-- Main -->
							<section id="main" class="main">
								<div class="inner">
									<header class="major">
										<h1>welcome${placenum}</h1>
									</header>
									<div style="text-align:center;">
										<div style="width:100%;display:inline-block;">
											<div style="font-size:50px;float:left;margin-top:20px;">모임 생성</div>
											<div style="font-size:20px;float:right;margin-top:40px;"><span>① 모임 장소 설정 </span> &nbsp;&#187; <span> ② 모임 정보 입력</span> &nbsp;&#187; <span style="font-weight:bold;color:#579AB7"> ③ 모임 생성 완료</span></div>
										</div>
									</div>
									<hr>
									<div style="text-align:center;">
										<div class="textcontainer" style="margin-top:200px;">
											<p class="animate__heartBeat" style="font-size:50px;font-weight:bold;">모임 생성을 완료했습니다!!</p>
										</div>
										<div class="textcontainer" style="margin-top:50px;">
											<p><span id="cntspan"></span><span> 초 후에 홈으로 이동합니다.</span></p>
										</div>
										<div style="text-align:center;">
											<input type="button" id="gohome" class="button primary" value="홈으로" style="font-weight:bold;margin-top:150px;" onclick="location.href='${cp}/index/Index.ix'">
										</div>
									</div>
								</div>
							</section>
					</div>
					<form>
						<input type="hidden" name="cnt" id="cnt" value="">
						<input type="hidden" name="placenum" id="placenum" value="">
					</form>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands alt fa-youtube"><span class="label">YouTube</span></a></li>
								<li><a href="#" class="icon solid alt fa-envelope"><span class="label">Email</span></a></li>
							</ul>
						</div>
						<p class="copyright">&copy; Untitled. All rights reserved.</p>
					</footer>
			</div>

	</body>
	<script>
	
	</script>
	<script>let cp = "${pageContext.request.contextPath}"</script>
	<script>let login_id = "${session.userid}"</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/completemoim.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</html>