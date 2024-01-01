package com.project.app.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.ActionForward;


public class AdminFrontController extends HttpServlet{
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
		//길나누는 코드
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;
		switch(command) {
		
		// 관리자 모임 관리
//===================================================================================
			// 모임 리스트
		case "/admin/MoimList.ad":
			try {
				forward = new MoimListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("MoimList : "+e);
			}
			break;
			// 모임 상세보기
		case "/admin/AdminGetMoimInfo.ad":
			try {
				forward = new AdminGetMoimInfoAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminGetMoimInfo : " + e);
			}
			break;
			// 모임 삭제
		case "/admin/AdminCancelMoim.ad":
			try {
				forward = new AdminCancelMoimAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminCancelMoim : " + e);
			}
			break;
		
		// 관리자 홍보게시판 관리
//===================================================================================			
			// 홍보게시판 리스트
		case "/admin/AdminMoimBoard.ad":
			try {
				forward = new AdminMoimBoardAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminMoimBoard : " + e);
			}
			break;
			// 홍보게시판 게시글 상세보기
		case "/admin/AdminMoimBoardView.ad":
			try {
				forward = new AdminMoimBoardViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminMoimBoardView : " + e);
			}
			break;
			// 홍보게시판 게시글 삭제
		case "/admin/AdminRemoveMoimBoard.ad":
			try {
				forward = new AdminRemoveMoimBoardAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminRemoveMoimBoard : " + e);
			}
			break;
		
		// 게시판 관리
//===================================================================================
			// 자유게시판 게시글 리스트
		case "/admin/AdminBoardList.ad":
			try {
				forward = new AdminBoardListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminBoardList : " + e);
			}
			break;
			// 자유게시판 게시글 상세보기
		case "/admin/AdminBoardView.ad":
			try {
				forward = new AdminBoardViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminBoardView : " + e);
			}
			break;
			// 자유게시판 게시글 삭제
		case "/admin/AdminRemoveBoard.ad":
			try {
				forward = new AdminRemoveBoardAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminRemoveBoard : " + e);
			}
			break;
			
		// 공지사항 관리
//===================================================================================
			// 공지사항 리스트
		case "/admin/AdminNoticeList.ad":
			try {
				forward = new AdminNoticeListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminNoticeList : " + e);
			}
			break;
			// 공지사항 작성하기
		case "/admin/AdminNoticeWrite.ad":
			try {
				forward = new AdminNoticeWriteAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminNoticeWrite : " + e);
			}
			break;
			// 공지사항 작성 완료
		case "/admin/AdminNoticeWriteOk.ad":
			try {
				forward = new AdminNoticeWriteOKAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminNoticeWriteOK : " + e);
			}
			break;
			// 공지사항 상세보기
		case "/admin/AdminNoticeView.ad":
			try {
				forward = new AdminNoticeViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminNoticeView : " + e);
			}
			break;
			// 공지사항 수정하기
		case "/admin/AdminNoticeModify.ad":
			try {
				forward = new AdminNoticeModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminNoticeModify : " + e);
			}
			break;
			// 공지사항 수정 완료
		case "/admin/AdminNoticeModifyOk.ad":
			try {
				forward = new AdminNoticeModifyOKAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminNoticeModifyOK : " + e);
			}
			break;
			// 공지사항 삭제
		case "/admin/AdminNoticeRemove.ad":
			try {
				forward = new AdminNoticeRemoveAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("AdminNoticeRemove : " + e);
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
