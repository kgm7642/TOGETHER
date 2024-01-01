<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임 생성_모임 설정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
	<style>
		#select:hover {color: #15CBE3}
		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:500px;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:#777;}
	</style>
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
										<h1>Welcome</h1>
									</header>
									<div style="text-align:center;">
										<div style="width:100%;display:inline-block;">
											<div style="font-size:50px;float:left;margin-top:20px;">모임 생성</div>
											<div style="font-size:20px;float:right;margin-top:40px;"><span>① 모임 장소 설정 </span> &nbsp;&#187; <span style="font-weight:bold;color:#579AB7"> ② 모임 정보 입력</span> &nbsp;&#187; <span> ③ 모임 생성 완료</span></div>
										</div>
									</div>
									<div>
										<form action="${cp}/moim/CreateMoimOk.mo" method="post" name="moimform" onsubmit="return sendmoim()">
											<input type="hidden" id="placenum" name="placenum" value=""><hr>
											
											<div style="width:100%;margin:20px auto;text-align:center;">
												<div style="width:15%;display:inline-block;color:black;">모임 이름</div>
												<div style="width:80%;display:inline-block;"><input type="text" name="moimname" style="border-color:black;"></div>
											</div><hr>
											
											<div style="width:100%;margin:20px auto;text-align:center;">
												<div style="width:15%;display:inline-block;color:black;">모임 유형</div> 
												<select name = "moimtype" style="width:80%;display:inline-block;border-color:black;">
		         									<option value = "1" selected>여행</option>
		          									<option value = "2">스터디</option>
		         									<option value = "3">동호회</option>
		         									<option value = "4">취미</option>
		         									<option value = "5">운동</option>
		         									<option value = "6">친구</option>
		         									<option value = "7">취업</option>
		         									<option value = "8">크루</option>
		         									<option value = "9">연애</option>
		         									<option value = "10">상담</option>
		       									</select>
											</div><hr>
											
											<div style="width:100%;margin:20px auto;text-align:center;">
												<div style="width:15%;display:inline-block;color:black;">모임 예산</div>
												<div style="width:80%;display:inline-block;"><input type="text" name="moimbudget" style="border-color:black;"></div>
											</div><hr>
											
											<div style="width:100%;margin:20px auto;text-align:center;">
												<div style="width:15%;display:inline-block;color:black;">모임장 </div>
												<div style="width:80%;display:inline-block;"><input type="text" name="moimkingid" value="${session.userid}" readonly style="border-color:black;"></div>
											</div><hr>
											
											<div style="width:100%;margin:20px auto;text-align:center;">
												<div style="width:20%;display:inline-block;color:black;float:left;margin-top:20px;">모임 기간</div>
												<div style="width:35%;display:inline-block;">
													<div style="width:25%;display:inline-block;margin-top:20px;">시작 날짜</div><div style="width:55%;display:inline-block;margin-top:20px;"><input type="date" name="moimstartdate"></div>
												</div>
												<div style="width:35%;display:inline-block;">
													<div style="width:25%;display:inline-block;margin-top:20px;">종료 날짜</div><div style="width:55%;display:inline-block;"><input type="date" name="moimenddate"></div>
												</div>
											</div><hr>
								
											<div style="text-align:center;">
											<div style="width:100%;display:inline-block;">
												<input type="button" id="gohome" value="이전 페이지" style="float:left;margin-top:40px;" class="button primary" onclick="location.href='${cp}/moim/CreatePlace.mo'">
												<input type="submit" value="모임 생성" style="float:right;margin-top:40px;" class="button primary">
											</div>
										</div>
										</form>
									</div>
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
	<script>let cp = "${pageContext.request.contextPath}"</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/createmoim.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</html>