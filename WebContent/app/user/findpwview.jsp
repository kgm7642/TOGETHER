<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>비밀번호 찾기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
	<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<c:if test="${not empty param.login}">
		<script>
			alert("로그인 실패! 다시 시도해 주세요...");
		</script>
	</c:if>
	<c:if test="${not empty param.find}">
		<script>
			alert("일치하는 정보가 없습니다. 다시 시도해 주세요.");
		</script>
	</c:if>
	
		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header">
						<a href="${cp}/index.jsp" class="logo"><span>together ${session.userid}</span></a>
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
								<h1>FIND TOGETHER PASSWORD</h1>
							</header>
						</div>
						<a href="#wrapper" class="more">Learn More</a>
						<video src="${cp}/images/banner.mp4" muted autoplay loop playsinline></video>
					</section>

				<!-- Wrapper -->
					<div id="wrapper">
					<section id="main" class="main">
						<div class="inner">
						<form name="findpwForm" action="${pageContext.request.contextPath}/user/UserFindpwOk.us" method="post" onsubmit="return sendit();">
							<table>
								<tr>
									<th>아이디입력</th>
									<td>
										<input type="text" name="userid" id = "userid" placeholder="아이디를 입력해주세요">
									</td>
								</tr>
								<tr>
									<th>휴대폰번호 입력</th>
									<td>
										<input type="text" name="userphone" id = "userphone" placeholder="ex) 010-0000-0000">
									</td>
								</tr>
								<tr>
									<th colspan="2" style="text-align: center;"><input type="submit" value="비밀번호찾기"></th>
								</tr>
							</table>
						</form>

						<!-- CTA -->

								</div>
			</section>
		</div>


				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands alt fa-youtube"><span class="label">YouTube</span></a></li>
								<li><a href="#" class="icon brands alt fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon solid alt fa-envelope"><span class="label">Email</span></a></li>
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
<script>
	let idTag = document.findpwForm.userid;
	let telTag = document.findpwForm.userphone;
		function sendit(){
			if(userid != null) {
				if(idTag.value == ""){
					alert("아이디를 입력하세요!");
					idTag.focus();
					return false;
				}
				if(telTag.value == ""){
					alert("전화번호를 입력하세요!");
					telTag.focus();
					return false;
				}
			}
		}
				
</script>
</html>