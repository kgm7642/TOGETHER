<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>모임 TALK</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
</head>
<style>
	.chattr{
	         border:0;
	      }
</style>
<body class="is-preload">
	<c:set var="cp" value="${pageContext.request.contextPath}" />
	<c:if test="${session.userid == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
		</script>
	</c:if>

		<!-- Page Wrapper -->
		<div id="page-wrapper" style="padding:0px;">

			<!-- Wrapper -->
			<div id="wrapper">
			<section id="main" class="main">
					<div class="inner">
						<div>
							<div>
								<div style="text-align:center;">
									<h1><strong>${moim.moimname}</strong><span style="color:#57B1B7;font-size:0.5em;"> TALK</span></h1>
								</div>
								<div>
									<input type="button" id="stopChat" value="업데이트 중지" onclick="stopGetChat()" style="padding:0 7px;float:left;margin-bottom:5px;border:1px solid #8C8D84;">								
									<input type="button" id="reStartChat" value="업데이트 🔄" onclick="reStartGetChat()" style="padding:0 7px;float:right;margin-bottom:5px;border:1px solid #8C8D84;">
								</div>
							</div>
							<div style="overflow:scroll;overflow-x:hidden;width:100%;height:530px;border:1px solid #8C8D84;" id="chatting">
								
							</div>	
							<table>
								<tr>
									<td style="vertical-align: middle; width: 80%;border-right:1px solid #8C8D84;border-left:2px solid #8C8D84;border-bottom: 1px solid #8C8D84;">
										<textarea placeholder="Contents" rows="3" id="moimchatcontents"
											style="resize: none; width: 100%; display: inline-block; height: 100px;"></textarea>
									</td>
									<td style="vertical-align: middle; width: 15%;border-right:1px solid #8C8D84;border-bottom: 1px solid #8C8D84;">
										<input type="button" class="button primary" value="보내기" onclick="setChat();"
										style="width: 100%; font-size: 1.5em;"/>
									</td>
								</tr>
							</table>
						</div>
					</div>
			</section>
		</div>
	</div>
	<!-- Scripts -->
	<script src="${cp}/assets/js/jquery.min.js"></script>
	<script src="${cp}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${cp}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${cp}/assets/js/browser.min.js"></script>
	<script src="${cp}/assets/js/breakpoints.min.js"></script>
	<script src="${cp}/assets/js/util.js"></script>
	<script src="${cp}/assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>let cp ="${pageContext.request.contextPath}"</script>
	<script>
	
		//채팅 리스트
		let chatList;
	
		let moimnum = "${moim.moimnum}";
		
		//페이지 로딩되자마자 getChat() 함수 실행
		$(document).ready(function(){getChat();});
		
		//?초마다 채팅 가져온다.
		let timeGetChat = setInterval(function(){
			getChat();
		}, 10000);
		
		//업데이트 멈추기
		function stopGetChat(){		
			clearInterval(timeGetChat);
		}
		
		//업데이트 재실행
		function reStartGetChat(){
			let timeGetChat = setInterval(function(){
				getChat();
			}, 10000);
		}
		
		//채팅 리스트를 모두 불러오는 함수
		function getChat(){
			$.ajax({
				url:cp+"/moim/GetChatList.mo?moimnum="+moimnum,
				type:"get",
				dataType:"json",
				success:showList
			});
		}
		function showList(chats){
			let useridChat = "${session.userid}";
			let text = "";
			chatList = chats;
			if(chats != null && chats.length != 0){
				$.each(chats, function(index, chat){
					if(chat.userid == useridChat){
						text += "<table style='margin:0;border:none;'>"
						text += "	<tr class='chattr'>"
						text += "		<td style='width:30%;padding-top:0px;padding-bottom:0px;'>"
						text += "		</td>"
						text += "		<td style='width:70%;padding-top:0px;padding-bottom:0px;'>"
						text += "			<table bgcolor='white'>"
						text += "				<tr class='chattr'>"
						text += "					<td style='width:75%;padding-top:0px;padding-bottom:0px;'>"
						text += "						<div style='float:right;'>"
						text += "							<div style='color:black;background-color:#F6F99B;border-radius:8px;padding:10px;'>"
						text += 								chat.chatcontents
						text += "							</div>"
						text += "						</div>"
						text += "					</td>"
						text += "					<td style='width:25%;vertical-align:bottom;text-align:left;padding-top:0px;padding-bottom:0px;padding-right:0px;'>"
						text += "						<table>"
						text += "							<tr>"
						text += "								<div style='text-align:left;color:black;font-size:0.7em;'>"
						text += 									chat.regdate
						text += "								</div>"
						text += "							</tr>"
						text += "						</table>"
						text += "					</td>"
						text += "				</tr>"
						text += "			</table>"
						text += "		</td>"
						text += "	</tr>"
						text += "</table>"
					}else{
						text += "<table style='margin:0;border:none;'>"
						text += "	<tr class='chattr'>"
						text += "		<td style='width:70%;padding-top:0px;padding-bottom:0px;padding-left:0px;'>"
						text += "			<table bgcolor='white'>"
						text += "				<tr class='chattr'>"
						text += "					<td style='width:19%;vertical-align:bottom;text-align:right;padding-top:0px;padding-bottom:0px;'>"
						text += "						<table style='margin:0px;'>"
						text += "							<tr>"
						text += "								<div style='color:black;font-weight:400;'>"
						text += 									chat.userid
						text += "								</div>"						
						text += "							</tr>"
						text += "							<tr>"
						text += "								<div style='color:black;font-size:0.7em;'>"
						text += 									chat.regdate
						text += "								</div>"
						text += "							</tr>"
						text += "						</table>"
						text += "					</td>"
						text += "					<td style='width:71%;padding-top:0px;padding-bottom:0px;'>"
						text += "						<div style='float:left;'>"		
						text += "							<div style='text-align:left;color:black;background-color:#E2E7F0;border-radius:8px;padding:10px;'>"
						text += 								chat.chatcontents					
						text += "							</div>"
						text += "						</div>"
						text += "					</td>"
						text += "				</tr>"
						text += "			</table>"
						text += "		</td>"
						text += "		<td style='width:30%;padding-top:0px;padding-bottom:0px;'>"
						text += "		</td>"
						text += "	</tr>"
						text += "</tabel>"		
					}
				});
			}else{
				text = "";
			}
			$("#chatting").html(text);
			setTimeout(scrollMove(), 3000);
		}
	
		//채팅 입력 함수
		function setChat(){
			let moimchatcontents = $("#moimchatcontents").val();
			$.ajax({
				url: cp+"/moim/SetChat.mo",
				type: "post",
				data: {"moimnum": moimnum, "moimchatcontents": moimchatcontents},
				success: function(){
					 $("#moimchatcontents").val("");
					 getChat();
				}
			});
		}
		
		// 채팅 스크롤바 최 하단으로 위치시키는 함수
		function scrollMove(){		
			$("#chatting").scrollTop($('#chatting')[0].scrollHeight);
		}
		
		//엔터키 제어 잘 모르겠음..
	/* 	$("textarea#query").keyup(function(e) {
			e.preventDefault();
			var code = e.keyCode ? e.keyCode : e.which;
			if (code == 13) // EnterKey
			{
				if (e.shiftKey === true) {
					// shift 키가 눌려진 상태에서는 new line 입력
					} else { 
						$('#my_form').submit();
					}
					return false;
			}
		}); 
	
	
		function enter(){
			if(event.keyCode==13){
				setChat();
			}
		}*/
		
	</script>
</html>