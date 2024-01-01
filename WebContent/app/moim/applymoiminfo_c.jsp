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

				<!-- Header -->
					<header id="header">
					</header>

				<!-- Wrapper -->
					<div id="wrapper">

						<!-- Main -->
							<section id="main" class="main">
								<div class="inner">
								
									<header class="major">
										<h1>모임 신청 관리</h1>
									</header>
										<div style="width:100%;margin:20px auto;text-align:center;">
											<table>
												<tr>
													<th style="width: 20%;">
														모임 이름 :  
													</th>
													<td style="width: 79%;text-align:left;">
														${moimname}
													</td>
												</tr>
												<tr>
													<th style="width: 20%;">
														신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  :
													</th>
													<td style="width: 79%;text-align:left;">
														${moimjoin.joinuserid}
													</td>
												</tr>
												<tr>
													<th style="width: 20%;">
														내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
													</th>
													<td style="width: 79%;text-align:left;">
														${moimjoin.joincontents}
													</td>
												</tr>
											</table>
											<div style="text-align:center;">
												<div style="width:100%;display:inline-block;">
													<div style="font-size:20px;float:right;">
														<input type="button" value="거절" onclick="noApply();">&nbsp;
													</div>
													<div style="font-size:20px;float:right;">
														<input type="button" value="수락" onclick="yesApply();">&nbsp;
													</div>
													<div style="font-size:20px;float:left;">
														<input type="button" value="신청자 명단" onclick="applyList();">
													</div>
												</div>
											</div>
										</div>
								</div>
							</section>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Untitled. All rights reserved.</p>
					</footer>
			</div>
	</body>
	<script>
		
		// 가입 거절
		function noApply(){
			location.href = "${pageContext.request.contextPath}/moim/ApplyMoimJoin.mo?apply=false&moimnum="+${moimjoin.moimnum}+"&joinuserid=${moimjoin.joinuserid}";
			// 엄연히 말하자면 ajax코드가 아니고, 해당 페이지 새로고침 기능임.
			opener.document.location.reload();
		}
		// 가입 수락
		function yesApply(){
			location.href = "${pageContext.request.contextPath}/moim/ApplyMoimJoin.mo?apply=true&moimnum="+${moimjoin.moimnum}+"&joinuserid=${moimjoin.joinuserid}";
			// 엄연히 말하자면 ajax코드가 아니고, 해당 페이지 새로고침 기능임.
			opener.document.location.reload();
		}	
		
		function applyList(){
			location.href = "${pageContext.request.contextPath}/moim/ApplyMoimInfo.mo?moimnum=${moimnum}";
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