package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.user.dao.UserDTO;

public class OutMoimAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("session");
		String userid = user.getUserid();
		
		// 모임 탈퇴
		mdao.outMoim(moimnum, userid);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/moim/MyMoim.mo?out=true");
		return forward;
	}
}
