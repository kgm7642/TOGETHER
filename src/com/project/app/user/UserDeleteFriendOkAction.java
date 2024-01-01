package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class UserDeleteFriendOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		HttpSession session = req.getSession();
		System.out.println("UserDeleteFriendOKAction.java 시작");	
		UserDTO user = (UserDTO)session.getAttribute("session");
		//String userid = req.getParameter("userid");
		String followid = req.getParameter("followid");	
		System.out.println("followid :"+followid);
		System.out.println("userid :"+user.getUserid());
		//System.out.println(userid);
		udao.deleteMyFriend(user.getUserid(),followid);
		System.out.println(1);	
		ActionForward forward = new ActionForward();		
		System.out.println(2);
//		System.out.println(followid); null값으로 받아와짐
//		mdao.findFriendtwo(followid);
		System.out.println(3);		
		req.setAttribute("follows", udao.listFriend(user.getUserid()));
		System.out.println(4);
		forward.setRedirect(false);
		forward.setPath("/app/user/friendlistview.jsp");		
		return forward;
	}
}