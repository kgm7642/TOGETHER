package com.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.NoticeDTO;
import com.project.app.user.dao.UserDTO;

public class NoticeViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		BoardDAO bdao = new BoardDAO();
		String page = req.getParameter("page");
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		UserDTO userid = (UserDTO)session.getAttribute("session");
		NoticeDTO board = bdao.getDetailNotice(boardnum);
		String keyword = req.getParameter("keyword");
		
		if(!board.getUserid().equals(userid)) {
			bdao.updateNoticeViews(boardnum);
			board.setViews(board.getViews()+1);
			
		}
		
		req.setAttribute("board", board);
		req.setAttribute("keyword", keyword);	
		req.setAttribute("page", page);
		
		forward.setRedirect(false);
		forward.setPath("/app/board/noticeview.jsp");
		return forward;
	}
}
