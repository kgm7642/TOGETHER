package com.project.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimDTO;
import com.project.app.moim.dto.MoimrecruitDTO;
import com.project.app.moim.dto.PlaceDTO;
import com.project.app.user.dao.UserDTO;

public class AdminMoimBoardViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int recruitnum = Integer.parseInt(req.getParameter("boardnum"));
		int moimnum = Integer.parseInt(mdao.getMoimNumWithRtnum(recruitnum));
		
		int placenum = mdao.getMPlaceNum(moimnum);
		MoimDTO moim = mdao.getDetail(moimnum);
		PlaceDTO place = mdao.getPlaceDetail(placenum);

		HttpSession session = req.getSession();
		UserDTO userid = (UserDTO)session.getAttribute("session");
		MoimrecruitDTO mdto = mdao.getRecruitDetail(recruitnum);
		String keyword = req.getParameter("keyword");
		
		req.setAttribute("moim", moim);
		req.setAttribute("place", place);
		req.setAttribute("page", req.getParameter("page"));
		req.setAttribute("moimrecruit", mdto);
		req.setAttribute("keyword", keyword);
//		req.setAttribute("replies",mdao.getReplies(recruitnum));
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/admin/adminadmoimview.jsp");
		return forward;
	}
}
