package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.admin.dao.AdminDAO;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.FileDTO;
import com.project.app.board.dao.NoticeDTO;

public class AdminNoticeWriteOKAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		BoardDAO bdao = new BoardDAO();
		AdminDAO adao = new AdminDAO();
		
		String boardtitle = req.getParameter("boardtitle");
		String contents = req.getParameter("contents");
		String userid = req.getParameter("userid");

		
		NoticeDTO ndto = new NoticeDTO();
		ndto.setBoardtitle(boardtitle);
		System.out.println("boardtitle : " + boardtitle);
		ndto.setContents(contents);
		System.out.println("contents : " + contents);
		ndto.setUserid(userid);
		System.out.println("userid : " + userid);

		

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(adao.insertNotice(ndto)) {
			int boardnum = adao.getLastNumNotice(userid);
			forward.setPath(req.getContextPath()+"/admin/AdminNoticeView.ad?boardnum="+boardnum);
			return forward;
			//bdao.deleteBoard(boardnum);	
		}
		forward.setPath(req.getContextPath()+"/admin/AdminNoticeList.ad?flag=false");
		return forward;
	}
}
