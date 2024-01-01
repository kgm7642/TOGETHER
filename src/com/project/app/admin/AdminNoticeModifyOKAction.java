package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.admin.dao.AdminDAO;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.NoticeDTO;

public class AdminNoticeModifyOKAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		BoardDAO bdao = new BoardDAO();
		AdminDAO adao = new AdminDAO();
		NoticeDTO ndto = new NoticeDTO();
		
		String boardtitle = req.getParameter("boardtitle");
		System.out.println("수정한 boardtitle : " + boardtitle);
		String contents = req.getParameter("contents");
		System.out.println("수정한 contents : " + contents);
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		System.out.println("수정한 boardnum : " + boardnum);
				
		ndto.setBoardtitle(boardtitle);
		ndto.setContents(contents);
		ndto.setBoardnum(boardnum);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(adao.updateNotice(ndto)) {
			forward.setPath(req.getContextPath()+"/admin/AdminNoticeView.ad?update=true&boardnum="+boardnum);
		} else {
			forward.setPath(req.getContextPath()+"/admin/AdminNoticeList.ad");
		}
		return forward;
	}
}
