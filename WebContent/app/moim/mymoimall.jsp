<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
   <head>
      <title>나의 모임</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
      <style>
      table{
         border-collapse: initial;
         width: 100%;
          border: 1px solid #8e8e8e;
          table-layout: fixed;
		text-align:center;
      }
      
      table.pagination{
         border: 0px solid;
         background-color: #ffffff;
      }
      .todaymoim{
         background-color: #7fa4e5;
         color: black;
         cursor:pointer;
      }
      .ingmoim{
        background-color: #c6e0eb;  
		color: black; 
		cursor:pointer;  	
      }
      .willmoim{
      	background-color: #fdf8b4;  
		color: black; 
		cursor:pointer;
      }
      .endmoim{
         background-color: #c4c9d3;
         color: black;
         cursor:pointer;
      }
      td{
	overflow:hidden;
	white-space : nowrap;
	text-overflow: ellipsis;
}
   	  </style>
   </head>
   <body class="is-preload">
   <c:set var="cp" value="${pageContext.request.contextPath}"/>
   <c:if test="${session.userid == null}">
      <script>
         alert("로그인 후 이용하세요!");
         location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
      </script>
   </c:if>
   <c:set var = "myMoimAll" value="${requestScope.myMoimAll}"/>
   <c:set var = "page" value="${requestScope.page}"/>
   <c:set var="startPage" value="${requestScope.startPage }"/>
   <c:set var="endPage" value="${requestScope.endPage }"/>
   <c:set var="totalCnt" value="${requestScope.totalCnt }"/>
   <c:set var="totalPage" value="${requestScope.totalPage }"/>
   <jsp:useBean id="now" class="java.util.Date" />
   <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
   
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

			<section id="banner" data-video="${cp}/images/banner">
               <div class="inner">
                  <header>
                     <h1>MY MOIM</h1>
                  </header>
               </div>
               <c:if test="${session.userid != null}">
                  <a href="#wrapper" class="more">Learn More</a>
               </c:if>
               <video src="${cp}/images/banner.mp4" muted autoplay loop playsinline></video>
            </section>

            <!-- Wrapper -->
               <div id="wrapper">

                  <!-- Main -->
                     <section id="main" class="main">
                        <div class="inner">
                           <br><div style="margin:10px;">
                           		<span style="font-size:2em;"><strong>&lt 참여중인 모든 모임 &gt</strong></span>
                           		<span style="float:right;">
                           			 오늘 시작 : <span style="color:#7fa4e5;font-size:2em;">■ </span>
                           			 진행중 : <span style="color:#c6e0eb;font-size:2em;">■ </span>
                           			 진행 예정  : <span style="color:#fdf8b4;font-size:2em;">■ </span>
                           			 종료 : <span style="color:#c4c9d3;font-size:2em;">■ </span>
                           		</span>
                           </div>
                           <table class="mymoimlist">
                              <tr>
                                 <td width="15%">번호</td>
                                 <td width="25%">모임 이름</td>
                                 <td width="15%">모임장</td>
                                 <td width="15%">시작일</td>
                                 <td width="15%">종료일</td>
                                 <td width="15%">진행 여부</td>
                              </tr>
                              <c:choose>
                                <c:when test="${myMoimList2.size()>0 and myMoimList2 != null }">
                                    <c:forEach var="moim" items="${myMoimList2}">
                                       <c:choose>
                                       <c:when test="${moim.startdate == today}">
                                          <tr class="todaymoim" onmouseover="this.style.background='#eeeeeb'" onClick="location.href='${cp}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}&page=${page}'" onmouseout="this.style.background='#7fa4e5'">
                                            <td class ="mytable">${moim.moimnum}</td>   
                                            <td class ="mytable">${moim.moimname}</td>
                                            <td class ="mytable">${moim.userid}</td>
                                            <td class ="mytable">${moim.startdate}</td>
                                            <td class ="mytable"> ${moim.enddate}</td>
                                             <td>오늘 시작</td>
                                          </tr>         
                                       </c:when>
                                       <c:when test="${moim.startdate < today && moim.enddate > today}">
                                          <tr class="ingmoim" onmouseover="this.style.background='#eeeeeb'" onClick="location.href='${cp}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}&page=${page}'" onmouseout="this.style.background='#c6e0eb'">
                                             <td class ="mytable">${moim.moimnum}</td>   
                                             <td class ="mytable">${moim.moimname}</td>
                                             <td class ="mytable">${moim.userid}</td>
                                             <td class ="mytable">${moim.startdate}</td>
                                             <td class ="mytable"> ${moim.enddate}</td>
                                             <td>진행중</td>
                                          </tr>         
                                        </c:when>
                                        <c:when test="${moim.startdate > today}">
                                        	<tr class="willmoim" onmouseover="this.style.background='#eeeeeb'" onClick="location.href='${cp}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}&page=${page}'" onmouseout="this.style.background='#fdf8b4'">
                                             <td class ="mytable">${moim.moimnum}</td>   
                                             <td class ="mytable">${moim.moimname}</td>
                                             <td class ="mytable">${moim.userid}</td>
                                             <td class ="mytable">${moim.startdate}</td>
                                             <td class ="mytable"> ${moim.enddate}</td>
                                             <td>진행 예정</td>
                                          </tr>
                                        </c:when>
                                        <c:otherwise>
                                           <tr class="endmoim" onmouseover="this.style.background='#eeeeeb'" onClick="location.href='${cp}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}&page=${page}'" onmouseout="this.style.background='#c4c9d3'">
                                             <td class ="mytable" style="text-decoration:line-through">${moim.moimnum}</td>   
                                             <td class ="mytable" style="text-decoration:line-through">${moim.moimname}</td>
                                             <td class ="mytable" style="text-decoration:line-through">${moim.userid}</td>
                                             <td class ="mytable" style="text-decoration:line-through">${moim.startdate}</td>
                                             <td class ="mytable" style="text-decoration:line-through"> ${moim.enddate}</td>
                                             <td style="text-decoration:line-through">종료</td>
                                          </tr>
                                        </c:otherwise>
                                        </c:choose>   
                                    </c:forEach>
                                 </c:when>
                                 <c:otherwise>
                                    <tr>
                                       <td colspan="5" style="text-align: center; font-size: 20px">
                                             모임이 없습니다.
                                       </td>
                                    </tr>
                                 </c:otherwise>
                              </c:choose>
                           </table>
                           <!-- 페이징 처리 -->
                           <!-- 페이징 처리하는 테이블 -->
                           <table class="pagination">
                              <tr align="center" valign="middle">
                                 <td>
                                    <c:if test="${page>1}">
                                       <a href="${cp}/moim/MyMoimAll.mo?page=${page-1}">&lt;</a>
                                    </c:if>
                                    <c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
                                       <c:choose>
                                          <c:when test="${page == i}">
                                             <span class="nowPage">${i}</span>
                                          </c:when>
                                          <c:otherwise>
                                             <a href="${cp}/moim/MyMoimAll.mo?page=${i}">${i}</a>
                                          </c:otherwise>
                                       </c:choose>
                                    </c:forEach>
                                    <c:if test="${page<totalPage}">
                                       <a href="${cp}/moim/MyMoimAll.mo?page=${page+1}">&gt;</a>
                                    </c:if>
                                 </td>
                              </tr>
                           </table>
                           <a href="${cp}/moim/CreatePlace.mo" class="button primary fit" style ="width:30%; display: inline-block;"> 모임 생성하러 가기</a>
                           <a href = "${cp}/moim/MyMoim.mo" class="button fit" style="width:30%; display: inline-block; float: right;">방장인 모임 보기</a>
                           <hr> 
                        </div>
                     </section>

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
   <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</html>