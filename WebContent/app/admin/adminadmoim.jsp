<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Formula by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>홍보 게시판 관리 [admin]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<style>
.board{
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
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location
					.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:if test="${param.remove == true}">
		<script>
			alert("게시글 삭제 완료!")
		</script>
	</c:if>
	<c:if test="${param.remove == false}">
		<script>
			alert("게시글 삭제 실패. 다시 시도해주세요.")
		</script>
	</c:if>
	<c:set var="AdMoimList" value="${requestScope.AdMoimList }" />
	<c:set var="page" value="${requestScope.page }" />
	<c:set var="startPage" value="${requestScope.startPage }" />
	<c:set var="endPage" value="${requestScope.endPage }" />
	<c:set var="totalCnt" value="${requestScope.totalCnt }" />
	<c:set var="totalPage" value="${requestScope.totalPage }" />

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

		<!-- Banner -->
		<section id="banner" data-video="images/banner">
			<div class="inner">
				<header>
					<h1>홍보 게시판 관리</h1>
				</header>
				<ul class="actions special">
				</ul>
			</div>
			<a href="#wrapper" class="more">Learn More</a>
			<video src="images/banner.mp4" muted autoplay loop playsinline></video>
		</section>


		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<section id="main" class="main">
				<div class="inner">
					<div style="text-align: center;">
						<div style="width: 100%; display: inline-block;">
							<div style="font-size: 20px; float: left; margin-top: 40px;">
								<strong>글 개수 : ${totalCnt}</strong>
							</div>
						</div>
					</div>

					<!-- 게시글 리스트 띄우는 테이블 -->
					<table class="list" style="margin: 0px;">
						<tr align="center" valign="middle" bgcolor="black">
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">번호</th>
							<th width="30%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">제목</th>
							<th width="20%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">작성자</th>
							<th width="20%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">날짜</th>
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">조회수</th>
							<th width="10%"
								style="text-align: center; padding: 12px; background-color: #E0EDF2">신고수</th>
						</tr>
						<c:choose>
							<c:when test="${AdMoimList.size()>0 and AdMoimList != null }">
								<c:forEach var="board" items="${AdMoimList }">

									<tr class="board" id="board${board.recruitnum}" onClick="location.href='${cp}/admin/AdminMoimBoardView.ad?boardnum=${board.recruitnum}&page=${page}&keyword=${keyword}'" onmouseover="this.style.background='#eeeeeb'" onmouseout="this.style.background='white'">
										<td style="text-align: center;">${board.recruitnum}</td>
										<td style="text-align: center;">${board.recruittitle }</td>
										<td style="text-align: center;">${board.userid}</td>
										<td style="text-align: center;">${board.regdate}</td>
										<td style="text-align: center;">${board.readcnt}</td>
										<td style="text-align: center;">${board.dislike}</td>
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

					<!-- 페이징 처리하는 테이블 -->
					<table class="pagination" style="margin: 0px;">
						<tr align="center" valign="middle">
							<td style="background-color: #f1edf7"><c:if test="${page>1}">
									<a
										href="${cp}/admin/AdminMoimBoard.ad?page=${page-1}&keyword=${keyword}">&lt;</a>
								</c:if> <c:forEach begin="${startPage}" end="${endPage}" step="1"
									var="i">
									<c:choose>
										<c:when test="${page == i}">
											<span class="nowPage">${i}</span>
										</c:when>
										<c:otherwise>
											<a href="${cp}/admin/AdminMoimBoard.ad?page=${i}&keyword=${keyword}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${page<totalPage}">
									<a
										href="${cp}/admin/AdminMoimBoard.ad?page=${page+1}&keyword=${keyword}">&gt;</a>
								</c:if></td>
						</tr>
					</table>

					<!-- 글쓰기, 검색 버튼 -->
					<div style="text-align: center;">
						<div style="width:100%;">
							<div class="search_area"
								style="text-align:center;font-size:20px;margin-top:40px;">
								<input type="search" placeholder=" 2 ~ 10글자" id="q" name="q">
								<input type="button" value="검색" onclick="search()">
							</div>
						</div>
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
	<input type="hidden" id="checkKingId">
</body>
<script>
	let cp = "${pageContext.request.contextPath}"
</script>
<script>
	let page = "${page}"
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
<script>
	function search() {
		let q = document.getElementById("q");
		if (q.value.length > 10 || q.value.length < 2) {
			alert("검색어는 2자 이상 10자 이하로 입력해 주세요!")
			q.focus();
			return false;
		}
		location.href = "${cp}/moim/AdMoim.mo?keyword=" + q.value
	}
</script>
</html>