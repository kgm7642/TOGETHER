<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 강퇴 메세지 작성</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
	
</head>
<body class="is-preload">
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<div id="page-wrapper">

		<!-- Header -->

		<header id="header">
			<a href="#" class="logo"><span>together
					${session.userid}</span></a>
		</header>

		<!-- Main -->

		<div id="main">
			<section id="main" class="main">
				<div class="wrapper">

					<div class="inner">
						<header class="major">
							<h1 class="home">방출사유</h1>
						</header>
						<div class="col-12">
							<form method="post"
								action="${pageContext.request.contextPath}/moim/FireMessageOk.mo">
								<input type="hidden" value="${moim}" name="moimnum">
								<hr>
								<div class="col-12">
									<h2>내용</h2>
									<textarea name="message" rows="10" style="resize: none;"></textarea>
								</div>
								<hr>
								<div class="col-12">
									<h2>아이디</h2>
									<input name="userid" type="text" value="${fire}" readonly>
								</div>
								<hr>
								<div class="col-12" style="text-align: center;">
									<input type="button" value="보내기" class="primary large send">
								</div>
							</form>
							<hr>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>

<!-- Scripts -->

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/reply.js"></script>
<script>
	$(".send")
			.on(
					"click",
					function(e) {
						let moimnum = $("input[name='moimnum']").val();
						let userid = $("input[name='userid']").val();
						let message = $("textarea[name='message']").val();
						console.log(moimnum);
						console.log(userid);
						console.log(message);

						let data = {
							moimnum : moimnum,
							userid : userid,
							message : message
						}
						$
								.ajax({
									url : "${pageContext.request.contextPath}/moim/FireMessageOk.mo?moimnum="
											+ moimnum
											+ "&userid="
											+ userid
											+ "&message=" + message,
									type : "POST",
									data : JSON.stringify(data),
									contentType : "application/json",
									success : function(success) {
										if (success) {
											alert("보내기 완료");
											opener.document.location.reload();
											window.close();
											console.log("보내기 완료");
										} else {
											alert("삭제 완료")
											opener.document.location.reload();
											window.close();
											console.log(JSON.stringify(data));
										}
									},
									error : function() {
										alert("에러 발생");
									}
								})
					})
</script>

</html>