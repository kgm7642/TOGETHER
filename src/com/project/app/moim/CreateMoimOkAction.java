package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimDTO;
import com.project.app.user.dao.UserDTO;

public class CreateMoimOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		MoimDAO mdao = new MoimDAO();
		MoimDTO mdto = new MoimDTO();
				
		//moim 정보 변수에 세팅
		String moimname = req.getParameter("moimname");
		String moimtype[] = req.getParameterValues("moimtype");
		String moimbudget = req.getParameter("moimbudget");
		String moimstartdate = req.getParameter("moimstartdate");
		String moimenddate = req.getParameter("moimenddate");
		String moimkingid = req.getParameter("moimkingid");
		String placenum = req.getParameter("placenum");
				
		//MoimDTO에 가져온 값 저장
		mdto.setMoimname(moimname);
		mdto.setMoimtype(Integer.parseInt(moimtype[0]));
		mdto.setMoimbudget(Integer.parseInt(moimbudget));
		mdto.setStartdate(moimstartdate);
		mdto.setEnddate(moimenddate);
		mdto.setUserid(moimkingid);
		mdto.setPlacenum(Integer.parseInt(placenum));

		//db에 저장
		mdao.insertMoim(mdto);
		
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("session");
		
		String userid = user.getUserid();
		int moimnum = mdao.selectMoimNum();
		mdao.InsertMember(userid, moimnum);

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/moim/CompleteMoim.mo?placenum="+placenum);
		return forward;
	}
}
