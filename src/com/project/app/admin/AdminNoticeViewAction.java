package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.admin.dao.AdminDAO;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.NoticeDTO;
import com.project.app.user.dao.UserDTO;

public class AdminNoticeViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		AdminDAO adao = new AdminDAO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		UserDTO userid = (UserDTO)session.getAttribute("session");
		NoticeDTO ndto = adao.getDetailNotice(boardnum);
		String keyword = req.getParameter("keyword");
		
		req.setAttribute("board", ndto);
		req.setAttribute("keyword", keyword);
		
		forward.setRedirect(false);
		forward.setPath("/app/admin/adminnoticeview.jsp");
		return forward;
	}
}
