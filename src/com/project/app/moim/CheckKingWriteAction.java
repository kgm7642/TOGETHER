package com.project.app.moim;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class CheckKingWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		MoimDAO mdao = new MoimDAO();
		String userid = req.getParameter("userid");
		PrintWriter out = resp.getWriter();
		if(mdao.checkKing(userid)){
			out.write("O");
		}
		out.close();
		return null;
	}
}
