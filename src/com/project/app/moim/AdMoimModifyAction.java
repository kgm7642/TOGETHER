package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimrecruitDTO;

public class AdMoimModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		
		String page = req.getParameter("page");
		int recruitnum = Integer.parseInt(req.getParameter("recruitnum"));
		MoimrecruitDTO mrdto = mdao.getRecruitDetail(recruitnum);
		req.setAttribute("moimrecruit", mrdto);
		req.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/moim/admodifymoim.jsp");
		return forward;
	}
}
