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

public class ReplyListOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();	
		int recruitnum = Integer.parseInt(req.getParameter("recruitnum"));
		
		//현재 게시글의 댓글정보를 담고있는 객체 리스트
		List<MoimreplyDTO> replyList = mdao.getReplyList(recruitnum);
		PrintWriter out = resp.getWriter();
		
		//JSON 배열 replies 생성
		JSONArray replies = new JSONArray();
		
		//빠른 for문을 통해 댓글 리스트(replyList)의 댓글 객체 하나씩 JSON객체에 저장
		for(MoimreplyDTO reply : replyList) {
			//JSON 객체 replyItem 생성
			JSONObject replyItem = new JSONObject();
			replyItem.put("replynum", reply.getReplynum());
			replyItem.put("replywriter", reply.getReplywriter());
			replyItem.put("replycontents", reply.getReplycontents());
			replyItem.put("regdate", reply.getRegdate());
			replies.add(replyItem);
		}
		//댓글들을 JSON배열 형태(replies)로 파싱해서 뷰단에 전달
		out.println(replies.toJSONString());
		out.close();
		
		return null;
	}
}
