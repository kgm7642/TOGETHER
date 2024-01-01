package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class AdMoimWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		String userid = req.getParameter("userid");
		
		ActionForward forward = new ActionForward();
		req.setAttribute("MyMoimList", mdao.getMyMoimList(userid));
		req.setAttribute("page", req.getParameter("page"));
		
		forward.setRedirect(false);
		forward.setPath("/app/moim/admoimwrite.jsp");
		return forward;
	}
}
