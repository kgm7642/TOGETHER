<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 검색(리스트)</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
</head>
<style>
#wrapper {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
.moim{
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
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:if test="${param.join == true}">
		<script>
			alert("가입 신청 완료!");
		</script>
	</c:if>
	<c:if test="${param.join == false}">
		<script>
			alert("가입 신청에 실패했습니다. 다시 시도해주세요.");
		</script>
	</c:if>
	<c:set var="cp" value="${pageContext.request.contextPath}" />

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
			
			<section id="banner" data-video="${cp}/images/banner">
			<div class="inner">
				<header>
					<h1>SEARCH MOIM</h1>
				</header>
			</div>
			<c:if test="${session.userid != null}">
				<a href="#wrapper" class="more">Learn More</a>
			</c:if>
			<video src="${cp}/images/banner.mp4" muted autoplay loop
				playsinline></video>
		</section>

		<!-- Wrapper -->
		
		<div id="wrapper">

			<!-- Main -->
			
			<section id="main" class="main">
				<div class="inner">
					
					<!-- 검색 버튼 -->
					
					<div class="search_area">
						<input type="search" id="q" name="q" size=50 placeholder="모임 이름을 입력해주세요. 최소 2글자 이상."> 
						<input type="button" value="검색" onclick="search()" class="primary button;">
					</div>
					<hr>

					<!-- 게시글 리스트 띄우는 테이블 -->
					
					<div style="float: right;margin-bottom:10px;"><strong>총 모임 : ${totalCnt}</strong></div>	
					<table class="list">
						<tr align="center" valign="middle">
							<th width="35%" style="text-align: center;padding:12px; background-color: #E0EDF2"">모임이름</th>
							<th width="15%" style="text-align: center;padding:12px; background-color: #E0EDF2"">모임장</th>
							<th width="15%" style="text-align: center;padding:12px; background-color: #E0EDF2"">시작일</th>
							<th width="15%" style="text-align: center;padding:12px; background-color: #E0EDF2"">종료일</th>
						</tr>
						<c:choose>
							<c:when test="${moimList.size()>0 and moimList != null }">
								<c:forEach var="moim" items="${moimList}">
									<tr class="moim" id="moim${moim.moimnum}" class="myCursor" 
										onmouseover="this.style.background='#eeeeeb'" 
										onClick="location.href='${cp}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}&page=${page}&keyword=${keyword}'" 
										onmouseout="this.style.background='white'">
										<td>${moim.moimname}</td>
										<td>${moim.userid}</td>
										<td>${fn:split(moim.startdate," ")[0]}</td>
										<td>${fn:split(moim.enddate," ")[0]}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center; font-size: 20px">
										등록된 게시글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<br>

					<!-- 페이징 처리하는 테이블 -->
					
					<table class="pagination">
						<tr align="center" valign="middle">
							<td><c:if test="${page>1}">
									<a
										href="${cp}/moim/SearchMoim.mo?page=${page-1}&keyword=${keyword}">&lt;</a>
								</c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1"
									var="i">
									<c:choose>
										<c:when test="${page == i}">
											<span class="nowPage">${i}</span>
										</c:when>
										<c:otherwise>
											<a
												href="${cp}/moim/SearchMoim.mo?page=${i}&keyword=${keyword}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${page<totalPage}">
									<a
										href="${cp}/moim/SearchMoim.mo?page=${page+1}&keyword=${keyword}">&gt;</a>
								</c:if></td>
						</tr>
					</table>
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
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
	function search() {
		let q = document.getElementById("q");
		if (q.value.length > 10 || q.value.length < 2) {
			alert("검색어는 2자 이상 10자 이하로 입력해 주세요!")
			q.focus();
			return false;
		}
		location.href = "${cp}/moim/SearchMoim.mo?keyword=" + q.value
	}
</script>
</html>