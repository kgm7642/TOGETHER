package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class AdminRemoveMoimBoardAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();

        String page = req.getParameter("page");
        int recruitnum = Integer.parseInt(req.getParameter("recruitnum"));
        String admin = req.getParameter("admin");
        System.out.println(admin);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(true);

        if(mdao.selectCountReply(recruitnum) > 0) {
        	if(mdao.removeReply(recruitnum)&&mdao.removeRecruit(recruitnum)) {
        		forward.setPath(req.getContextPath()+"/admin/AdminMoimBoard.ad?remove=true&page="+page);
        	}else {
        		forward.setPath(req.getContextPath()+"/admin/AdminMoimBoard.ad?remove=false&page="+page);
        	}
            return forward;
        }else {
            if(mdao.removeRecruit(recruitnum)) {
            	forward.setPath(req.getContextPath()+"/admin/AdminMoimBoard.ad?remove=true&page="+page);
            }else {
            	forward.setPath(req.getContextPath()+"/admin/AdminMoimBoard.ad?remove=false&page="+page);
            }
            return forward;
        }
	}
}
