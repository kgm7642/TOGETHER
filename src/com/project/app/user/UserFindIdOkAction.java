package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;

public class UserFindIdOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println("UserFindIdOkAction 입장");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");

		UserDAO udao = new UserDAO();
		String userid = udao.findId(username, userphone);

		if(userid == null) {
			forward.setPath("/app/user/findidview.jsp?find=false");
			return forward;
		}
		req.setAttribute("userid",userid);
		System.out.println("아이디찾기완료");
			
		forward.setPath("/app/user/showIdview.jsp");
		return forward;
	}
}
