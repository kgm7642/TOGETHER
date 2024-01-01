package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class ApplyMoimJoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		String joinuserid = req.getParameter("joinuserid");
		if(req.getParameter("apply").equals("true")) {
			mdao.InsertMember(joinuserid, moimnum);
		}
		mdao.removeJoinList(joinuserid, moimnum);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/moim/ApplyMoimInfo.mo?moimnum="+moimnum);
		return forward;
	}
}
