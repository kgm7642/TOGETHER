package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimDTO;

public class MoimChatAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		ActionForward forward = new ActionForward();
		MoimDTO moim = mdao.getDetail(moimnum);
		
		req.setAttribute("moim", moim);
		req.setAttribute("moimnum", moimnum);
		forward.setRedirect(false);
		forward.setPath("/app/moim/moimchat.jsp");
		return forward;
	}
}
