package com.project.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.ActionForward;

public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		doProcess(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI(); // board_mvc2/user/UserJoin.us
		String contextPath = req.getContextPath(); // board_mvc2
		String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
		ActionForward forward = null;
		
		switch (command) {
			// 회원 가입
		case "/user/UserJoin.us":
			forward = new ActionForward();
			forward.setPath("/app/user/joinview.jsp");
			forward.setRedirect(false);
			break;
			// 아이디 중복 체크
		case "/user/CheckIdOk.us":
			try {
				new CheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("CheckIdOk : " + e);
			}
			break;
			// 회원가입 완료
		case "/user/UserJoinOk.us":
			try {
				forward = new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserJoinOk : " + e);
			}
			break;
			// 로그인
		case "/user/UserLogin.us":
			forward = new ActionForward();
			forward.setPath("/app/user/loginview.jsp");
			forward.setRedirect(false);
			break;
			// 로그인 완료
		case "/user/UserLoginOk.us":
			try {
				forward = new UserLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserLoginOk : " + e);
			}
			break;
			// 마이페이지
		case "/user/UserMypage.us":
			forward = new ActionForward();
			forward.setPath("/app/user/mypageview.jsp");
			forward.setRedirect(false);
			break;
			// 팔로잉 리스트
		case "/user/UserFollowingListOK.us":
			System.out.println("FollowinglistOKAction controler test");
			try {
				forward = new UserFollowingListOKAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserPlusFriend" + e);
			}
			break;		
			// 유저 아이디 찾기
		case "/user/UserFindId.us":
			forward = new ActionForward();
			forward.setPath("/app/user/findidview.jsp");
			forward.setRedirect(false);
			break;
			// 아이디 찾기 성공
		case "/user/UserFindIdOk.us":
			try {
				forward = new UserFindIdOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserFindIdOk" + e);
			}
			break;
			// 유저 비밀번호 찾기
		case "/user/UserFindpw.us":
			forward = new ActionForward();
			forward.setPath("/app/user/findpwview.jsp");
			forward.setRedirect(false);
			break;
			// 비밀번호 찾기 성공
		case "/user/UserFindpwOk.us":
			try {
				forward = new UserFindpwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserFindpwOk" + e);
			}
			break;	
			// 마이페이지 인덱스
		case "/user/UserMypageIndex.us":
			forward = new ActionForward();
			forward.setPath("/app/user/mypageindex.jsp");
			forward.setRedirect(false);
			break;
			// 유저 회원정보 수정
		case "/user/UserMyInfoUpdateOk.us":
			try {
				forward = new UserMyInfoUpdateOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserMyInfoUpdateOk" + e);
			}
			break;
			// 회원정보 수정하기 전 비밀번호 확인
		case "/user/UserMyInfoUpdatePw1.us":
			forward = new ActionForward();
			forward.setPath("/app/user/mypagego1.jsp");
			forward.setRedirect(false);
			break;
			// 회원탈퇴 하기 전 비밀번호 확인
		case "/user/UserMyInfoUpdatePw2.us":
			forward = new ActionForward();
			forward.setPath("/app/user/mypagego2.jsp");
			forward.setRedirect(false);
			break;
			// 마이페이지 인덱스에서 친구찾기 버튼
		case "/user/UserFindFriend.us":
			forward = new ActionForward();
			forward.setPath("/app/user/findfriendview.jsp");
			forward.setRedirect(false);
			break;
			// 이동된 페이지에서 자기가 원하는 친구 찾기
		case "/user/UserFindFriendOK.us":
			try {
				forward = new UserFindFriendAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserFindFriend" + e);
			}
			break;
			// 친구추가 페이지
		case "/user/UserPlusFriendOK.us":
			System.out.println("asda");
			try {
				forward = new UserPlusFriendOKAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserPlusFriend" + e);
			}
			break;		
			// 친구삭제 페이지
		case "/user/UserDeleteFriendOK.us":
			System.out.println("deleteFriend controller test");
			try {
				forward = new UserDeleteFriendOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserDeleteFriend" + e);
			}
			break;	
			// 친구 삭제 완료
		case "/user/DeleteFollowingOK.us":
			System.out.println("deleteFollowing controller test");
			try {
				forward = new DeleteFollowingOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DeleteFollwingOK" + e);
			}
			break;		
			//친구 목록 페이지
		case "/user/UserFriendListOK.us":
			System.out.println("Friendlist controler test");
			try {
				forward = new UserFriendlistOKAction().execute(req, resp);
				} catch (Exception e) {
				System.out.println("UserPlusFriend" + e);
				}
			break;	
			// 유저 정보
		case "/user/UserInfo.us":
			forward = new ActionForward();
			forward.setPath("/app/user/myinfoupdate.jsp");
			forward.setRedirect(false);
			break;
			// 로그아웃
		case "/user/UserLogoutOk.us":
			try {
				forward = new UserLoginOutAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserLoginOut : " + e);
			}
			break;
			//회원탈퇴
		case "/user/UserByeBye.us":
			try {
				forward = new UserByeByeAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserByeBye : " + e);
			}
			break;
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}