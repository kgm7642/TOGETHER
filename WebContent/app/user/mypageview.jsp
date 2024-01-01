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
<title>개인 정보 수정</title>
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

         <form method="post" name="joinForm"  onsubmit="return sendit()"
            action="${pageContext.request.contextPath}/user/UserMyInfoUpdateOk.us">
            <table>
               <tr>
                  <th><label for="userid">유저아이디</label></th>
                  <th><input type="text" name="userid"
                     value="${session.userid}" readonly></th>
               </tr>
               <tr>
                  <th><label for="username">유저이름</label></th>
                  <th><input type="text" name="username"
                     value="${session.username}"></th>
               </tr>
               <tr>
                  <th><label for="userpw">비밀번호</label></th>
                  <th><input type="password" name="userpw"
                     value="${session.userpw}"></th>
               </tr>
               <tr class="zipcode_area">
					<th style="padding:12px;">우편번호</th>
					<td style="padding:12px;"><input readonly name="zipcode" type="text"
						id="sample6_postcode" class="form-control" style="width: 75%; float: left" placeholder="우편번호 찾기 버튼을 눌러주세요"> 
						<input type="button" onclick="sample6_execDaumPostcode()"
						value="우편번호 찾기" class="btn btn-outline-primary" style="float: right"></td>
				</tr>
				<tr class="addr_area">
					<th style="padding:12px;">주소</th>
					<td style="padding:12px;"><input readonly name="useraddr" type="text"
						id="sample6_address"></td>
				</tr>
				<tr>
					<th style="padding:12px;">상세주소</th>
					<td style="padding:12px;"><input name="useraddrd" type="text"
						id="sample6_detailAddress"></td>
				</tr>
				<tr>
					<th style="padding:12px;">참고항목</th>
					<td style="padding:12px;"><input readonly name="addretc" type="text"
						id="sample6_extraAddress"></td>
				</tr>
               <tr>
                  <th><label for="userphone">전화번호</label></th>
                  <th><input type="text" name="userphone"
                     value="${session.userphone}"></th>
               </tr>
               <tr>
                  <th><label for="useremail">이메일</label></th>
                  <th><input type="text" name="useremail"
                     value="${session.useremail}"></th>
               </tr>
            </table>
            	<div style="margin-right:300px;margin-top:30px;">
                  <input type="submit" class="button primary" value="수정하기" style="float:right;">
                </div>
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

	
	function sendit(){
		   let joinForm = document.joinForm;
		   let resultIdTag = document.getElementById("ResultId");
		   let nameTag = joinForm.username;
		   if(nameTag.value == ""){
		      alert("이름을 입력해주세요.");
		      nameTag.focus();
		      return false;
		   }
		   let pwTag = joinForm.userpw;
		   if(pwTag.value == ""){
		      alert("비밀번호를 입력해주세요.");
		      pwTag.focus();
		      return false;
		   }
		   //정규식 - https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions
		   let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
		   if(!reg.test(pwTag.value)){
		      alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다.");
		      pwTag.focus();
		      return false;
		   }else if(/(\w)\1\1\1/.test(pwTag.value)){
		      alert("같은 문자를 4번 이상 사용하실 수 없습니다.")
		      pwTag.focus();
		      return false;
		   }else if(pwTag.value.search(/\s/) != -1){
		      alert("비밀번호는 공백을 포함할 수 없습니다.");
		      pwTag.focus()
		      return false;
		   }
		   
		   let userphoneTag = joinForm.userphone;		   
		   var phone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;   
		   if(!phone.test(userphoneTag.value)){
			   alert("휴대폰 번호 형식이 잘못되었습니다.");
			   userphoneTag.focus();
			   return false;
		   }
		   
		   let emailTag = joinForm.useremail
		   var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		   if(!email.test(emailTag.value)) { 
			   alert("이메일 형식이 잘못되었습니다.");
			   emailTag.focus();
		       return false;        
		   }
		   return true;
		}
</script>
</html>