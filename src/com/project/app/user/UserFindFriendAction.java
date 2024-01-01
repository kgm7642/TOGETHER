package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class UserFindFriendAction {

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		System.out.println("UserFindFriendAction start");				
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		UserDAO udao = new UserDAO();
		ActionForward forward = new ActionForward();

		String followid = req.getParameter("followid");
		UserDTO user = udao.findFriend(followid);

		req.setAttribute("user", user);

		forward.setRedirect(false);
		forward.setPath("/app/user/showfriendview.jsp"); 
		System.out.println("clear! go PlusAction");		
		return forward;
	}	
}