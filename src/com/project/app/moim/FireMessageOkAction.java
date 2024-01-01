package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.FireMoimDTO;

public class FireMessageOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("FireMessageOkAction페이지로 이동은 됐음");
		FireMoimDTO fire = new FireMoimDTO();
		MoimDAO mdao = new MoimDAO();
		String userid = req.getParameter("userid");
		System.out.println(userid);
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		System.out.println(moimnum);
		String message = req.getParameter("message");
		System.out.println(message);
		
		fire.setUserid(userid);
		fire.setMoimnum(moimnum);
		fire.setMessage(message);
		
		mdao.fireMessage(fire);
		mdao.fireMember(userid);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/moim/GetMoimInfo.mo");
		return forward;
	}

}
