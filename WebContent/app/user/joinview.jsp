<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
	<style>
		th, td{
			vertical-align:middle;
		}
	</style>
	<body class="is-preload">
		<c:set var="cp" value="${pageContext.request.contextPath}"/>
			<c:if test="${not empty param.join}">
				<script>alert("회원가입을 실패했습니다! 다시 시도해 주세요...");</script>
			</c:if>

		<!-- Page Wrapper -->
			<div id="page-wrapper">

		<!-- Header -->
					<header id="header">
						<a href="${cp}/index.jsp" class="logo"><span>together</span></a>
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
						<section id="banner"
							data-video="${pageContext.request.contextPath}/images/banner">
							<div class="inner">
								<header>
									<h1>SIGN UP TOGETHER</h1>
								</header>
							</div>
							<a href="#wrapper" class="more">Learn More</a>
							<video src="${pageContext.request.contextPath}/images/banner.mp4"
								muted autoplay loop playsinline></video>
						</section>
				<!-- Wrapper -->
						<div id="wrapper">
						<section id="main" class="main">
							<div class="inner">
							<form name="joinForm" method="post"
								action="${pageContext.request.contextPath}/user/UserJoinOk.us"
								onsubmit="return sendit()" style="text-align: center;">
								<table>
									<tr>
										<td colspan="2">
											<span id="ResultId" style="color: red;"></span>
										</td>
									</tr>
									<tr>
										<th style="padding:12px;"><label for="userid">아이디</label></th>
										<td style="padding:12px;">
											<input type="text" name="userid" id="userid" 
											class="form-control" style="width: 80%; float: left"> 
											<input type="button" value="중복검사" class="btn btn-outline-primary"
											onclick="checkId()" style="float: right">
										</td style="padding:12px;">
									</tr>
									<tr>
										<th style="padding:12px;"><label for="userpw">비밀번호</label></th>
										<td style="padding:12px;"><input type="password" name="userpw" id="userpw"
											placeholder="대문자, 소문자, 숫자, 특수문자 모두 포함"></td>
									</tr>
									<tr>
										<th style="padding:12px;"><label for="userpw_re">비밀번호 확인</label></th>
										<td style="padding:12px;"><input type="password" name="userpw_re" id="userpw_re"
											placeholder="비밀번호를 다시 한번 입력해주세요"></td>
									</tr>
									<tr>
										<th style="padding:12px;"><label for="username">이름</label></th>
										<td style="padding:12px;"><input type="text" name="username" id="username"
											placeholder="ex) 홍길동"></td>
									</tr>
									<tr class="zipcode_area">
										<th style="padding:12px;">우편번호</th>
										<td style="padding:12px;"><input readonly name="zipcode" type="text"
											id="sample6_postcode" class="form-control" style="width: 75%; float: left" placeholder="우편번호 찾기 버튼을 눌러주세요"> 
											<input type="button" onclick="sample6_execDaumPostcode()"
											value="우편번호 찾기" class="btn btn-outline-primary" style="float: right"></td>
									</tr>
									<tr class="addr_area">
										<th style="padding:12px;">주소</th>
										<td style="padding:12px;"><input readonly name="useraddr" type="text"
											id="sample6_address"></td>
									</tr>
									<tr>
										<th style="padding:12px;">상세주소</th>
										<td style="padding:12px;"><input name="useraddrd" type="text"
											id="sample6_detailAddress"></td>
									</tr>
									<tr>
										<th style="padding:12px;">참고항목</th>
										<td style="padding:12px;"><input readonly name="addretc" type="text"
											id="sample6_extraAddress"></td>
									</tr>
									<tr>
										<th style="padding:12px;"><label for="userphone">휴대폰번호</label></th>
										<td style="padding:12px;"><input type="text" name="userphone" id="userphone"
											placeholder="ex) 010-1234-5678"></td>
									</tr>
									<tr>
										<th style="padding:12px;"><label for="useremail">이메일주소</label></th>
										<td style="padding:12px;"><input type="text" name="useremail" id="useremail"
											placeholder="ex) abc@google.com"></td>
									</tr>
									<tr class="gender_area">
										<th style="padding:12px;" width="20%">성별</th>
										<td style="float:left;padding:12px;"><input type="radio" id="priority-low" name="usergender"
											value="남자"> <label for="priority-low">남자</label> <input
											type="radio" id="priority-normal" name="usergender" value="여자">
											<label for="priority-normal">여자</label></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" style="text-align: center;" value="가입 완료"></td>
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


</body>
		<!-- Scripts -->
		<script>
			let cp = "${pageContext.request.contextPath}"
		</script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="${pageContext.request.contextPath}/app/user/user.js"></script>
		</html>