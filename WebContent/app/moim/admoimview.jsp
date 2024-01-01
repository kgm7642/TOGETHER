<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
	Formula by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>홍보 게시글 상세보기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
	</head>
	<style>
	#pre1{
		padding:0px;
	    background-color: #E6E6FA;
	    overflow: auto;
	    white-space: pre-wrap;
	    word-break: break-all;
	}  
	#pre2{
	    padding:10px;
	    overflow: auto;
	    white-space: pre-wrap;
	    word-break: break-all;
	} 
	td{
		padding: 0px;
		border-spacing: 0 0px;
	}
	</style>
	<body class="is-preload">
	<c:set var = "page" value="${requestScope.page}"/>
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>
	<c:if test="${param.modify == true}">
		<script>
			alert("게시글 수정 완료!");
		</script>
	</c:if>
	<c:if test="${param.modify == false}">
		<script>
			alert("게시글 수정 실패. 다시 시도해 주세요.");
		</script>
	</c:if>
	<c:if test="${param.write == true}">
		<script>
			alert("게시글 작성 완료!");
		</script>
	</c:if>
	<c:if test="${param.write == false}">
		<script>
			alert("게시글 작성 실패. 다시 시도해 주세요.");
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
										<h1>${moimrecruit.recruittitle}</h1>
								</header>
								<div>
									<div style="text-align:center;">
										<div style="float:right;">&nbsp;&nbsp;&nbsp;&nbsp;<strong>조회수 : ${moimrecruit.readcnt}</strong></div>
									</div>
								</div>
								<table style="margin:0px;">
									<tr>
										<td style="width:15%;">
											<strong>작 성 자</strong>
										</td>
										<td style="width:80%;">
											<strong>${moimrecruit.userid}</strong>
										</td>
										<td style="width:4%;">
										</td>
									</tr>
									<tr>
										<td style="width:15%;">
											<strong>내 용</strong>
										</td>
										<td style="width:80%;">
											<strong>${moimrecruit.recruitcontents}</strong>
										</td>
										<td style="width:4%;">
										</td>
									</tr>
								</table>
								<hr>
								<table>
									<tr>
										<td style="width: 49%;">
											<h2 style="text-align:center;">INFO</h2>
											<table>
												<tr>
													<td>모임 이름</td>
													<td>💖<a href="${cp}/moim/GetMoimInfo.mo?moimnum=${moim.moimnum}&page=${page}">${moim.moimname}</a>💖</td>										
												</tr>
												<tr>
													<td>모임장</td>
													<td>${moim.userid}</td>
												</tr>
												<tr>
													<td>분류</td>
													<td><c:choose>
															<c:when test="${moim.moimtype == 1}">여행</c:when>
															<c:when test="${moim.moimtype == 2}">스터디</c:when>
															<c:when test="${moim.moimtype == 3}">동호회</c:when>
															<c:when test="${moim.moimtype == 4}">취미</c:when>
															<c:when test="${moim.moimtype == 5}">운동</c:when>
															<c:when test="${moim.moimtype == 6}">친구</c:when>
															<c:when test="${moim.moimtype == 7}">취업</c:when>
															<c:when test="${moim.moimtype == 8}">크루</c:when>
															<c:when test="${moim.moimtype == 9}">연애</c:when>
															<c:when test="${moim.moimtype == 10}">상담</c:when>
														</c:choose>
													</td>	
												</tr>
												<tr>
													<td>경비</td>
													<td>${moim.moimbudget}</td>
												</tr>
												<tr>
													<td>출발날짜</td>
													<td>${fn:split(moim.startdate," ")[0]}</td>
												</tr>
												<tr>
													<td>끝날짜</td>
													<td>${fn:split(moim.enddate," ")[0]}</td>
												</tr>
											</table>
										</td>
										<td style="width: 49%;">
											<h2 style="text-align:center;">WHERE</h2>
											<div id="staticMap" style="width: 100%; height: 350px;"></div>
											<strong style="text-align: center; display: block;">${place.placename}</strong>
											<div>
												<input type="hidden" id="placenum" name="placenum" value="">
												<input type="hidden" id="placelat" name="placelat" value="">
												<input type="hidden" id="placelon" name="placelon" value="">
												<input type="hidden" id="placename" name="placename" value="">
												<input type="hidden" id="placeroadaddr" name="placeroadaddr" value="">
												<input type="hidden" id="placeaddr" name="placeaddr" value="">
												<input type="hidden" id="placecategoryname" name="placecategoryname" value="">
												<input type="hidden" id="placephone" name="placephone" value="">
												<input type="hidden" name="moimnum" value="${moim.moimnum}">
											</div>
										</td>
									</tr>
								</table>
								<div style="text-align:center;">
									<div style="text-align:left;display:inline-block;width:49%;">
										<input type="button" value="목록" id="list" onclick="boardlist();">
									</div>
									<div style="text-align:right;display:inline-block;width:49%;">
										<c:choose>
											<c:when test="${session.userid == moimrecruit.userid}">
												<input type="button" value="게시글 수정" id="modifyboard" onclick="modifyboard();">
												<input type="button" value="삭제" id="removeboard" onclick="removeboard();">												
											</c:when>
											<c:otherwise>
												<div>
													<div style="text-align:right;margin:10px;" id="dislikeCnt">
														<span id="dislikeCnt">🚨신고 횟수🚨 : ${moimrecruit.dislike} 회</span>
													</div>
													<input type="button" onclick="cntDislike();" value="모임신고🚨" style="float:right;padding-right:10px;padding-left:18px;" class="button primary"></input>
												</div>
												<input type="button" value="가입 신청" id="joinmoim" onclick="joinmoim();" style="margin-right:10px;">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div style="margin-top:50px;">
								</div>
								<form method="post" style="margin:0px;">
									<table style="margin:0px;">
										<tr align="center"  align="center" style="text-align:center; width:20%;">
											<td style="width:10%;vertical-align:center;"><strong>댓 글</strong></td>
											<td style="width:79%;vertical-align:center;">
												<pre id="pre2"><textarea placeholder="타인의 권리를 침해하거나 명예를 훼손하는 댓글은 제재를 받을 수 있습니다."
												 name="content" id="content" style="resize:none;background-color:#E6E6FA;border: 1px solid #B0C4DE;" 
												 onclick="removePlaceholder();"></textarea></pre>
											</td>
											<td style="width:10%;vertical-align:center;">				
												<input type="button" value="등록" onclick="comment()">
											</td>
										</tr>
									</table>
								</form>
								<div id="replies"></div>
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
		<input type="hidden" id="checkjoin">
	</body>
	<script>let cp = "${pageContext.request.contextPath}"</script>
	<script src="https://tistory1.daumcdn.net/tistory/2784544/skin/images/xmltojsonPast.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=608550f7326ed470642f95701b5d006a&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		let cntDis;
		
		function cntDislike(){
			if(confirm("정말 신고하시겠습니까?")){
				$.ajax({
					url: cp+"/moim/AdMoimDislikeOk.mo",
					type: "post",
					dataType:"json",
					data: {"recruitnum": ${moimrecruit.recruitnum}},
					success: getCnt
				});
			}
		}
		
		function getCnt(cnt){
			console.log(cnt.dislikeCnt);
			cntDis = "신고 횟수 : " + cnt.dislikeCnt;
			addCnt();
		}
	
		function addCnt(){
			let dislikeCntTag = document.getElementById("dislikeCnt");
			dislikeCntTag.innerHTML = cntDis;
		}
	
	
	
		//댓글 리스트 가져오기
		$(document).ready(function(){getList();});
		let recruitnum = ${moimrecruit.recruitnum};
		function getList(){
			$.ajax({
				url:cp+"/Moim/ReplyListOk.mo?recruitnum="+recruitnum,
				type:"get",
				dataType:"json",
				success:showList
			});
		}
		
		let replyList; //댓글 리스트  
		
		function showList(replies){
			let text = "";
			replyList = replies;
			
			if(replies != null && replies.length != 0){
				$.each(replies, function(index, reply){
					text += "<table style='padding:0px;margin:0px;'>";
					text += "	<div id='reply'>";
					text += "		<tr>";
					text += "			<td style='width:14%;'>";
					text +=					reply.replywriter;
					text +=	"			</td>";				
					text += "			<td style='width:60%;'>";
					text += "				<div class='content' id='"+index+"'><pre id='pre1'>"+reply.replycontents+"</pre></div>"
					text += "			</td>";
					text += "			<td style='width:25%;'>";
					text +=					reply.regdate;
					if("${session.userid}" == reply.replywriter) {
						text += "			<table style='padding:0px;'>";
						text += "				<tr>"
						text += "					<div style='display:inline-block;'>"
						text += "						<input type='button' id='ready"+index+"' onclick=readyToUpdate("+index+"); value='수정'>&nbsp;"
						text += "						<input type='button' id='ok"+index+"' style='display:none;' onclick=update("+index+","+reply.replynum+"); value='수정완료'>";
						text += "						<input type='button' id='remove"+index+"' onclick=deleteReply("+reply.replynum+"); value='삭제'>";
						text += "					</div>"	
						text += "				</tr>"
						text += "			</table>";
					} 
					text += "			</td>"
					text += "		</tr>"
					text += "	</div>";
				});
					text += "</table>"
					text += "<a href='#page-wrapper' id='top' style='border: 1px solid #c9c5cd;float:right;margin-top:20px;'>&nbsp;TOP ▲</a>"
			}else{
				text += "<div style='text-align:center;'>";
				text += "	<h2 style='margin-top:20px;'>등록된 댓글이 없습니다.</h2>";
				text += "</div>";
			}
			$("#replies").html(text);
		}	
		
		let check = false;
		//댓글 수정중 true임, 수정 완료되면 false 상태임
		function readyToUpdate(index){
			
			let div = $("#"+index);
			
			//수정 버튼
			let modifyReady = $("#ready"+index);
			//수정완료 버튼
			let modifyOk = $("#ok"+index);
			//삭제 버튼
			let remove = $("#remove" + index);
			
			if(!check){
				div.replaceWith("<pre id='pre1'><textarea name='replyContent' id='"+index+"' class='invert' style='board-radius:0;resize:none;'>"+div.text() +"</textarea></pre>")
				remove.replaceWith("<input type='button' id='cancel"+index+"' value='취소' onclick=updateCancel("+index+")>")
				 					
				modifyReady.hide(); //수정 버튼 숨김
				modifyOk.show(); //수정완료 버튼 보임
				
				check = true;
			}else{
				alert("이미 댓글을 수정중입니다.")	
			}
		}
		
		//댓글 수정 취소
		function updateCancel(index){
			//수정취소 버튼
			let remove = $("#cancel"+index);
			
			let textarea = $("#"+index);
			//수정 버튼
			let modifyReady = $("#ready"+index);
			//수정완료 버튼
			let modifyOk = $("#ok"+index); 
			
			modifyReady.show();
			modifyOk.hide();
			
			remove.replaceWith("<input type='button' id='remove"+index+"' onclick='' value='삭제'>");
			textarea.replaceWith("<div class='content' id='"+index+"' style='resize:none;background-color:#E6E6FA;'>"+replyList[index].replycontents+"</div>");
			check = false;		
		}
		
		
		
		//댓글 등록 완료
		function comment(){
			let recruitnum = ${moimrecruit.recruitnum};
			let replycontent = $("textarea[name='content']").val();
			$.ajax({
				url: cp+"/moim/AdReplyWriteOk.mo",
				type: "post",
				data: {"recruitnum": recruitnum, "replycontent": replycontent},
				success: function(){
					 $("textarea[name='content']").val("");
					 getList();
				}
			});
		}
		
		
		
		//댓글 수정 완료
		function update(index, replynum){
			let replycontent = $("textarea#"+index).val();
			$.ajax({
				url: cp+"/moim/AdReplyModifyOk.mo",
				type: "post",
				data: {"replynum": replynum, "replycontent": replycontent},
				success: function(){
					check = false;
					getList();
					alert("댓글이 수정되었습니다.");
				}
			});
		}
		
		
		//댓글 삭제 완료
		function deleteReply(replynum){
			$.ajax({
				url: cp+"/moim/AdReplyDeleteOk.mo",
				type: "post",
				data: {"replynum": replynum},
				success: function(){
					getList();
					alert("댓글이 삭제되었습니다.");
				}
			});
		}
		
		
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
		        level: 6, // 이미지 지도의 확대 레벨
		        marker: marker // 이미지 지도에 표시할 마커 
		    };    
		
		// 이미지 지도를 생성합니다
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);

	
		function boardlist(){
			location.href = "${cp}/moim/AdMoim.mo?page="+${page};
		}
	
		//홍보 게시글 수정
		function modifyboard(){
			location.href = "${cp}/moim/AdMoimModify.mo?recruitnum="+${moimrecruit.recruitnum}+"&page="+${page};
		}
 		
		//홍보 게시글 삭제
		function removeboard(){
			location.href = "${cp}/moim/AdMoimRemove.mo?recruitnum="+${moimrecruit.recruitnum}+"&page="+${page};
		} 
		
		//이미 모임 회원인지 확인
		let checkjoin = document.getElementById("checkjoin");
		function joinmoim(){
			if(confirm("정말 가입하시겠습니까?")){
				checkAlreadyJoin();
				setTimeout(function() {
					if(checkjoin.value == 1){
						location.href = "${pageContext.request.contextPath}/moim/AdMoimJoin.mo?isSearch=false&moimnum="+${moimrecruit.moimnum};
					}else{
						alert("이미 가입되어 있는 모임입니다.");	
					}
				}, 500);
			}
		}
		function checkAlreadyJoin(){
			let userid = "${session.userid}";
			let xhr = new XMLHttpRequest();
			xhr.open("GET",cp+"/moim/CheckAlreadyJoin.mo?userid="+userid+"&moimnum="+${moimrecruit.moimnum},true);
			xhr.send();
			//xhr의 상태가 변할 때 호출될 함수 미리 설정
			xhr.onreadystatechange = function(){
				if(xhr.readyState == XMLHttpRequest.DONE){
					if(xhr.status == 200 || xhr.status == 201){
						let txt = xhr.responseText;
						txt = txt.trim();
						if(txt == "O"){
							checkjoin.value=1
						}
					}
				}
			}
		}
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/createplace.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	</html>