package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimDTO;

public class UpdateMoimOkAction implements Action {
@Override
public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	req.setCharacterEncoding("UTF-8");
	MoimDAO mdao = new MoimDAO();
	MoimDTO mdto = new MoimDTO();
			
	//moim 정보 변수에 세팅
	String moimnum = req.getParameter("moimnum");
	String moimname = req.getParameter("moimname");
	String moimtype[] = req.getParameterValues("moimtype");
	String moimbudget = req.getParameter("moimbudget");
	String startdate = req.getParameter("moimstartdate");
	String enddate = req.getParameter("moimenddate");
	System.out.println(moimnum);
	System.out.println(moimname);
	System.out.println(moimtype[0]);
	System.out.println(moimbudget);
	System.out.println(startdate);
	System.out.println(enddate);
	System.out.println("타입 넣어짐");
			
	//MoimDTO에 가져온 값 저장
	mdto.setMoimnum(Integer.parseInt(moimnum));
	mdto.setMoimname(moimname);
	mdto.setMoimtype(Integer.parseInt(moimtype[0]));
	mdto.setMoimbudget(Integer.parseInt(moimbudget));
	mdto.setStartdate(startdate);
	mdto.setEnddate(enddate);
	System.out.println(mdto.getMoimname());
	System.out.println(mdto.getEnddate());

	//db에 저장
	ActionForward forward = new ActionForward();
	forward.setRedirect(true);
	if(mdao.updateMoim(mdto)) {
		
		forward.setPath(req.getContextPath()+"/moim/GetMoimInfo.mo?moimnum="+moimnum);
		System.out.println("db수정");
	} else {
		forward.setPath(req.getContextPath()+"/moim/UpdateMoim.mo?update=false");
	}
	
	
	return forward;
}
}
