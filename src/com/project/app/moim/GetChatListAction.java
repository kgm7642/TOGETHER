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
import com.project.app.moim.dto.MoimChatDTO;

public class GetChatListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();	
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		
		System.out.println("채팅 업데이트");
		
		//현재 모임의 채팅정보를 담고있는 객체 리스트
		List<MoimChatDTO> chatList = mdao.getChatList(moimnum);		
		PrintWriter out = resp.getWriter();
		
		//JSON 배열 replies 생성
		JSONArray chats = new JSONArray();
		
		
		
		//빠른 for문을 통해 댓글 리스트(replyList)의 댓글 객체 하나씩 JSON객체에 저장
		for(MoimChatDTO chat : chatList) {
			//JSON 객체 replyItem 생성
			JSONObject chatItem = new JSONObject();
			chatItem.put("moimchatnum", chat.getMoimchatnum());
			chatItem.put("userid", chat.getUserid());
			chatItem.put("chatcontents", chat.getMoimchatcontents());
			chatItem.put("regdate", chat.getMoimchatdate());
			System.out.println(chat.getMoimchatcontents());
			chats.add(chatItem);
		}
		
		//댓글들을 JSON배열 형태(replies)로 파싱해서 뷰단에 전달
		out.println(chats.toJSONString());
		out.close();
		
		return null;
	}
}
