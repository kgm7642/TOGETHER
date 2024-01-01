package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.PlaceDTO;

public class UpdatePlaceAction implements Action {
@Override
public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	MoimDAO mdao = new MoimDAO();
	int moimnum = Integer.parseInt(req.getParameter("moimnum"));
	int placenum = mdao.getMPlaceNum(moimnum);
	PlaceDTO place = mdao.getPlaceDetail(placenum);
	req.setAttribute("place", place);
	System.out.println("place정보 받아짐");
	ActionForward forward = new ActionForward();
	forward.setRedirect(false);
	forward.setPath("/app/moim/updateplace.jsp");
	return forward;
}
}
