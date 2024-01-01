<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>개인 정보 수정 - 비밀번호 확인</title>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
table {
   border-collapse: initial;
   width: 70%;
   text-align: center;
   margin: 0 auto;
}

.align-center {
   text-align: center;
}
</style>
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
      <section id="banner"
         data-video="${pageContext.request.contextPath}/images/banner">
         <div class="inner">
            <header>
               <h1>MyPage</h1>
            </header>
         </div>
         <a href="#wrapper" class="more">Learn More</a>
         <video src="${pageContext.request.contextPath}/images/banner.mp4"
            muted autoplay loop playsinline></video>
      </section>


      <!-- Wrapper -->
      <div id="wrapper">

         <form method="post" name="joinForm"
            action="${pageContext.request.contextPath}/user/UserByeBye.us" onsubmit="return sendPW()">
            <table>
               <tr>
                  <th><label for="userpw"><span style="font-size:1.5em;"><strong>비밀번호 확인</strong></span></label></th>
                  <td><input type="password" name="userpw"></td>
                  <td><input type="submit" value="탈퇴하기" class="button primary" style="width:150px;"></td>
               </tr>
            </table>
         </form>


         <!-- CTA -->

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
      </div>
      </div>
</body>
<script> let cp = "${pageContext.request.contextPath}"</script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/app/user/user.js"></script>
<script>
	function sendPW(){
		if(confirm("정말 탈퇴하시겠습니까?")==false){
			return false;
		}
		let joinForm = document.joinForm;
		let pwTag = joinForm.userpw;
		if(pwTag.value == ""){
			alert("비밀번호를 입력해주세요.");
			pwTag.focus();
			return false;
		}
		if(pwTag.value != "${session.userpw}"){
			alert("비밀번호를 확인해주세요.")
			pwTag.focus();
			return false;
		}
		return true;
	}
</script>
</html>