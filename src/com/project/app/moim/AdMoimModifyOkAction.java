package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimrecruitDTO;

public class AdMoimModifyOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();
		MoimrecruitDTO mrdto = new MoimrecruitDTO();
			
		String page = req.getParameter("page");
		String recruittitle = req.getParameter("recruittitle");
		String recruitcontents = req.getParameter("recruitcontents");
		int recruitnum = Integer.parseInt(req.getParameter("recruitnum"));
		
		mrdto.setRecruitnum(recruitnum);
		mrdto.setRecruittitle(recruittitle);
		mrdto.setRecruitcontents(recruitcontents);	
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(mdao.updateRecruit(mrdto)) {
			forward.setPath(req.getContextPath()+"/moim/AdMoimView.mo?boardnum="+recruitnum+"&page="+page+"&modify=true");
			return forward;
		}else {
			forward.setPath(req.getContextPath()+"/moim/AdMoimView.mo?boardnum="+recruitnum+"&page="+page+"&modify=false");
			return forward;
		}
	}
}
