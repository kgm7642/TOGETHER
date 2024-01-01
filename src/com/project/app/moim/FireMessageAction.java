package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;

public class FireMessageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("FireMessageAction에서 정보 받기");
		String userid = req.getParameter("userid");
		System.out.println(userid);
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		System.out.println(moimnum);
		
		req.setAttribute("fire", userid);
		// 받아온 userid를 fire라는 값에 저장하기 때문에 뷰단에서 fire로 쓰면 userid가 뜸
		req.setAttribute("moim", moimnum);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/moim/fireMessage.jsp?userid=${userid}&moimnum=${moimnum}");
		return forward;
		
	}

}
