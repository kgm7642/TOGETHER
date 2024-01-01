package com.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;

public class BoardModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao = new FileDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		BoardDTO board = bdao.getDetail(boardnum);
		req.setAttribute("board", board);
		req.setAttribute("files", fdao.getFiles(boardnum));
		System.out.println(fdao.getFiles(boardnum));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/boardmodify.jsp");
		return forward;
	}
}




