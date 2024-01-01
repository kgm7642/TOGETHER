package com.project.app.moim;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimjoinDTO;

public class ApplyMoimInfoAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		//모임 신청 정보 다 가져왔음
		List<MoimjoinDTO> moimjoinList = mdao.getMoimJoinList(moimnum);
		
		ActionForward forward = new ActionForward();
		req.setAttribute("moimname", mdao.getMoim(moimnum).getMoimname());
		req.setAttribute("MoimJoinList", moimjoinList);
		req.setAttribute("moimnum", moimnum);
		forward.setRedirect(false);
		forward.setPath("/app/moim/applymoiminfo.jsp");
		return forward;
	}
}
