package com.project.app.moim;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class SelectMoimNum implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		MoimDAO mdo = new MoimDAO();
		PrintWriter out = resp.getWriter();
		String moimnum = ""+mdo.getMoimNum();
		out.write(moimnum);
		out.close();		
		return null;
	}
}
