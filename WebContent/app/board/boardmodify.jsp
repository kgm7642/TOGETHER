<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게시글 수정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<style>
#wrapper {
	margin-left: auto;
	margin-right: auto;
}

table, tr, th, td {
	margin-left: auto;
	margin-right: auto;
}
.finput{
		position:absolute;
		left:-9999px;
		width:1px;
		height:1px;
		padding:0;
		margin:-1px;
	}
</style>
<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location
					.replace("${pageContext.request.contextPath}/index/Index.ix");
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

		<!-- Banner -->

		<!-- Wrapper -->

		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<form method="post" name="boardForm"
						action="${cp}/board/BoardModifyOk.bo"
						enctype="multipart/form-data">
						<input type="hidden" value="${board.boardnum}" name="boardnum">
						<input type="hidden" value="${board.userid}" name="userid">
						<!-- 게시글 작성하는 인풋들 배치 테이블 -->
						<table border="1" style="border-collapse: collapse;">
							<tr height="30px">
								<th align="center" width="150px">수정 할 제목</th>
								<td><input type="text" value="${board.boardtitle}"
									name="boardtitle"></td>
							</tr>
							<tr height="30px">
								<th align="center" width="150px">글쓴이</th>
								<td>${board.userid}</td>
							</tr>
							<tr style="width: 100%; margin: 20px auto; text-align: center;">
								<th align="center" width="150px">유형선택</th>
								<td><select name="category" style="width: 100%">
										<option value="1" selected>여행</option>
										<option value="2">스터디</option>
										<option value="3">동호회</option>
										<option value="4">취미</option>
										<option value="5">운동</option>
										<option value="6">친구</option>
										<option value="7">취업</option>
										<option value="8">크루</option>
								</select></td>
							</tr>
							<tr height="300px">
								<th align="center" width="150px">내 용</th>
								<td><textarea name="contents"
										style="height: 250px; resize: none;">${board.contents}</textarea>
								</td>
							</tr>
							<c:forEach var="i" begin="0" end="1">
								<tr>
									<th>첨부파일${i+1}</th>
									<td>
										<c:choose>
											<%-- files : 원래 게시글에 업로드 되어있는 파일 DTO들의 리스트 --%>
											<c:when test="${i<files.size()}">
												<!-- 원래 업로드 되어있던 파일의 정보를 보여주는 쪽 							원래 올라와있던 파일명-->
												<span class="filename" name="filename${i+1}" id="file${i+1}">${files[i].orgname}</span>
												<!-- 새롭게 사용자가 올린 파일의 이름을 자바단으로 보내주기 위한 인풋/ 파일을 새롭게 올리지 않았다면 기존의 파일명이 그대로 날라간다.
													만약 새로운 파일을 업로드 했다면, 업로드된 파일명이 value로 날라간다.
												 -->
												<input type="hidden" name="filename" value="${files[i].orgname}">
											</c:when>
											<c:otherwise>
												<!-- 단순하게 파일 업로드 할 수 있도록 만들어주는 쪽 -->
												<span class="filename" name="filename${i+1}" id="file${i+1}"></span>
												<!-- 새롭게 업로드된 파일이 있다면, 그 파일의 이름이 날라간다. -->
												<input type="hidden" name="filename">
											</c:otherwise>
										</c:choose>
										<!-- 첨부하기 버튼은 파일이 존재했든 안했든 무조건 보여줘야 하기 때문에 choose문 바깥에서 작성
											라벨을 클릭해서 파일을 업로드 하고자 하면, 아래에 있는 숨겨진 .finput 태그가 클릭되고
											파일 데이터가 그 인풋에 담기게 된다. 폼을 제출하게 되면 그 숨겨진 파일데이터가 자바단으로 날라감.
										-->
										<label for="fileInput${i+1}" class="button">첨부하기</label>
										<!--
											accept = ".jpg, .png, .gif" 
											accept = "image/*"
										-->
										<input type="file" class="finput" id="fileInput${i+1}" name="file${i+1}">
									</td>							
								</tr>
							</c:forEach>
						</table>
						<br>
						<table class="btn_area">
							<tr align="right" valign="middle">
								<td><a class="button primary" href="javascript:sendit()">수정완료</a>&nbsp;&nbsp;
									<a class="button primary"
									href="${cp}/board/BoardList.bo?page=${param.page == null?1:param.page}">목록</a>
								</td>
							</tr>
						</table>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	const sendit = function() {
		let boardForm = document.boardForm;
		let boardtitle = boardForm.boardtitle;
		if (boardtitle.value == "") {
			alert("게시글 제목을 작성하세요!")
			boardtitle.focus();
			return false;
		}
		let contents = boardForm.contents;
		if (contents.value == "") {
			alert("게시글 내용을 작성하세요!");
			contents.focus();
			return false;
		}
		boardForm.submit();
	}
	
	$(document).ready(function() {
		$('.finput').change(function(e) {
			$(this).prev().prev().prev().text(e.target.files[0].name);
			$(this).prev().prev().val(e.target.files[0].name);
		})
	})
</script>
</html>