package com.project.app.moim;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.ActionForward;
import com.project.app.board.ReplyWriteOkAction;


public class MoimFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		
		
		switch(command) {
// 모임 생성 ---------------------------------------------------------------------------------------------------------------------------
		
		//모임 장소 생성 페이지 이동(가져가야할 정보가 없으므로 단순 페이지 이동)
		case "/moim/CreatePlace.mo":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/moim/createplace.jsp");
			break;
		//모임 생성 페이지 이동(가져가야할 정보가 없으므로 단순 페이지 이동)
		case "/moim/CreateMoim.mo":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/moim/createmoim.jsp");
			break;
		//장소Num 검색 ajax사용 리턴값x(모임 생성시 모임의 정보를 테이블에 넣어줘야 하는데 모임테이블에는 장소 Num 컬럼도 존재한다. 때문에 모임테이블에 장소Num컬럼값을 넣기 위해 장소Num을 가져오는 기능이다.)
		case "/moim/SelectPlaceNum.mo":
			System.out.println("SelectPlaceNum.mo");
			try {
				forward = new SelectPlaceNum().execute(req,resp);
			} catch (Exception e) {
				System.out.println("SelectPlaceNum : " + e);
			}
			break;
		//모임 장소 선택 완료
		case "/moim/CreatePlaceOk.mo":
			System.out.println("CreatePlaceOk.mo");
			try {
				forward = new CreatePlaceOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CreatePlaceOk : " + e);
			}
			break;
		//모임 생성 완료
		//이 컨트롤러가 모임 생성 버튼을 누르면 동작하는 컨트롤러이다. 즉 모임 정보가 테이블에 저장되며 그와 동시에 모임 생성 완료 페이지(completemoim.jsp)로 이동하는 컨트롤러이다.
		case "/moim/CreateMoimOk.mo":
			System.out.println("CreateMoimOk.mo");
			try {
				forward = new CreateMoimOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CreateMoimOk : " + e);
			}
			break;
		//모임 생성 완료 페이지 이동
		case "/moim/CompleteMoim.mo":
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/moim/completemoim.jsp");
			break;
			
// 모임 홍보 게시판 ---------------------------------------------------------------------------------------------------------------------------			
		
		//홍보 게시판 리스트로 페이지 이동
		case "/moim/AdMoim.mo":
			System.out.println("AdMoim.mo");
			try {
				forward = new AdMoimAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdvertiseMoim : " + e);
			}
			break;
		//홍보 게시글 상세보기
		case "/moim/AdMoimView.mo":
			System.out.println("AdMoimView.mo");
			try {
				forward = new AdMoimViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MoimView : " + e);
			}
			break;
		//홍보 게시글 신고 카운트 증가 ajax
		case "/moim/AdMoimDislikeOk.mo":
			try {
				forward = new AdMoimDislikeOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimDislikeOk : " + e);
			}
			break;
		//모임 가입 신청시 이미 가입되어있는지 유효성 검사 ajax사용 리턴값x
		case "/moim/CheckAlreadyJoin.mo":
			System.out.println("CheckAlreadyJoin.mo");
			try {
				forward = new CheckAlreadyJoinAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CheckAlreadyJoin " + e);
			}
			break;
		//모임 가입 신청 페이지로 이동(모임에 대한 정보, 방장 아이디를 가지고 이동해야해서 단순 페이지 이동 아님)
		case "/moim/AdMoimJoin.mo":
			System.out.println("AdMoimJoin.mo");
			try {
				forward = new AdMoimJoinAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimJoin : " + e);
			}
			break;
		//모임 가입 신청 성공
		case "/moim/AdMoimJoinOk.mo":
			System.out.println("AdMoimJoinOk.mo");
			try {
				forward = new  AdMoimJoinOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimJoinOk : " + e);
			}
			break;
		//모임 홍보 글쓰기 페이지로 이동(내 모임 정보 가지고 이동해야해서 단순 페이지 이동 아님)
		case "/moim/AdMoimWrite.mo":
			System.out.println("AdMoimWrite.mo");
			try {
				forward = new AdMoimWriteAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimWrite : " + e);
			}
			break;
		//모임 홍보 글쓰기로 이동하기전 어떠한 모임의 방장인지 먼저 확인(글쓰기 버튼 누를 시 동작함)(방장만 글쓰기 가능하기 때문) ajax사용 리턴값x
		case "/moim/CheckKingWrite.mo":
			System.out.println("CheckKingWrite.mo");
			try {
				forward = new CheckKingWriteAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CheckKingWrite : " + e);
			}
			break;
		//모임 홍보 글쓰기 완료 -> 완료 후 본인이 지금 작성한 게시글 보는 페이지로 이동함
		case "/moim/AdMoimWriteOk.mo":
			System.out.println("AdMoimWriteOk.mo");
			try {
				forward = new AdMoimWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimWriteOk : " + e);
			}
			break;
		//모임 수정 페이지 이동(현재 게시글의 정보를 가지고 이동해야해서 단순 페이지 이동 아님)
		case "/moim/AdMoimModify.mo":
			System.out.println("AdMoimModify.mo");
			try {
				forward = new AdMoimModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimModify : " + e);
			}
			break;
		//모임 수정 완료 -> 완료 후 수정된 게시글 보는 페이지로 이동함
		case "/moim/AdMoimModifyOk.mo":
			System.out.println("AdMoimModifyOk.mo");
			try {
				forward = new AdMoimModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimModifyOk : " + e);
			}
			break;
		//모임 삭제 페이지(이건 페이지 이동이라기보다 삭제버튼 누르면 그냥 게시글 삭제하는거임)(삭제 후 모임 게시글 리스트 페이지로 이동)
		case "/moim/AdMoimRemove.mo":
			System.out.println("AdMoimRemove.mo");
			try {
				forward = new AdMoimRemoveAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdMoimRemove : " + e);
			}
			break;
// 모임 홍보 게시글 - 댓글 부분---------------------------------------------------------------------------------------------------------------------------

		//홍보 게시글 뷰(admoim.jsp)에 나타낼 댓글을 가져오는 액션코드 ajax사용 리턴값x
		//현재 보고있는 게시글의 게시글 번호를 가지고 와야함(그 게시글의 댓글을 보여주기 위해)
		//JSon 사용해서 댓글 리스트를 받음(Action코드에도 설명 써놨음)
		case "/Moim/ReplyListOk.mo":
			System.out.println("ReplyListOk.mo");
			try {
				forward = new ReplyListOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyListOk : " + e);
			}
			break;
		//댓글 작성하는 액션 코드 ajax사용 리턴값x
		//뷰단에서 댓글을 작성하면 그 게시글Num, 댓글 작성자, 댓글 내용 3개의 정보를 가지고 와야함 -> 가져와서 댓글 테이블에 insert
		case "/moim/AdReplyWriteOk.mo":
			System.out.println("AdReplyWriteOk");
			try {
				forward = new AdReplyWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdReplyWriteOk : " + e);
			}
			break;
		//댓글 수정하는 액션 코드 ajax사용 리턴값x
		//뷰단에서 댓글을 수정하면 그 댓글의 replynum, 댓글 내용을 가지고 와야함 -> 가져와서 replynum으로 테이블에서 댓글 찾아서 내용 변경해줌
		//여긴 ajax를 사용했기 때문에 해당 게시글의 번호는 가지고 오지 않아도됨
		case "/moim/AdReplyModifyOk.mo":
			System.out.println("AdReplyModifyOk");
			try {
				forward = new AdReplyModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdReplyModifyOk : " + e);
			}
			break;
		//댓글 삭제하는 액션 코드 ajax사용 리턴값x
		//뷰단에서 댓글을 삭제하면 그 댓글의 replynum 만 가져오면 됨 -> 가져와서 replynum으로 테이블에서 댓글 찾아서 삭제
		case "/moim/AdReplyDeleteOk.mo":
			System.out.println("AdReplyDeleteOk");
			try {
				forward = new AdReplyDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdReplyDeleteOk : " + e);
			}
			break;
// 모임 신청을 관리하는 액션들 --------------------------------------------------------------------------------	
			
		//모임 리스트에서 관리하고 싶은 모임을 선택했을 경우 이 컨트롤러로 이동(이곳에서는 현재 선택한 모임에 가입신청을 한 유저들의 리스트를 확인할 수 있음)
		//상세보기를 누르면 그 신청 유저가 작성한 가입신청 멘트를 확인하는 페이지(바로 아래의 ApplyMoimInfo_c 컨트롤러로 이동)
		case "/moim/ApplyMoimInfo.mo":
			System.out.println("ApplyMoimInfo");
			try {
				forward = new ApplyMoimInfoAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ApplyMoimInfo : " + e);
			}
			break;
		//상세보기를 누르면 이동하는 컨트롤러
		//가입신청 멘트를 확인할 수 있으며 오른쪽 하단에 수락/거절 버튼이 있다. 둘 중 하나의 버튼을 누르면 아래의 ApplyMoimJoin 컨트롤러로 이동)
		case "/moim/ApplyMoimInfo_c.mo":
			System.out.println("ApplyMoimInfo_c");
			try {
				forward = new ApplyMoimInfo_cAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ApplyMoimInfo_c : " + e);
			}
			break;
		//수락/거절 버튼을 누르면 이동하는 컨트롤러
		//수락이든 거절이든 moinjoin 테이블에서 현재 보고있는 가입신청 유저의 신청 데이터는 delete함.
		//만약 수락이면 delete와 동시에 T_MOIMMEMBER 테이블에 그 유저의 정보를 저장하고 거절이라면 그냥 delete만 함
		case "/moim/ApplyMoimJoin.mo":
			System.out.println("ApplyMoimJoin");
			try {
				forward = new ApplyMoimJoinAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ApplyMoimJoin : " + e);
			}
			break;
//--------------------------------------------------------------------------------------------------------------------------------------						
			// 내 모임 이동
		case "/moim/MyMoim.mo":
			System.out.println("/moim/MyMoim.mo");
			try {
				forward = new MyMoimListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MymoimList : " + e);
			}
			break;
			// 모임 정보 수정
		case "/moim/UpdateMoim.mo":
			System.out.println("/moim/UpdateMoim.mo");
			try {
				forward = new UpdateMoimAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UpdateMoimAction : "+e);
			}
			break;
			// 모임 정보 수정 완료
		case "/moim/UpdateMoimOk.mo":
			System.out.println("/moim/UpdateMoimOk.mo");
			try {
				forward = new UpdateMoimOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UpdateMoimOkAction : "+e);
			}
			break;
			// 모임 장소 수정
		case "/moim/UpdatePlace.mo":
			System.out.println("/moim/UpdatePlace.mo");
			try {
				forward = new UpdatePlaceAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UpdatePlaceAction : "+e);
			}
			break;
			// 모임 장소 수정 완료
		case "/moim/UpdatePlaceOk.mo":
			System.out.println("/moim/UpdatePlaceOk.mo");
			try {
				forward = new UpdatePlaceOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UpdatePlaceOkAction : "+e);
			}
			break;
			// 내 모든 모임 리스트
		case "/moim/MyMoimAll.mo":
			System.out.println("/moim/MyMoimAll.mo");
			try {
				forward = new MyMoimAllListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MymoimAllList : " + e);
			}
			break;
			// 모임 검색
		case "/moim/SearchMoim.mo":
			System.out.println("/moim/SearchMoim.mo");
			try {
				forward = new SearchMoimAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("SearchMoimAction : "+e);
			}
			break;
			// 모임 상세 정보
		case "/moim/GetMoimInfo.mo":
			System.out.println("/moim/GetMoimInfo.mo");
			try {
				forward = new GetMoimInfoAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("GetMoimInfo : "+e);
			}
			break;
			// 모임 신고 카운트 증가 ajax
		case "/moim/MoimDislikeOk.mo":
			try {
				forward = new MoimDislikeOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MoimDislikeOk : " + e);
			}
			break;	
			// 모임 강퇴
		case "/moim/MoimBan.mo":
			System.out.println("/moim/MoimBan.mo");
			try {
				forward = new MoimBanAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MoimBanAction : "+e);
			}
			break;
			// 모임 강퇴 메세지
		case "/moim/FireMessage.mo":
			System.out.println("/moim/FireMessage.mo");
			try {
				forward = new FireMessageAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FireMessageAction : "+e);
			}
			break;
			// 모임 강퇴 메세지 전송 완료
		case "/moim/FireMessageOk.mo":
			System.out.println("/moim/FireMessageOk.mo");
			try {
				forward = new FireMessageOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FireMessageOkAction : "+e);
			}
			break;	
			// 모임 삭제
		case "/moim/CancelMoim.mo":
			System.out.println("/moim/CancelMoim.mo");
			try {
				forward = new CancelMoimAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CancelMoimAction : "+e);
			}
			break;
			// 모임 강퇴 성공
		case "/moim/BanMoimOk.mo":
			System.out.println("/moim/BanMoimOk.mo");
			try {
				forward = new BanMoimOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BanMoimOkAction : "+e);
			}
			break;
			// 모임 탈퇴	
		case "/moim/OutMoim.mo":
			System.out.println("/moim/OutMoim.mo");
			try {
				forward = new OutMoimAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("OutMoimAction : " +e);
			}
			break;
// 채팅 관련 액션들-----------------------------------------------------------------------------
			// 채팅방 이동
		case "/moim/MoimChat.mo":
			try {
				forward = new MoimChatAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MoimChatAction : " +e);
			}
			break;
			// 채팅리스트
		case "/moim/GetChatList.mo":
			System.out.println("/moim/GetChatList.mo");
			try {
				forward = new GetChatListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("GetChatListAction : "+e);
			}
			break;
			// 채팅 DB에 저장
		case "/moim/SetChat.mo":
			System.out.println("/moim/SetChat.mo");
			try {
				forward = new SetChatAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("SeChatAction : " + e);
			}
			break;
		}

		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}
			else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}














