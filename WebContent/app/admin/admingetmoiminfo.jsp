<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>모임 관리 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
</head>
<style>
#select:hover {
	color: #15CBE3
}

.label:hover {
	color: #15CBE3
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

.chattr {
	border: 0;
}

table, tr, th, td {
	text-align: center;
	align: center;
	valign: middle;
}
</style>
<body class="is-preload">
	<c:set var="appkey" value="08d5f583f36357f829d2651be810df95"></c:set>
	<c:set var="cp" value="${pageContext.request.contextPath}" />
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

		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<section id="main" class="main">
				<div class="inner">

					<header class="major">
						<h1>${moim.moimname}</h1>
					</header>

					<!-- 모임 정보 띄우는 테이블-->
					<div id="container">
						<table>
							<tr>
								<td style="width: 49%;">
									<h2 style="text-align: center;">INFO</h2>
									<table>
										<tr>
											<td>모임장</td>
											<td>${moim.userid}</td>
										</tr>
										<tr>
											<td>분류</td>
											<td><c:choose>
													<c:when test="${moim.moimtype == 1}">여행</c:when>
													<c:when test="${moim.moimtype == 2}">스터디</c:when>
													<c:when test="${moim.moimtype == 3}">동호회</c:when>
													<c:when test="${moim.moimtype == 4}">취미</c:when>
													<c:when test="${moim.moimtype == 5}">운동</c:when>
													<c:when test="${moim.moimtype == 6}">친구</c:when>
													<c:when test="${moim.moimtype == 7}">취업</c:when>
													<c:when test="${moim.moimtype == 8}">크루</c:when>
													<c:when test="${moim.moimtype == 9}">연애</c:when>
													<c:when test="${moim.moimtype == 10}">상담</c:when>
												</c:choose></td>
										</tr>
										<tr>
											<td>경비</td>
											<td>${moim.moimbudget}</td>
										</tr>
										<tr>
											<td>출발날짜</td>
											<td>${fn:split(moim.startdate," ")[0]}</td>
										</tr>
										<tr>
											<td>끝날짜</td>
											<td>${fn:split(moim.enddate," ")[0]}</td>
										</tr>
										<tr>
											<td>모임 장소</td>
											<td>${place.placename}</td>
										</tr>
									</table>
								</td>
								<td style="width: 49%;">
									<h2 style="text-align: center;">WHERE</h2>
									<div id="staticMap" style="width: 100%; height: 350px;"></div>
									<div>
										<input type="hidden" id="placenum" name="placenum" value="">
										<input type="hidden" id="placelat" name="placelat" value="">
										<input type="hidden" id="placelon" name="placelon" value="">
										<input type="hidden" id="placename" name="placename" value="">
										<input type="hidden" id="placeroadaddr" name="placeroadaddr"
											value=""> <input type="hidden" id="placeaddr"
											name="placeaddr" value=""> <input type="hidden"
											id="placecategoryname" name="placecategoryname" value="">
										<input type="hidden" id="placephone" name="placephone"
											value=""> <input type="hidden" name="moimnum"
											value="${moim.moimnum}">
									</div>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td colspan="2">
									<h2 style="text-align: center;"><span style="color:#62b2d4;">${moim.moimname}</span> <span style="font-size:0.8em;">MEMBER</span></h2>
									<table>
										<tr style="text-align: center;">
											<td style="background-color: #E0EDF2"><strong>아 이 디</strong></td>
											<td style="background-color: #E0EDF2"><strong>전 화 번 호</strong></td>
											<td style="background-color: #E0EDF2"><strong>이 메 일</strong></td>
										</tr>
										<c:forEach items="${members}" var="member">
											<tr style="text-align: center;">
												<c:choose>
													<c:when test="${moim.userid == member.userid}">
														<td>👑 ${member.userid}</td>
													</c:when>
													<c:otherwise>												
														<td>&nbsp;&nbsp;&nbsp;${member.userid}</td>
													</c:otherwise>
												</c:choose>
												<td>${member.userphone}</td>
												<td>${member.useremail}</td>
											</tr>
										</c:forEach>
									</table>
								</td>
							</tr>
						</table>
						<div style="text-align: center;">
							<div style="display:inline-block;margin-right:20px;">
								신고 횟수 : ${moim.dislike}
							</div>
							<input type="button" class="button primary" value="모임 취소"
									onclick="cancel()" style="display:inline-block;">
						</div>
						<hr>
					</div>
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
					<li><a href="#" class="icon solid alt fa-envelope"><span
							class="label">Email</span></a></li>
				</ul>
			</div>
			<p class="copyright">&copy; Untitled. All rights reserved.</p>
		</footer>
	</div>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey}&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script
	src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>let cp ="${pageContext.request.contextPath}"</script>

<script>
	
		function  cancel(){
			if(confirm("정말 취소하시겠습니까?")){
			location.href="${pageContext.request.contextPath}/admin/AdminCancelMoim.ad?moimnum=${moim.moimnum}"
			}
		}

		let placelat = "${place.placelat}"
		let placelon = "${place.placelon}"
		// 이미지 지도에서 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(placelat, placelon);
		
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = {
		    position: markerPosition
		};
		
		var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new kakao.maps.LatLng(placelat,placelon), // 이미지 지도의 중심좌표
		        level: 3, // 이미지 지도의 확대 레벨
		        marker: marker // 이미지 지도에 표시할 마커 
		    };    
		
		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
</html>