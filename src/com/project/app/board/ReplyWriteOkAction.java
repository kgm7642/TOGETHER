package com.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDTO;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.ReplyDTO;

public class ReplyWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		HttpSession session = req.getSession();
		UserDTO userid = (UserDTO)session.getAttribute("session");
		String contents = req.getParameter("contents");
		
		ReplyDTO newReply = new ReplyDTO();
		newReply.setBoardnum(boardnum);
		newReply.setUserid(userid.getUserid());
		newReply.setContents(contents);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(bdao.insertReply(newReply)) {
			forward.setPath(req.getContextPath()+"/board/BoardView.bo?reply=CT&boardnum="+boardnum);
		}else {
			forward.setPath(req.getContextPath()+"/board/BoardView.bo?reply=CF&boardnum="+boardnum);
		}
		return forward;
	}
}












