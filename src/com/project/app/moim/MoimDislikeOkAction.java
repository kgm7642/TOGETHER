package com.project.app.moim;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimreplyDTO;

public class MoimDislikeOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();	
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		
		PrintWriter out = resp.getWriter();
		
		mdao.updateDislike(moimnum);
		int dislike = mdao.getDislike(moimnum);
		
		JSONObject dislikeCnt = new JSONObject();
		dislikeCnt.put("dislikeCnt", dislike);
		
		out.println(dislikeCnt.toJSONString());
		out.close();
		
		return null;
	}
}
