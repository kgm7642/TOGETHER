package com.project.app.moim;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class AdMoimDislikeOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();	
		int recruitnum = Integer.parseInt(req.getParameter("recruitnum"));
		
		PrintWriter out = resp.getWriter();
		
		mdao.updateDislikeRecruitnum(recruitnum);
		int dislike = mdao.getDislikeRecruitnum(recruitnum);
		
		JSONObject dislikeCnt = new JSONObject();
		dislikeCnt.put("dislikeCnt", dislike);
		
		out.println(dislikeCnt.toJSONString());
		out.close();
		
		return null;
	}
}
