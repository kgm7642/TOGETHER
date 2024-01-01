package com.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.BoardDAO;

public class ReplyDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		int replynum = Integer.parseInt(req.getParameter("replynum"));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(bdao.deleteReply(replynum)) {
			forward.setPath(req.getContextPath()+"/board/BoardView.bo?reply=DT&boardnum="+boardnum);
		}else {
			forward.setPath(req.getContextPath()+"/board/BoardView.bo?reply=DF&boardnum="+boardnum);
		}
		return forward;
	}
}
