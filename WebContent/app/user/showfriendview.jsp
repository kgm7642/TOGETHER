<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>친구 정보 확인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:if test="${not empty param.login}">
		<script>
			alert("로그인 실패! 다시 시도해 주세요...");
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

	<!-- Banner -->
      <section id="banner" data-video="${cp}/images/banner">
         <div class="inner">
            <header>
               <h1>FIND FRIEND LIST</h1>
            </header>
         </div>
         <a href="#wrapper" class="more">Learn More</a>
         <video src="${cp}/images/banner.mp4" muted autoplay loop playsinline></video>
      </section>

      <!-- Wrapper -->
      <div id="wrapper">
      <section id="main" class="main">
      	<div class="inner">

         <form name="findFriendForm"
            action="${pageContext.request.contextPath}/user/UserPlusFriendOK.us?userid=${session.userid}&followid=${user.userid}"
            method="get" onsubmit="return sendit();">
            <input type="hidden" name="followid" value="${user.userid}">
            <table>
               <tr style="text-align: center;">
                  <td>이 름</td>
                  <td>전 화 번 호</td>
                  <td>이 메 일</td>
               </tr>
               <tr style="text-align: center;">
                  <td>${user.username}</td>
                  <td>${user.userphone}</td>
                  <td>${user.useremail}</td>
                  <td><input type="submit" value="ADD"></td>
               </tr>
            </table>

         </form>
			<!-- CTA -->
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
<!-- <script>
function checkId(){

	let resultTag = document.getElementById("result");
	let xhr = new XMLHttpRequest();
	//통신할 곳과의 연결 통로 열기
	xhr.open("GET",cp+"/user/CheckIdOk.us?userid="+userid,true);
	
	//xhr의 상태가 변할 때 호출될 함수 미리 설정
	xhr.onreadystatechange = function(){
		if(xhr.readyState == XMLHttpRequest.DONE){
			if(xhr.status == 200 || xhr.status == 201){
				let txt = xhr.responseText;
				//문자열.trim() : 문자열의 양쪽에 있는 공백 제거
				txt = txt.trim();
				
				if(txt == "O"){
					//중복체크 통과
					resultTag.innerHTML = "사용할 수 있는 아이디입니다!";
				}else{
					//중복체크 실패
					resultTag.innerHTML = "이미 존재하는 아이디입니다!";
				}
			}
			
		}
	}
	//통신하기
	xhr.send();
}
</script>
 -->
</html>