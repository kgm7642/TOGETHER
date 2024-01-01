package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;

public class DeleteFollowingOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("UserDeleteFriendOKAction.java 시작");	

		UserDAO udao = new UserDAO();
		
		String userid = req.getParameter("userid");
		String followid = req.getParameter("followid");	
		System.out.println("followid :"+followid);
		System.out.println("userid :"+userid);
		
		udao.deleteMyFriend(userid,followid);
		
		ActionForward forward = new ActionForward();		
		
		req.setAttribute("follows", udao.listFriend(userid));
		
		forward.setRedirect(false);
		forward.setPath("/app/user/friendlistview.jsp");		
		return forward;
	}
}