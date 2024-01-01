package com.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;

public class BoardLikeOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		BoardDTO board = new BoardDTO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
        int likes = bdao.getLikes(boardnum);
        
        board.setBoardnum(boardnum);
        board.setLikes(likes);
        
        bdao.boardLike(board);
        
        ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/board/BoardView.bo?boardnum="+boardnum);
		return forward;
	}

}
