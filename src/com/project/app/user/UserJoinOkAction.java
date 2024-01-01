package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class UserJoinOkAction {
	public ActionForward execute(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		UserDTO newUser = new UserDTO();
		UserDAO udao = new UserDAO();
		newUser.setUserid(req.getParameter("userid"));
		newUser.setUserpw(req.getParameter("userpw"));
		newUser.setUsername(req.getParameter("username"));
		newUser.setUseraddr(req.getParameter("useraddr"));
		newUser.setUseraddrd(req.getParameter("useraddrd"));
		newUser.setUserphone(req.getParameter("userphone"));
		newUser.setUseremail(req.getParameter("useremail"));
		newUser.setUsergender(req.getParameter("usergender"));
		

		ActionForward forward = null;
		if(udao.join(newUser)) {
			forward = new ActionForward();
			//어떤 방식으로 이동할 것인지(redirect / forward)
			forward.setRedirect(true);
			//어떤 페이지로 이동할 것인지(forward : 앞의 root가 남아있음 / redirect : 재요청이기 때문에 cp 연결) 
		}
		forward.setPath(req.getContextPath()+"/user/UserLogin.us?userid="+req.getParameter("userid"));
		System.out.println("회원가입 완료");
		return forward;
	}
	
}








