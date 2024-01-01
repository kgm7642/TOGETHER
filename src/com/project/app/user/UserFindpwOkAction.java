package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;

public class UserFindpwOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println("UserFindpwOkAction 시작");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		String userid = req.getParameter("userid");
		String userphone = req.getParameter("userphone");
		
		UserDAO udao = new UserDAO();
		String userpw = udao.findpw(userid, userphone);
		
		if(userpw == null) {
			forward.setPath("/app/user/findpwview.jsp?find=false");
			return forward;
		}
		req.setAttribute("userpw", userpw);
		System.out.println("비밀번호찾기완료");
		
		forward.setPath("/app/user/showpwview.jsp");
		return forward;
	}
}
