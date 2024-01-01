package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.admin.dao.AdminDAO;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.NoticeDTO;

public class AdminNoticeModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		AdminDAO adao = new AdminDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		NoticeDTO ndto = adao.getDetailNotice(boardnum);
		req.setAttribute("board", ndto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/admin/adminnoticemodify.jsp");
		return forward;
	}
}
