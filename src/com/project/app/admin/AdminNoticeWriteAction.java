package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;

public class AdminNoticeWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionForward forward = new ActionForward();
		req.setAttribute("page", req.getParameter("page"));
		
		forward.setRedirect(false);
		forward.setPath("/app/admin/adminnoticewrite.jsp");
		return forward;
	}
}
