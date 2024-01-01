package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimDTO;

public class AdMoimJoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		String isSearch = req.getParameter("isSearch");
		
		String kingid = mdao.getKingId(moimnum);
		MoimDTO mdto = mdao.getMoim(moimnum);
		
		ActionForward forward = new ActionForward();
		req.setAttribute("kingid", kingid);
		req.setAttribute("moimnum", moimnum);
		req.setAttribute("moim", mdto);
		req.setAttribute("isSearch", isSearch);
		forward.setRedirect(false);
		forward.setPath("/app/moim/adjoinmoim.jsp");
		return forward;
	}
}