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

public class UserFollowingListOKAction implements Action{

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		System.out.println("UserFollowingListOKAction");
		UserDAO udao = new UserDAO();
		System.out.println(1);
		UserDTO user = (UserDTO)session.getAttribute("session");// 유저 받아옴
		List<FollowDTO> FriendInfo = udao.followingList(user.getUserid());
		System.out.println(user.getUserid());
		req.setAttribute("users", FriendInfo);
		System.out.println(3);
		ActionForward forward = new ActionForward();
		System.out.println(4);
		forward.setRedirect(false);
		forward.setPath("/app/user/followinglist.jsp");
		System.out.println("clear! go view");
		return forward;
	}
}