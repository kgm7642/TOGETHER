<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<title>모임 수정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
</head>
   <style>
      #select:hover {color: #15CBE3}
      .label:hover {color: #15CBE3}   
   </style>
<body class="is-preload">
   <c:set var="appkey" value="08d5f583f36357f829d2651be810df95"></c:set>
   <c:set var="cp" value="${pageContext.request.contextPath}"/>
   <c:if test="${session.userid == null}">
      <script>
         alert("로그인 후 이용하세요!");
         location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
      </script>
   </c:if>
   <!-- Header -->
   
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

      
   <!-- Main -->
   
      <div id="wrapper">

                  <!-- Main -->
         <section id="main" class="main">
            <div class="inner">
            <header class="major">
               <h1 style="border-bottom: none;">MODIFY</h1>
            </header>
            <form method="post" name="moimform" action="${cp}/moim/UpdateMoimOk.mo?moimnum=${moim.moimnum}" onsubmit="return sendmoim()">
            <input type="hidden" value="${moim.moimnum}" name="moimnum">   
               <div id="container">
                  <hr>
                  <table>
                     <tr>
                        <td style="width: 49%;">
                           <h2 style="text-align:center;">INFO</h2>
                           <table>
                              <tr>
                                 <td>모임장</td>
                                 <td>
                                    <input type="text" name="userid" value="${moim.userid}" readonly>
                                 </td>
                              </tr>
                              <tr>
                                 <td> 모임 이름 </td>
                                 <td>
                                    <input type="text" name="moimname" value="${moim.moimname}">
                                 </td>
                              </tr>
                              <tr>
                                 <td>분류</td>
                                 <td>
                                    <select name = "moimtype">
                                          <option value = "1" <c:if test="${moim.moimtype == 1}">selected</c:if>>여행</option>
                                           <option value = "2" <c:if test="${moim.moimtype == 2}">selected</c:if>>스터디</option>
                                          <option value = "3" <c:if test="${moim.moimtype == 3}">selected</c:if>>동호회</option>
                                          <option value = "4" <c:if test="${moim.moimtype == 4}">selected</c:if>>취미</option>
                                          <option value = "5" <c:if test="${moim.moimtype == 5}">selected</c:if>>운동</option>
                                          <option value = "6" <c:if test="${moim.moimtype == 6}">selected</c:if>>친구</option>
                                          <option value = "7" <c:if test="${moim.moimtype == 7}">selected</c:if>>취업</option>
                                          <option value = "8" <c:if test="${moim.moimtype == 8}">selected</c:if>>크루</option>
                                          <option value = "9" <c:if test="${moim.moimtype == 9}">selected</c:if>>연애</option>
                                          <option value = "10" <c:if test="${moim.moimtype == 10}">selected</c:if>>상담</option>
                                        </select>
                                 </td>   
                              </tr>
                              <tr>
                                 <td>경비</td>
                                 <td>
                                    <input type="text" name="moimbudget" value="${moim.moimbudget}">
                                 </td>
                              </tr>
                              <tr>
                                 <td>출발날짜</td>
                                 <td>
                                    <input type="date" name="moimstartdate" value = ${fn:split(moim.startdate," ")[0]}>
                                 </td>
                              </tr>
                              <tr>
                                 <td>끝날짜</td>
                                 <td>
                                    <input type="date" name="moimenddate" value =${fn:split(moim.enddate," ")[0]}>
                                 </td>
                              </tr>
                           </table>
                        </td>
                        <td style="width: 49%;">
                           <h2 style="text-align:center; margin-bottom:0px;">WHERE</h2>
                           <div style ="text-align: right;">
                           <a style="width:35%; height: 50px; margin-top:20px;  margin-bottom:20px; font-size:0.8em; line-height: 3.0em; " 
                           href = "${cp}/moim/UpdatePlace.mo?moimnum=${moim.moimnum}" class="button primary fit">목적지 수정하기</a>
                           </div>
                           <div id="staticMap" style="width: 100%; height: 350px;"></div>
                           <strong style="text-align: center; display: block;">${place.placename}</strong>
                        </td>
                     </tr>
                  </table>
                  <div style ="text-align: center;">
                  <input type="submit" class="button primary fit" value="수정 완료" style="width:30%;">
                  </div>
                  <hr>
               </div>
            </form>
         </div>
      </section>
      </div>

   <!-- Footer -->
   
   <section id="footer">
      <div class="wrapper style3">
         <div class="inner">
            <div>
            💖
               <div class="contact-icons">
                  <ul>
                     <li><a href="#" class="icon solid fa-envelope"><span>information@untitled.tld</span></a></li>
                     <li><a href="#" class="icon brands fa-twitter"><span>@untitled-tld</span></a></li>
                     <li><a href="#" class="icon brands fa-facebook-f"><span>facebook.com/untitled-tld</span></a></li>
                     <li><a href="#" class="icon brands fa-linkedin-in"><span>linkedin.com/untitled-tld</span></a></li>
                  </ul>
                  <ul>
                     <li><a href="#" class="icon solid fa-phone"><span>(000)
                              000-0000</span></a></li>
                     <li>
                        <div class="icon solid fa-map-marker-alt">
                           <address>
                              Untitled Incorporated<br /> 1234 Fictional Avenue Suite 5432<br />
                              Nashville, TN 00000-0000<br /> United States
                           </address>
                        </div>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="copyright">&copy; Untitled Incorporated, All rights
            reserved. Lorem ipsum dolor sit amet nullam.</div>
      </div>
   </section>
   </div>
</body>

   <!-- Scripts -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey}&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   
   let placelat = "${place.placelat}"
   let placelon = "${place.placelon}"
   // 이미지 지도에서 마커가 표시될 위치입니다 
   var markerPosition  = new kakao.maps.LatLng(placelat, placelon); 
   
   // 이미지 지도에 표시할 마커입니다
   // 이미지 지도에 표시할 마커는 Object 형태입니다
   var marker = {
       position: markerPosition
   };
   
   var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
       staticMapOption = { 
           center: new kakao.maps.LatLng(placelat,placelon), // 이미지 지도의 중심좌표
           level: 3, // 이미지 지도의 확대 레벨
           marker: marker // 이미지 지도에 표시할 마커 
       };    
   
   // 이미지 지도를 생성합니다
   var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
   </script>
   <script>
   function sendmoim(){
		let moimform = document.moimform;
		let moimname = moimform.moimname;
		let moimbudget = moimform.moimbudget;
		let moimstartdate = moimform.moimstartdate;
		let moimenddate = moimform.moimenddate;
		
		// 오늘 날짜
		let today = new Date();   
		let year = today.getFullYear(); 	// 년도
		let month = today.getMonth() + 1;  	// 월
		let date = today.getDate();  		// 날짜
		
		let startYear = moimstartdate.value.substr(0, 4); // 시작날짜 연도
		let startMonth = moimstartdate.value.substr(5, 2); // 시작날짜 월
		let startDay = moimstartdate.value.substr(8, 2); // 시작날짜 일

		let endYear = moimenddate.value.substr(0, 4); // 끝날짜 연도
		let endMonth = moimenddate.value.substr(5, 2); // 끝날짜 월
		let endDay = moimenddate.value.substr(8, 2); // 끝날짜 일
		
		let todate = new Date(year, month, date);
		let startdate = new Date(startYear, startMonth, startDay);
		let enddate = new Date(endYear, endMonth, endDay);
		
		if(moimname.value == ""){
			alert("모임 이름을 입력해주세요.");
			moimname.focus();
			return false;
		}
		if(moimbudget.value == ""){
			alert("모임 예산을 입력해주세요.");
			moimbudget.focus();
			return false;
		}
		if(moimbudget.value.length >= 11){
			alert("예산은 10,000,000,000원을 초과할 수 없습니다.");
			moimbudget.focus();
			return false;
		}
		if(moimstartdate.value == ""){
			alert("모임이 시작하는 날짜를 설정해주세요.");
			return false;
		}
		if(moimenddate.value == ""){
			alert("모임이 끝나는 날짜를 설정해주세요.");
			return false;
		}
		if(todate > startdate){
			alert("모임이 시작하는 날짜를 다시 확인해주세요.");
			return false;
		}
		if(todate > enddate){
			alert("모임이 끝나는 날짜를 다시 확인해주세요.");
			return false;
		}
		if(startdate > enddate){
			alert("모임 시작날짜와 모임이 끝나는 날짜를 다시 확인해주세요.");
			return false;
		}
		return true;
	}
   </script>
</html>