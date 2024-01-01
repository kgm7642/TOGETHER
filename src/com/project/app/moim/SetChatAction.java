package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimChatDTO;
import com.project.app.user.dao.UserDTO;

public class SetChatAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();
		MoimChatDTO mcdto = new MoimChatDTO();
		
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("session");
		
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		String moimchatcontents = req.getParameter("moimchatcontents");
		
		System.out.println("채팅내용: "+moimchatcontents);
		mcdto.setUserid(user.getUserid());
		mcdto.setMoimnum(moimnum);
		mcdto.setMoimchatcontents(moimchatcontents);
		mdao.insertMoimChat(mcdto);		
		return null;
	}
}
