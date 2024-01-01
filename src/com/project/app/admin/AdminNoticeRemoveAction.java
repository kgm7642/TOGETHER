package com.project.app.admin;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.admin.dao.AdminDAO;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.FileDTO;

public class AdminNoticeRemoveAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		AdminDAO adao = new AdminDAO();
		
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(adao.removeNotice(boardnum)) {
			forward.setPath(req.getContextPath()+"/admin/AdminNoticeList.ad?delete="+boardnum);
		}else {
			forward.setPath(req.getContextPath()+"/admin/AdminNoticeView.ad?boardnum="+boardnum);
		}
		return forward;
	}
}
