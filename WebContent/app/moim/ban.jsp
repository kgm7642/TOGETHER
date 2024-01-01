<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>강퇴 멤버 관리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<style>
	table, tr, th, td {
		text-align: center;
		align: center;
		valign: middle;
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
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
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

		<div class="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<header class="major">
						<h1 class="home">멤버 관리</h1>
					</header>
					<hr>
					<!-- 게시글 띄우는 테이블 -->
					<div class="table-wrapper" style="width: 70%; margin-left: auto; margin-right: auto;">
						<table style="table-layout: fixed; border-spacing: 2px;">
							<thead>
								<tr style="text-align: center;">
									<td width="20%"><strong>아이디</strong></td>
									<td width="20%"><strong>이름</strong></td>
									<td width="20%"><strong>전화번호</strong></td>
									<td width="25%"><strong>이메일</strong></td>
									<td width="15%"><strong>강퇴</strong></td>
								</tr>
							</thead>
							<tbody>
								<c:if test="${session.userid == moim.userid}">
									<table>
										<c:forEach items="${members}" var="member">
											<tr style="text-align: center;">
												<td width="20%">${member.userid}</td>
												<td width="20%">${member.username}</td>
												<td width="20%">${member.userphone}</td>
												<td width="25%">${member.useremail}</td>
												<c:choose>
													<c:when test="${member.userid == moim.userid}">
														<td>
															<span style="font-size:2em;">👑</span>
														</td>
													</c:when>
													<c:otherwise>
														<td width="15"><a class="fire button primary"
															href="${member.userid}&${moim.moimnum}">쫒아내기</a></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</table>
								</c:if>
								<c:if test="${session.userid != moim.userid}">
									<tr>
										<td colspan="5">확인할 수 없습니다</td>
									</tr>
								</c:if>
							</tbody>

						</table>

					</div>
					<div style="text-align: center;">
					<a
						href="${pageContext.request.contextPath}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}"
						class="button primary">모임정보로 돌아가기</a>
					</div>
				</div>
			</section>
		</div>
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
	let frm = $("#pageForm")
	let searchForm = $("#searchForm");

	$(".changePage").on("click", function(e) {
		//a태그의 동작을 막기
		e.preventDefault();
		//해당 form 안에서 name이 pageNum인 태그 찾고 그 value를 바꿔준다.
		//$(this) : 현재 눌린 a태그
		//.attr("href") : 그 태그의 href속성에 써져있는것
		frm.find("input[name='pageNum']").val($(this).attr("href"));
		frm.submit();
	})

	$(".get").on(
			"click",
			function(e) {
				e.preventDefault();
				let joindetail = window.open("/moim/joinDetail/"
						+ $(this).attr("href"), "joinDetail",
						"width=1000,height=1000,left=0,right=0")
				//123번 게시글을 누른 경우
				//<input type='hidden' name='boardnum' value='123'>
				/*       frm.append("<input type='hidden' name='moimjoinnum' value='"+$(this).attr("href")+"'>")
				 frm.attr("action","/moim/joinDetail") */
				/* frm.submit(); */
			})

	result = "${result}";
	$(document).ready(function() {
		if (result == '' || history.state) {
			return;
		}
		if (parseInt(result) > 0) {
			alert("게시글 " + parseInt(result) + "번이 등록되었습니다.");
		}
		history.replaceState({}, null, null);
	})

	$(".fire").on(
			"click",
			function(e) {
				e.preventDefault();
				let splitHref = $(this).attr("href").split("&")
				let joindetail = window.open(
						"${pageContext.request.contextPath}/moim/FireMessage.mo?userid="
								+ splitHref[0] + "&moimnum=" + splitHref[1],
						"FireMessage", "width=1000,height=1000,left=0,right=0")

			})
</script>

</html>