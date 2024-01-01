package com.project.app.moim;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class InsertMember implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		String userid = req.getParameter("userid");
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		MoimDAO mdo = new MoimDAO();
		mdo.InsertMember(userid, moimnum);
		PrintWriter out = resp.getWriter();
		out.close();		
		return null;
	}
}
