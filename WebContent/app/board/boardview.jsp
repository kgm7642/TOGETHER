<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 상세보기</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<title>Together</title>
</head>
<body>
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:if test="${not empty param.write}">
		<script>
			alert("게시글 작성 완료!");
		</script>
	</c:if>
	<c:if test="${not empty param.reply}">
		<c:set var="t" value="${param.reply}" />
		<c:choose>
			<c:when test="${t=='CT'}">
				<script>alert("댓글 작성 성공!");</script>
			</c:when>
			<c:when test="${t=='CF'}">
				<script>alert("댓글 작성 실패!");</script>
			</c:when>
			<c:when test="${t=='UT'}">
				<script>alert("댓글 수정 성공!");</script>
			</c:when>
			<c:when test="${t=='UF'}">
				<script>alert("댓글 수정 실패!");</script>
			</c:when>
			<c:when test="${t=='DT'}">
				<script>alert("댓글 삭제 성공!");</script>
			</c:when>
			<c:when test="${t=='DF'}">
				<script>alert("댓글 삭제 실패!");</script>
			</c:when>
		</c:choose>
	</c:if>
	<c:set var="cp" value="${pageContext.request.contextPath}" />
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


		<!-- 타이틀과 글 개수 띄워주는 테이블 -->
		<div id="wrapper">
			<section id="main" class="main">
				<div class="inner">
					<table class="title">
						<tr align="center" valign="middle">
							<td><h1>${board.boardtitle}</h1></td>
						</tr>
					</table>

					<form method="post" name="boardForm"
						action="${cp}/board/BoardWriteOk.bo">
						<!-- 게시글 작성하는 인풋들 배치 테이블 -->
						<table class="board_area">
							<tr>
								<th align="center" style="text-align: center; width: 20%;">
									작성자
								</th>
								<td>
									<input type="hidden" name="boardtitle" size="65"
										readonly value="${board.boardtitle}"> ${board.userid}
								</td>
							</tr>
							<tr>
								<th align="center" align="center"
									style="text-align: center; width: 20%;">카테고리</th>
								<td><c:choose>
										<c:when test="${board.category == 1}">여행</c:when>
										<c:when test="${board.category == 2}">스터디</c:when>
										<c:when test="${board.category == 3}">동호회</c:when>
										<c:when test="${board.category == 4}">취미</c:when>
										<c:when test="${board.category == 5}">운동</c:when>
										<c:when test="${board.category == 6}">친구</c:when>
										<c:when test="${board.category == 7}">취업</c:when>
										<c:when test="${board.category == 8}">크루</c:when>
										<c:when test="${board.category == 9}">연애</c:when>
										<c:when test="${board.category == 10}">상담</c:when>
									</c:choose></td>
							</tr>
							<tr>
								<th align="center" align="center"
									style="text-align: center; width: 20%;">내 용</th>
								<td><textarea name="contents"
										style="height: 700px; resize: none;" readonly>${board.contents}</textarea>
								</td>
							</tr>
							<c:choose>
								<c:when test="${files != null and files.size()>0}">
									<c:forEach var="i" begin="0" end="${files.size()-1}">
										<tr>
											<th align="center" align="center"
												style="text-align: center; width: 20%;">
												첨부파일${i+1}
											</th>
											<td>
												<a href="${cp}/board/FileDownload.bo?filename=${files[i].systemname}&orgname=${files[i].orgname}">${files[i].orgname}</a>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2" style="text-align:center;font-size:20;">첨부 파일이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<br>
						<table class="btn_area">
							<tr align="right" valign="middle">
								<td><c:if test="${board.userid == session.userid }">
										<a class="button primary small"
											href="${cp}/board/BoardModify.bo?boardnum=${board.boardnum}">수정</a>&nbsp;&nbsp;
							<a class="button small"
											href="javascript:document.removeForm.submit()">삭제</a>&nbsp;&nbsp;
						</c:if> <a class="button small"
									href="${cp}/board/BoardList.bo?page=${param.page == null?1:param.page}">목록</a>
								</td>
							</tr>
						</table>
						<table>
							<tr align="center" align="center"
								style="text-align: center; width: 20%;">
								<td><a href="javascript:likeCnt(${board.boardnum})">💖
										${board.likes}</a> <a href="javascript:hateCnt(${board.boardnum})">💔
										${board.dislike}</a></td>
							</tr>
						</table>
					</form>
					<form name="removeForm" action="${cp}/board/BoardRemove.bo"
						method="get">
						<input type="hidden" value="${board.boardnum}" name="boardnum">
					</form>
					<div class="reply_line">
						<form name="replyForm" method="post"
							action="${cp}/board/ReplyWriteOk.bo">
							<input type="hidden" name="boardnum" value="${board.boardnum}">
							<table class="write_box">
								<tr align="center" align="center"
									style="text-align: center; width: 20%;">
									<td>댓 글</td>
									<td><textarea name="contents"
											style="width: 90%; resize: none;"
											placeholder="타인의 권리를 침해하거나 명예를 훼손하는 댓글은 제재를 받을 수 있습니다."></textarea>
									</td>
									<td><a class="button primary small"
										href="javascript:document.replyForm.submit()">등록</a></td>
								</tr>
							</table>
						</form>
						<form method="post" name="updateForm" action="">
							<input type="hidden" name="boardnum" value="${board.boardnum}">
							<table class="update_box">
								<c:set var="i" value="0" />
								<!-- 피라미드 게임, 이번 생도 잘 부탁해, 나를 바꿔줘, 어글리후드, 니나의 마법서랍, 꿈의 기업 -->
								<c:forEach var="reply" items="${replies}">
									<tr align="center" style="text-align: center;">
										<td style="width: 16%;">${reply.userid}</td>
										<td><textarea name="reply${i}" id="reply${i}" readonly
												class="contents" style="width: 90%; resize: none;">${reply.contents}</textarea>
										</td>
										<td>${reply.regdate}<br> <c:if
												test="${reply.userid == session.userid}">
												<div class="btns">
													<a class="button primary small" id="ready${i}"
														href="javascript:updateReply(${i});">댓글 수정</a> <a
														class="button primary small" id="ok${i}"
														href="javascript:updateOk(${i},${reply.replynum})"
														style="display: none;">수정완료</a> <a class="button small"
														href="javascript:deleteReply(${reply.replynum})">삭제</a>
													<!-- <button>삭제</button> -->
												</div>
											</c:if>
										</td>
									</tr>
									<c:set var="i" value="${i+1}" />
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
	let updateForm = document.updateForm;
	//function updateReply(){
	//	updateForm.setAttribute("action","${cp}/board/ReplyUpdateOk.bo?replynum="+replynum);
	//	updateForm.submit();
	//}
	let ready = null;
	let ok = null;
	let reply = null;
	
	function updateReply(i){
		ready = document.getElementById("ready"+i);
		ok = document.getElementById("ok"+i);
		reply = document.getElementById("reply"+i)
		
		ready.style.display = "none";
		ok.style.display = "inline-block";
		reply.removeAttribute("readonly")
	}
	
	function updateOk(i,replynum){
		//i : 백단에서 textarea의 내용을 파라미터로 꺼내기 위한 숫자
		//replynum : 백단에서 받아온 데이터들로 수정할 댓글의 PK
		updateForm.setAttribute("action","${cp}/board/ReplyModifyOk.bo?i="+i+"&replynum="+replynum);
		updateForm.submit();
		
	}
	
	function deleteReply(replynum){
		updateForm.setAttribute("action","${cp}/board/ReplyDeleteOk.bo?replynum="+replynum);
		updateForm.submit();
		
	}
	
	
	// 좋아요 누르기
	function likeCnt() {

        var boardnum = {boardnum : ${board.boardnum}}
        
        $.ajax({
            url : "${cp}/board/BoardLike.bo",
            type: "get",
            data: boardnum,
            success:function(data) {
                alert("💖");
                location.reload();
            }
        });
    }
	function hateCnt() {
        var boardnumber = {boardnum : ${board.boardnum}}
        
        $.ajax({
            url : "${cp}/board/BoardHate.bo",
            type: "get",
            data: boardnumber,
            success:function(data) {
                alert("💔");
                location.reload();
            }
        });
    }
</script>
</html>




