package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimjoinDTO;

public class ApplyMoimInfo_cAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int moimjoinnum = Integer.parseInt(req.getParameter("moimjoinnum"));			
		String moimname = req.getParameter("moimname");
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		
		MoimjoinDTO mjdto = mdao.getMoimJoin(moimjoinnum);
		
		ActionForward forward = new ActionForward();
		
		
		req.setAttribute("moimname", moimname);
		req.setAttribute("moimjoin", mjdto);
		req.setAttribute("moimnum", moimnum);
		forward.setRedirect(false);
		forward.setPath("/app/moim/applymoiminfo_c.jsp");
		return forward;
	}
}
