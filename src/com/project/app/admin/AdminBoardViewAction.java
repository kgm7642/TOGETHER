package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;
import com.project.app.user.dao.UserDTO;

public class AdminBoardViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		ActionForward forward = new ActionForward();
		
		BoardDTO board = bdao.getDetail(boardnum);
		String keyword = req.getParameter("keyword");

		FileDAO fdao = new FileDAO();
		
		req.setAttribute("board", board);
		req.setAttribute("files", fdao.getFiles(boardnum));
		req.setAttribute("keyword", keyword);	
		
		forward.setRedirect(false);
		forward.setPath("/app/admin/adminboardview.jsp");
		return forward;
	}
}
