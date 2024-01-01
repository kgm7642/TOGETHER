package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimjoinDTO;
import com.project.app.user.dao.UserDTO;

public class AdMoimJoinOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		MoimjoinDTO mjdto = new MoimjoinDTO();
		HttpSession session = req.getSession();
		UserDTO userid = (UserDTO)session.getAttribute("session");
		String kingid = req.getParameter("kingid");
		String isSearch = req.getParameter("isSearch");
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		String moimjoincontents = req.getParameter("moimjoincontents");
		
		mjdto.setKinguserid(kingid);
		mjdto.setJoinuserid(userid.getUserid());
		mjdto.setMoimnum(moimnum);
		mjdto.setJoincontents(moimjoincontents);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(req.getParameter("isSearch").equals("false")) {
			if(mdao.insertJoinMoim(mjdto)) {
				forward.setPath(req.getContextPath()+"/moim/AdMoim.mo?join=true");
				return forward;
			}else {
				forward.setPath(req.getContextPath()+"/moim/AdMoim.mo?join=false");
				return forward;
			}
		}else {
			if(mdao.insertJoinMoim(mjdto)) {
				forward.setPath(req.getContextPath()+"/moim/SearchMoim.mo?join=true");
				return forward;	
			}else {
				forward.setPath(req.getContextPath()+"/moim/SearchMoim.mo?join=false");
				return forward;	
			}	
		}
	}
}
