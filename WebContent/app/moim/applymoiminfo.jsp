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
		<title>모임 신청 관리</title>
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

				<!-- Wrapper -->
					<div id="wrapper">

						<!-- Main -->
							<section id="main" class="main" style="padding:0px;">
								<div class="inner">
								
									<header class="major">
										<h1>모임 신청 관리</h1>
									</header>
										<div style="width:100%;margin:20px auto;text-align:center;">
											<div>
												<h2>${moimname}</h2>
											</div>
											<c:choose>
												<c:when test="${MoimJoinList.size()>0 and MoimJoinList != null }">
														<c:forEach var="MoimJoinList" items="${MoimJoinList}">
															<table>
																<tr>
																	<th style="width: 20%;">
																		신청자 아이디 : 
																	</th>
																	<td style="width: 20%;text-align:left;">
																		${MoimJoinList.joinuserid}
																	</td>
																	<td style="width: 55%;text-align:right">
																		<a href="${cp}/moim/ApplyMoimInfo_c.mo?moimname=${moimname}&moimjoinnum=${MoimJoinList.moimjoinnum}&moimnum=${moimnum}">상세보기</a>
																	</td>
																</tr>
															</table>
														</c:forEach>
												</c:when>
												<c:otherwise>
													<hr>
													<div style="height:100px;"></div>
													<h1>신청자 명단이 없습니다.</h1>
													<div style="height:200px;"></div>
												</c:otherwise>
											</c:choose>
											<div style="text-align:center;">
												<div style="width:100%;display:inline-block;">
													<div style="font-size:20px;float:right;">
														<input type="button" value="닫기" onclick="window.close();">
													</div>
												</div>
											</div>
										</div>
								</div>
							</section>
					</div>
			</div>
	</body>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script>
		function applyList(){
			location.href = "${pageContext.request.contextPath}/moim/ApplyMoimInfo.mo?moimnum="+${moimnum};
		}
	</script>
</html>