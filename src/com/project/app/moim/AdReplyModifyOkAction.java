package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimreplyDTO;

public class AdReplyModifyOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		MoimDAO mdao = new MoimDAO();
		MoimreplyDTO mrdto = new MoimreplyDTO();

		int replynum = Integer.parseInt(req.getParameter("replynum"));
		String replycontent = req.getParameter("replycontent");
		
		mrdto.setReplynum(replynum);
		mrdto.setReplycontents(replycontent);
		
		mdao.updateReply(mrdto);
		return null;
	}
}
