package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;

public class UserLoginOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		HttpSession session = request.getSession();
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		if(udao.login(userid, userpw)) {
			System.out.println("로그인 아이디 :"+userid);
			session.setAttribute("session", udao.getDetail(userid));
			forward = new ActionForward(true,request.getContextPath()+"/index/Index.ix"); //로그인 후 이동할 페이지
		}else {
			forward = new ActionForward(true, request.getContextPath()+"/app/user/loginview.jsp?flag=false");
		}
		return forward;
	}
}