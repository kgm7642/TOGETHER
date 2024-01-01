<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>친구 삭제</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
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

		<!-- Banner -->
		<section id="banner" data-video="${cp}/images/banner">
			<div class="inner">
				<header>
					<h1>친 구 목 록</h1>
				</header>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="${cp}/images/banner.mp4" muted autoplay loop playsinline></video>
		</section>

		<!-- Wrapper -->
		<div id="wrapper">

			<form name="friendlistForm"
				action="${pageContext.request.contextPath}/user/UserFriendListOK.us?${follow.userid}"
				method="post" onsubmit="return sendit();">
				<table>
					 <tr style="text-align: center;">
						<td>번 호</td>
						<td>이 름</td>
						<td>팔 로 우</td>
						<td>날 짜</td>
					</tr>
					
					 <c:forEach items="${follows}" var="follow">
		                  <tr style="text-align: center;">
		                     <td>${follow.follownum}</td>
		                     <td>${follow.userid}</td>
		                     <td>${follow.followid}</td>
		                     <td>${follow.regdate}</td>
		                  </tr>
		               </c:forEach>
				</table>
			</form>
			
			<!-- CTA -->
			<section id="cta" class="main special">
				<div class="inner">
					<p>
						Sed varius suspendisse dictum leo ipsum amet pellentesque<br />
						fusce ac hendrerit consectetur tempor lorem ipsum.
					</p>
					<ul class="actions stacked special">
						<li><a href="#" class="button primary large">Get Started</a></li>
						<li><a href="#" class="button large">Learn More</a></li>
					</ul>
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
<!--  <script> 뭔지 모르겠을때 이걸로 하기
console.log ('${findfriend.username}')
</script> -->
</html>