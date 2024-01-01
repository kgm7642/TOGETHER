<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Formula by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>홍보 게시글 작성</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
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
										<h1>홍보 글쓰기</h1>
									</header>
									<form action="${cp}/moim/AdMoimWriteOk.mo" onsubmit="return sendit()" method="post">
										<input type="hidden" name="page" value="${page}">
										<div style="width:100%;margin:20px auto;text-align:center;">
											<div style="width:15%;display:inline-block;color:black;">모임 선택	</div>
											<c:choose>
												<c:when test="${MyMoimList.size()>0 and MyMoimList != null }">
													<select name = "moimselect" style="width:80%;display:inline-block;border-color:black;">
														<c:forEach var="MyMoimList" items="${MyMoimList}">
															<option value = "${MyMoimList.moimnum}" selected>${MyMoimList.moimname}</option>
														</c:forEach>
													</select>
												</c:when>
												<c:otherwise>
													<select name = "moimselect" style="width:80%;display:inline-block;border-color:black;">
														<option value = "모임 없음" selected>모임 없음</option>
													</select>
												</c:otherwise>
											</c:choose>
										</div><hr>
										<div style="width:100%;margin:20px auto;text-align:center;">
											<div style="width:15%;display:inline-block;color:black;">제목</div>
											<div style="width:80%;display:inline-block;"><input type="text" id="recruittitle" name="recruittitle" style="border-color:black;"></div>
										</div><hr>
										<div style="width:100%;margin:20px auto;text-align:center;">
											<div style="width:15%;display:inline-block;color:black;">작성자</div>
											<div style="width:80%;display:inline-block;"><input type="text" name="userid" style="border-color:black;" value="${session.userid}" readonly></div>
										</div><hr>
										<div style="width:100%;margin:20px auto;text-align:center;">
											<div style="width:15%;display:inline-block;color:black;">내용</div>
											<div style="width:80%;display:inline-block;">
												<textarea
													onkeyup="checkWord(this, 4000)" 
													id="recruitcontents" name="recruitcontents" style="resize:none;maxlength:1000;border-color:black;height:500px;"></textarea>
											</div>
										</div><hr>
										<div style="width:100%;margin:20px auto;text-align:center;">
											<div style="border:2px solid deepskyblue;font-weight:bold;float:right;">
												<input type="submit" value="작성 완료">
											</div>
										</div>
									</form>
								</div>
							</section>
						</div>
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
	<script>
		function checkWord(obj, maxByte) {
			//지금 입력을 한 태그 객체
			let strValue = obj.value;
			
			// 태그 객체의 입력 값 총 길이
			let strLen = strValue.length;
			
			// 전체 바이트 수
			let totalByte = 0;
			
			// 현재 입력된 전체 길이
			let len = 0;
			
			// 입력 값을 하나씩 잘라낼 때 저장될 공간 
			let oneChar = "";
			
			// 잘라냈을 때 문자열 담을 변수
			let str = "";
	
			for (let i = 0; i < strLen; i++) {
				oneChar = strValue.charAt(i);
				if (escape(oneChar).length > 4) {
					totalByte += 2;
				} else {
					totalByte++;
				}
	
				// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
				if (totalByte <= maxByte) {
					len = i + 1;
				}
			}
	
			// 넘어가는 글자를 자르는 조건문
			if (totalByte > maxByte) {
				alert(maxByte + "byte를 초과 입력 할 수 없습니다.");
				str = strValue.substr(0, len);
				obj.value = str;
				checkWord(obj, 4000);
			}
		}
	
	
		//유효성 검사
		function sendit(){
			let recruittitle = document.getElementById("recruittitle");
			let recruitcontents = document.getElementById("recruitcontents");
			let dupTag = document.getElementById("result");
			if(recruittitle.value == ""){
				alert("제목을 입력하세요!");
				recruittitle.focus();
				return false;
			}
			if(recruitcontents.value == ""){
				alert("내용을 입력하세요!");
				recruitcontents.focus();
				return false;
			}
		}
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</html>