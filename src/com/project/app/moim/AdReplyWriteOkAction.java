package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimreplyDTO;
import com.project.app.user.dao.UserDTO;

public class AdReplyWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();	
		MoimreplyDTO mrdto = new MoimreplyDTO();

		HttpSession session = req.getSession();
		UserDTO userid = (UserDTO)session.getAttribute("session");
		
		int recruitnum = Integer.parseInt(req.getParameter("recruitnum"));
		String replywriter = userid.getUserid();
		String replycontent = req.getParameter("replycontent");
		
		mrdto.setRecruitnum(recruitnum);
		mrdto.setReplywriter(replywriter);
		mrdto.setReplycontents(replycontent);
		
		mdao.insertADReply(mrdto);
		return null;
	}
}
