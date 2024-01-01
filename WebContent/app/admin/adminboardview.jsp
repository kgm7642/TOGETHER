<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 상세보기 [admin]</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<title>Together</title>
</head>
<body>
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:set var="cp" value="${pageContext.request.contextPath}" />
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


		<!-- 타이틀과 글 개수 띄워주는 테이블 -->
		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<table class="title">
						<tr align="center" valign="middle">
							<td><h1>${board.boardtitle}</h1></td>
						</tr>
					</table>

					<form method="post" name="boardForm">
						<!-- 게시글 작성하는 인풋들 배치 테이블 -->
						<table class="board_area">
							<tr>
								<th align="center" style="text-align: center; width: 20%;">
									작성자
								</th>
								<td>
									<input type="hidden" name="boardtitle" size="65"
										readonly value="${board.boardtitle}"> ${board.userid}
								</td>
							</tr>
							<tr>
								<th align="center" align="center"
									style="text-align: center; width: 20%;">카테고리</th>
								<td><c:choose>
										<c:when test="${board.category == 1}">여행</c:when>
										<c:when test="${board.category == 2}">스터디</c:when>
										<c:when test="${board.category == 3}">동호회</c:when>
										<c:when test="${board.category == 4}">취미</c:when>
										<c:when test="${board.category == 5}">운동</c:when>
										<c:when test="${board.category == 6}">친구</c:when>
										<c:when test="${board.category == 7}">취업</c:when>
										<c:when test="${board.category == 8}">크루</c:when>
										<c:when test="${board.category == 9}">연애</c:when>
										<c:when test="${board.category == 10}">상담</c:when>
									</c:choose></td>
							</tr>
							<tr>
								<th align="center" align="center"
									style="text-align: center; width: 20%;">내 용</th>
								<td><textarea name="contents"
										style="height: 700px; resize: none;" readonly>${board.contents}</textarea>
								</td>
							</tr>
						</table>
						<div style="text-align:center;width:100%;">
							<a class="button small" style="float:left;display:inline-block;"
								href="${cp}/admin/AdminBoardList.ad?page=${param.page == null?1:param.page}">목록</a>
							<a class="button small" style="float:right;display:inline-block;"
								href="javascript:document.removeForm.submit()">삭제</a>
							<div style="float:right;display:inline-block;margin-right:10px;">
								🚨신고 횟수🚨 : ${board.dislike} 회
							</div>
						</div>
					</form>
					<form name="removeForm" action="${cp}/admin/AdminRemoveBoard.ad"
						method="get">
						<input type="hidden" value="${board.boardnum}" name="boardnum">
					</form>
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
			<p class="copyright">&copy; TOGETHER. All rights reserved.</p>
		</footer>
		
	</div>
</body>
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
</html>




