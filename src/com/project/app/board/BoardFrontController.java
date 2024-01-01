package com.project.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.ActionForward;

public class BoardFrontController extends HttpServlet{
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
			// 자유게시판 리스트
		case "/board/BoardList.bo":
			try {
				forward = new BoardListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardList : "+e);
			}
			break;
			// 자유게시판 게시글 상세보기
		case "/board/BoardView.bo":
			try {
				forward = new BoardViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardView : "+e);
			}
			break;
			// 자유게시판 게시글 작성하기
		case "/board/BoardWrite.bo":
			forward = new ActionForward(false,"/app/board/boardwrite.jsp");
			req.setAttribute("page", req.getParameter("page"));
			break;
			// 자유게시판 게시글 작성 완료
		case "/board/BoardWriteOk.bo":
			try {
				forward = new BoardWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardWriteOk : "+e);
			}
			break;
			// 자유게시판 게시글 수정하기
		case "/board/BoardModify.bo":
			try {
				forward = new BoardModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardModify : "+e);
			}
			break;
			// 자유게시판 게시글 수정 완료
		case "/board/BoardModifyOk.bo":
			try {
				forward = new BoardModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardModifyOk : "+e);
			}
			break;
			// 자유게시판 파일 다운로드
		case "/board/FileDownload.bo":
			try {
				forward = new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FileDownload : "+e);
			}
			break;
			// 자유게시판 게시글 삭제 
		case "/board/BoardRemove.bo":
			try {
				forward = new BoardRemoveAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardRemove : "+e);
			}
			break;
			// 자유게시판 댓글 작성 
		case "/board/ReplyWriteOk.bo":
			try {
				forward = new ReplyWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyWriteOk : "+e);
			}
			break;
			// 자유게시판 댓글 삭제
		case "/board/ReplyDeleteOk.bo":
			try {
				forward = new ReplyDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyDeleteOk : "+e);
			}
			break;
			// 자유게시판 댓글 수정
		case "/board/ReplyModifyOk.bo":
			try {
				forward = new ReplyModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyModifyOk : "+e);
			}
			break;
			// 자유게시판 게시글 좋아요
		case "/board/BoardLike.bo":
			try {
			forward = new BoardLikeOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardLikeOkAction : "+e);
			}
			break;
			// 자유게시판 게시글 싫어요
		case "/board/BoardHate.bo":
			try {
			forward = new BoardHateOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("BoardLikeOkAction : "+e);
			}
			break;		
			// 공지사항 리스트
		case "/board/NoticeList.bo":
			try {
				forward = new NoticeListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeList : " + e);
			}
			break;
			// 공지사항 상세보기
		case "/board/NoticeView.bo":
			try {
				forward = new NoticeViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeView : " + e);
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
