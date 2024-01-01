package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimrecruitDTO;

public class AdMoimWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		MoimDAO mdao = new MoimDAO();
		MoimrecruitDTO mrdto = new MoimrecruitDTO();
		String page = req.getParameter("page");
		
		String recruittitle = req.getParameter("recruittitle");
		String userid = req.getParameter("userid");
		String recruitcontents = req.getParameter("recruitcontents");
		int moimnum = Integer.parseInt(req.getParameter("moimselect"));
			
		mrdto.setRecruittitle(recruittitle);
		mrdto.setUserid(userid);
		mrdto.setRecruitcontents(recruitcontents);
		mrdto.setMoimnum(moimnum);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(mdao.insertRecruit(mrdto)) {
			int recruitnum = mdao.getLastNum(userid);
			forward.setPath(req.getContextPath()+"/moim/AdMoimView.mo?page="+page+"&write=true&boardnum="+recruitnum);
			return forward;
		}else {
			forward.setPath(req.getContextPath()+"/moim/AdMoimView.mo?page="+page+"&write=false");
			return forward;
		}		
	}
}
