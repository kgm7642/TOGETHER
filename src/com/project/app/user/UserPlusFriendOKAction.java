package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dto.FollowDTO;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class UserPlusFriendOKAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		FollowDTO fdto = new FollowDTO();
		
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("session");
		String followid = req.getParameter("followid");		
		
		fdto.setUserid(user.getUserid());
		fdto.setFollowid(followid);
		
		udao.insertMyFriend(fdto);
		
		ActionForward forward = new ActionForward();		
		
		forward.setRedirect(false);
		forward.setPath("/user/UserFriendListOK.us");		
		return forward;
	}
}