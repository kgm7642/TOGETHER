package com.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDTO;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;

public class BoardViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		BoardDAO bdao = new BoardDAO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		UserDTO userid = (UserDTO)session.getAttribute("session");
		BoardDTO board = bdao.getDetail(boardnum);
		String keyword = req.getParameter("keyword");
		
		if(!board.getUserid().equals(userid)) {
			bdao.updateViews(boardnum);
			board.setViews(board.getViews()+1);
			
		}

		FileDAO fdao = new FileDAO();
		
		req.setAttribute("board", board);
		req.setAttribute("files", fdao.getFiles(boardnum));
		req.setAttribute("keyword", keyword);
		req.setAttribute("replies",bdao.getReplies(boardnum));	
		
		forward.setRedirect(false);
		forward.setPath("/app/board/boardview.jsp");
		return forward;
	}
}