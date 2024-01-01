<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Together</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<style>
.custom-btn {
	width: 240px;
	height: 40px;
	color: #fff;
	border-radius: 5px;
	padding: 10px 25px;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}
/* 12 */
.btn-12 {
	position: relative;
	right: 20px;
	bottom: 20px;
	border: none;
	box-shadow: none;
	width: 240px;
	height: 40px;
	line-height: 42px;
	-webkit-perspective: 230px;
	perspective: 230px;
}

.btn-12 span {
	background: rgb(247, 150, 192);
	background: linear-gradient(0deg, rgba(247, 150, 192, 1) 0%,
		rgba(118, 174, 241, 1) 100%);
	display: block;
	position: absolute;
	width: 240px;
	height: 40px;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	border-radius: 5px;
	margin: 0;
	text-align: center;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all .3s;
	transition: all .3s;
}

.btn-12 span:nth-child(1) {
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
	-webkit-transform: rotateX(90deg);
	-moz-transform: rotateX(90deg);
	transform: rotateX(90deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12 span:nth-child(2) {
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
	-webkit-transform-origin: 50% 50% -20px;
	-moz-transform-origin: 50% 50% -20px;
	transform-origin: 50% 50% -20px;
}

.btn-12:hover span:nth-child(1) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	-webkit-transform: rotateX(0deg);
	-moz-transform: rotateX(0deg);
	transform: rotateX(0deg);
}

.btn-12:hover span:nth-child(2) {
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	color: transparent;
	-webkit-transform: rotateX(-90deg);
	-moz-transform: rotateX(-90deg);
	transform: rotateX(-90deg);
}

.box {
	width: 100%;
	height: 300px;
	padding: 0px;
}

.todayMoimList {
	overflow-y: scroll;
}

.todayMoimListTable th {
	position: sticky;
	top: 0px;
}

.th1 {
	background-color: #E0EDF2;
}

.th2 {
	background-color: #FAE7F4;
}

.th3 { 
	background-color: #E0EDF2;
	padding: 12px;
}

.todayMoimListTR {
	border: none;
}

table, tr, th, td {
	text-align: center;
	align: center;
	valign: middle;
}

hr.tMyMoim {
	margin: 10px 0;
}

td.tMyMoimTable {
	background-color: white;
}

td.tMyMoimText {
	padding: 0.5em;
	background-color: white;
}
.board, .moimCursor{
	cursor:pointer;
}
.myCursor{
	cursor:pointer;
}
td{
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
table{
	table-layout: fixed;
}

</style>
<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<c:set var="boardList" value="${requestScope.boardList}" />
	<c:if test="${not empty param.resign}">
		<script>
			alert("회원탈퇴를 완료했습니다.");
		</script>
	</c:if>

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<c:choose>
				<c:when test="${session.userid == 'admin'}">
					<a href="${cp}/index.jsp" class="logo"><span>admin(관리자)</span></a>
				</c:when>
				<c:when test="${session.userid != null}">
					<a href="${cp}/index/Index.ix" class="logo"><span>together
							${session.userid}</span></a>
				</c:when>
				<c:otherwise>
					<a href="${cp}/index.jsp" class="logo"><span>together</span></a>
				</c:otherwise>
			</c:choose>
			<nav>
				<ul>
					<li><a href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<c:if test="${session.userid == null }">
					<li><a href="${cp}/index.jsp">Home</a></li>
				</c:if>
				<c:if test="${session.userid != 'admin'}">
					<li><a href="${cp}/moim/CreatePlace.mo">CREATE MOIM</a></li>
					<li><a href="${cp}/moim/SearchMoim.mo">SEARCH MOIM</a></li>
					<li><a href="${cp}/moim/AdMoim.mo">PROMOTION BOARD</a></li>
					<li><a href="${cp}/board/BoardList.bo">BOARD</a></li>
					<li><a href="${cp}/board/NoticeList.bo">NOTICE</a></li>						
				</c:if>
				<c:if test="${session.userid == 'admin'}">
					<li><a href="${cp}/admin/MoimList.ad">모임 관리</a></li>
					<li><a href="${cp}/admin/AdminMoimBoard.ad">홍보 게시판 관리</a></li>
					<li><a href="${cp}/admin/AdminBoardList.ad">게시판 관리</a></li>
					<li><a href="${cp}/admin/AdminNoticeList.ad">공지사항 관리</a></li>
				</c:if>
			</ul>
			<ul class="actions stacked">
				<c:if test="${session.userid == null}">
					<li><a href="${cp}/user/UserJoin.us"
						class="button primary fit">SIGN UP</a></li>
					<li><a href="${cp}/user/UserLogin.us" class="button fit">LOGIN</a></li>
				</c:if>
				<c:if test="${session.userid != null }">
					<c:if test="${session.userid != 'admin'}">
						<li><a
							href="${pageContext.request.contextPath}/user/UserMypageIndex.us"
							class="button primary fit">MyPage</a></li>
					</c:if>
					<li><a href="${cp}/user/UserLogoutOk.us"
						class="button fit">LOGOUT</a></li>
				</c:if>
			</ul>
		</nav>



		<!-- Banner -->

		<section id="banner" data-video="${cp}/images/banner">
			<div class="inner">
				<header>
					<h1>Together</h1>
				</header>
				<div>
					<c:if test="${session.userid != 'admin'}">
						<a href="${cp}/moim/CreatePlace.mo" class="custom-btn btn-12"><span>click!</span><span>모임
							생성</span></a>
					</c:if>
				</div>
			</div>
			<c:if test="${session.userid != 'admin'}">
				<c:if test="${session.userid != null}">
					<a href="#wrapper" class="more">Learn More</a>
				</c:if>
			</c:if>
			<video src="${cp}/images/mainbanner.mp4" muted autoplay loop
				playsinline></video>
		</section>



		<c:if test="${session.userid != 'admin'}">
		<c:if test="${session.userid != null}">

			<!-- Wrapper -->

			<div id="wrapper">

				<section id="four" class="main special">
					<div class="inner">
						<div class="features">

							<section>
								<h2>FOLLOW</h2>
								<hr>
								<table>
									<c:forEach items="${FriendList}" var="follow">
										<tr style="text-align: center;">
											<td>${follow.followid}</td>
										</tr>
									</c:forEach>
								</table>
								<a
									href="${pageContext.request.contextPath}/user/UserFriendListOK.us"
									class="button primary fit large">L I S T</a>
							</section>

							<section style="margin-left: auto; margin-right: auto;">
								<h2>
									<strong>${session.userid}</strong>
								</h2>
								<hr>
								<a class="button fit" href="${cp}/user/UserMypageIndex.us">MYPAGE</a>
								<a class="button primary fit icon solid fa-search"
									href="${cp}/user/UserFindFriend.us">FIND FRIEND</a> <a
									class="button fit" href="${cp}/moim/AdMoim.mo">PROMOTION
									BOARD</a> <a class="button primary fit"
									href="${cp}/user/UserLogoutOk.us">LOGOUT</a>
							</section>

							<section>
								<h2 style="text-align: center;">
									<strong>Today's Weather</strong>
								</h2>
								<hr>
								<h3 class="weathericon"></h3>
								<h3 class="ctemp">현재 기온 :</h3>
								<h3 class="lowtemp">최저 기온 :</h3>
								<h3 class="hightemp">최고 기온 :</h3>
							</section>

							<section>
								<c:choose>
									<c:when test="${moimcnt==1 and moimcnt != null }">
										<form name="todaymymoimform"
											action="${cp}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}"
											method="post">
											<h2>Today's Schedule</h2>
											<hr class="tMyMoim">
											<div style="font-size: 1.0em;">
												<strong>&lt<span id="current_date"></span>&gt
													${session.userid}님의 모임
												</strong>
											</div>
											<hr class="tMyMoim">
											<table class="tmoim">
												<tr>
													<td class="tMyMoimTable"><strong>모임 이름</strong></td>
													<td class="tMyMoimText"><strong>${moim.moimname}</strong></td>
												</tr>
												<tr>
													<td class="tMyMoimTable"><strong>장소</strong></td>
													<td class="tMyMoimText"><strong>${place.placename}</strong></td>
												</tr>
												<tr>
													<td class="tMyMoimTable"><strong>종료</strong></td>
													<td class="tMyMoimText"><strong>${fn:split(moim.enddate," ")[0]}</strong></td>
												</tr>
											</table>
											<div style="text-align: center;">
												<input type="submit" class="button primary fit"
													value="자세히 보기 ▶"
													style="width: 80%; height: 50px; font-size: 0.7em; margin-top: 20px;">
											</div>
										</form>
									</c:when>
									<c:when test="${moimcnt>1 and moimcnt != null }">
										<h2>Today's Schedule</h2>
										<hr class="tMyMoim">
										<div style="font-size: 1.0em;">
											<strong>&lt<span id="current_date"></span>&gt
												${session.userid}님의 모임
											</strong>
										</div>
										<hr class="tMyMoim">
										<div class="box todayMoimList"
											style="border: 2px solid #d4d7cf;">
											<table class="tmoim todayMoimListTable">
												<tr align="center" valign="middle" class="todayMoimListTR">
													<th class="th3" width="50%"><div style="text-align: center;">모임 이름</div></th>
													<th class="th3" width="50%"><div style="text-align: center;">끝 날짜</div></th>
												</tr>
												<c:forEach var="todayMyMoimList" items="${todayMyMoimList}">
													<tr class="myCursor" onmouseover="this.style.background='#eeeeeb'" onClick="location.href='${cp}/moim/GetMoimInfo.mo?moimnum=${todayMyMoimList.moimnum}'" onmouseout="this.style.background='white'">
														<td><strong>${todayMyMoimList.moimname}</strong></td>
														<td><strong>${fn:split(todayMyMoimList.enddate," ")[0]}</strong></td>
													</tr>
												</c:forEach>
											</table>
										</div>
										<strong>※ 모임 이름을 눌러 상세 모임을 확인하세요.</strong>
									</c:when>
									<c:otherwise>
										<h2>Today's Schedule</h2>
										<hr class="tMyMoim">
										<div style="font-size: 1.0em;">
											<strong>&lt<span id="current_date"></span>&gt
												${session.userid}님의 모임
											</strong>
										</div>
										<hr class="tMyMoim">
										<div style="font-size: 1.0em; padding: 3em;">
											<strong>${session.userid}님은<br> 오늘 예정된 모임이
												없습니다.
											</strong>
										</div>
										<hr class="tMyMoim">
										<div class="button primary"
											style="width: 80%; height: 50px; font-size: 0.7em; margin-top: 20px;">
											<a style="border-bottom: none;"
												href="${cp}/moim/CreatePlace.mo"> 모임 생성하러 가기</a>
										</div>
									</c:otherwise>
								</c:choose>
							</section>

						</div>
					</div>
				</section>


				<!-- One -->

				<section id="two" class="main">
					<div class="inner spotlight style1">
						<div class="content">
							<h2 style="text-align: center;">💖 TOGETHER Top 5 💔</h2>
							<hr>
							<table class="list"
								style="margin-left: auto; margin-right: auto; text-align: center;">
								<tr align="center" valign="middle">
									<th width="40%" style="padding:12px;text-align: center;background-color: #E0EDF2"><strong>제목</strong></th>
									<th width="10%" style="padding:12px;text-align: center;background-color: #E0EDF2"><strong>작성자</strong></th>
									<th width="10%" style="padding:12px;text-align: center;background-color: #E0EDF2"><strong>카테고리</strong></th>
									<th width="20%" style="padding:12px;text-align: center;background-color: #E0EDF2"><strong>날짜</strong></th>
									<th width="10%" style="padding:12px;text-align: center;background-color: #E0EDF2"><strong>💖</strong></th>
									<th width="10%" style="padding:12px;text-align: center;background-color: #E0EDF2"><strong>조회수</strong></th>
								</tr>
								<c:choose>
									<c:when test="${boardList.size()>0 and boardList != null }">
										<c:forEach var="board" items="${boardList }">
											<tr class="board" id="board${board.boardnum}" onmouseover="this.style.background='#eeeeeb'" onClick="location.href='${cp}/board/BoardView.bo?boardnum=${board.boardnum}&page=${page}&keyword=${keyword}'" onmouseout="this.style.background='white'">
												<td><strong>${board.boardtitle}</strong></td>
												<td><strong>${board.userid}</strong></td>
												<td><strong><c:choose>
														<c:when test="${board.category == 1}">여행</c:when>
														<c:when test="${board.category == 2}">스터디</c:when>
														<c:when test="${board.category == 3}">동호회</c:when>
														<c:when test="${board.category == 4}">취미</c:when>
														<c:when test="${board.category == 5}">운동</c:when>
														<c:when test="${board.category == 6}">친구</c:when>
														<c:when test="${board.category == 7}">취업</c:when>
														<c:when test="${board.category == 8}">크루</c:when>
													</c:choose></strong></td>
												<td><strong>${board.regdate}</strong></td>
												<td><strong>${board.likes}</strong></td>
												<td><strong>${board.views}</strong></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center; font-size: 20px;"><strong>등록된
													게시글이 없습니다</strong></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							<br>
						</div>
					</div>
				</section>

				<!-- Two -->

				<section id="three" class="main">
					<div class="inner spotlight alt style2">
						<div class="content">
							<header>
								<div style="text-align: center; width: 100%;">
									<h2>
										<strong style="font-weight: bold;">✈️오늘 시작하는 모임✈️</strong>
									</h2>
								</div>
								
									<table class="todayMoimListTable" style="margin:0px;">
										<tr class="todayMoimListTR">
											<th class="th1" style="width: 50%;">
												<div style="text-align:center;margin-top:10px;"><strong>모임 이름</strong></div>
											</th>
											<th class="th2" style="width: 16%;">
												<div style="text-align:center;margin-top:10px;"><strong>모 임 장</strong></div>
											</th>
											<th class="th1" style="width: 17%;">
												<div style="text-align:center;margin-top:10px;"><strong>시작 날짜</strong></div>
											</th>
											<th class="th2" style="width: 17%;">
												<div style="text-align:center;margin-top:10px;"><strong>끝 날짜</strong></div>
											</th>
										</tr>
									</table>
									<c:choose>
										<c:when
											test="${todayMoimList.size()>0 and todayMoimList != null }">
											<div class="box todayMoimList"
											style="border: 1px solid #d4d7cf;">
												<table style="margin:0px;">
												<c:forEach var="todayMoimList" items="${todayMoimList}">
													<tr class="moimCursor" onmouseover="this.style.background='#eeeeeb'" onClick="location.href='${cp}/moim/GetMoimInfo.mo?moimnum=${todayMoimList.moimnum}'" onmouseout="this.style.background='white'">
														<td style="width: 50%;">
															<div style="text-align: center;"><strong>${todayMoimList.moimname}</strong></div>
														</td>
														<td style="width: 16%;">
															<div style="text-align: center;"><strong>${todayMoimList.userid}</strong></div>
														</td>
														<td style="width: 17%;">
															<div style="text-align: center;"><strong>${fn:split(todayMoimList.startdate," ")[0]}</strong></div>
														</td>
														<td style="width: 17%;">
															<div style="text-align: center;"><strong>${fn:split(todayMoimList.enddate," ")[0]}</strong></div>
														</td>
													</tr>
												</c:forEach>
												</table>
											</div>
										</c:when>
										<c:otherwise>
											<table>
												<tr style="border: none;">
													<td></td>
													<td><strong style="font-size: 20px;">오늘 시작하는
															모임이 없습니다.</strong></td>
													<td></td>
												</tr>
												<tr style="border: none;">
													<td></td>
													<td>
														<a href="${cp}/moim/SearchMoim.mo"
															class="button large">전체 모임 리스트 확인하기</a>
													</td>
													<td></td>
												</tr>
											</table>
										</c:otherwise>
								</c:choose>
							</header>
						</div>
					</div>
				</section>
			</div>
		</c:if>
	</c:if>
	</div>
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<c:set var="boardList" value="${requestScope.boardList}" />

	<!-- CTA -->


	<c:if test="${session.userid != 'admin'}">
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
	</c:if>
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
	$
			.getJSON(
					'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=dfc53b8f7036977f9583925ba206e881&units=metric',
					function(result) {
						$('.ctemp').append(result.main.temp);
						$('.lowtemp').append(result.main.temp_min);
						$('.hightemp').append(result.main.temp_max);
						// result.weather[0].icon
						var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon+'@4x.png" alt="'+result.weather[0].description+'">'

						$('.weathericon').html(wiconUrl);

					});	
	
	date = new Date();
	year = date.getFullYear();
	month = ("0" + (1 + date.getMonth())).slice(-2);
	day = ("0" + date.getDate()).slice(-2);
	document.getElementById("current_date").innerHTML = year + "-" + month
			+ "-" + day;
	/*깃 확인용 주석*/
</script>
</html>