package com.project.app.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dto.FollowDTO;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class UserFriendlistOKAction implements Action{

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("session");// 유저 받아옴
		List<FollowDTO> FriendInfo = udao.listFriend(user.getUserid());
		req.setAttribute("follows", FriendInfo);
//		System.out.println(FriendInfo.get(0).getFollowid());
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/user/friendlistview.jsp");
		System.out.println("clear! go view");
		return forward;
	}
}