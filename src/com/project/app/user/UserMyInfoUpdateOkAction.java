package com.project.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class UserMyInfoUpdateOkAction implements Action{
	public ActionForward execute(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		UserDTO user = new UserDTO();
		UserDAO udao = new UserDAO();
		
		System.out.println("내정보수정 입장");
		
		HttpSession session = req.getSession();
		UserDTO userInfo = (UserDTO)session.getAttribute("session");
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		String username = req.getParameter("username");
		String useraddr = null;
		String useraddrd = null;
		
		//주소 비어있는지 확인
		if(req.getParameter("useraddr") != "") {
			useraddr = req.getParameter("useraddr");
			user.setUseraddr(useraddr);
		}
		//상세주소 비어있는지 확인
		if(req.getParameter("useraddrd") != "") {
			useraddrd = req.getParameter("useraddrd");
			user.setUseraddrd(useraddrd);
		}
		
		String userphone = req.getParameter("userphone");
		String useremail = req.getParameter("useremail");
		
		user.setUserid(userid);
		user.setUserpw(userpw);
		if(req.getParameter("useraddr") == "") {
			user.setUseraddr(userInfo.getUseraddr());
		}
		if(req.getParameter("useraddrd") == "") {
			user.setUseraddrd(userInfo.getUseraddrd());
		}
		user.setUsername(username);
		user.setUserphone(userphone);
		user.setUseremail(useremail);
	
		ActionForward forward =  new ActionForward();
		forward.setRedirect(true);
	
		if(udao.updatemyinfo(user)) {
			//어떤 방식으로 이동할 것인지(redirect / forward)
			//어떤 페이지로 이동할 것인지(forward : 앞의 root가 남아있음 / redirect : 재요청이기 때문에 cp 연결) 
			UserDTO updateuser = udao.getUser(userid);
			
			req.setAttribute("updateuser",updateuser);
			System.out.println(updateuser.getUserphone());
			
			
			session.setAttribute("userid", userid);
			session.setAttribute("userpw", userpw);
			session.setAttribute("username", username);
			if(req.getParameter("useraddr") != "") {
				session.setAttribute("useraddr", useraddr);				
			}
			if(req.getParameter("useraddrd") != "") {
				session.setAttribute("useraddrd", useraddrd);
			}
			session.setAttribute("userphone", userphone);
			session.setAttribute("useremail", useremail);
			
			forward.setPath(req.getContextPath()+"/app/user/myinfoupdate.jsp"); 
			session.setAttribute("session", updateuser);
			System.out.println("회원수정 완료");
		}
		else {
			forward.setPath("/app/user/mypageview.jsp?flag=false");
		}
		
		return forward;
	}
}