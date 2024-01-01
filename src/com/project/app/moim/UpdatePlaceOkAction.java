package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.PlaceDTO;

public class UpdatePlaceOkAction implements Action {
@Override
public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	req.setCharacterEncoding("UTF-8");
	MoimDAO mdao = new MoimDAO();
	PlaceDTO pdto = new PlaceDTO();
	
	//place 정보 변수에 세팅
	String placeroadaddr = "";
	String placeaddr = "";
	String placenum = req.getParameter("placenum");
	String placelat = req.getParameter("placelat");
	String placelng = req.getParameter("placelng");
	String placename = req.getParameter("placename");
	if(req.getParameter("placeroadaddr")!=null) {
		placeroadaddr = req.getParameter("placeroadaddr");
		placeaddr = req.getParameter("placeaddr");
	} else {
		placeaddr = req.getParameter("placeaddr");
	}
	String placecategoryname = req.getParameter("placecategoryname");
	String placephone = req.getParameter("placephone");
	
	System.out.println(placenum);
	System.out.println(placelat);
	System.out.println(placelng);
	System.out.println(placename);
	System.out.println(placeroadaddr);
	System.out.println(placeaddr);
	System.out.println(placecategoryname);
	System.out.println(placephone);
	
	int moimnum = mdao.getPMoimNum(Integer.parseInt(placenum));
	System.out.println(moimnum);
	
	//PlaceDTO에 가져온 값 저장
	pdto.setPlacenum(Integer.parseInt(placenum));
	pdto.setPlacelat(Double.parseDouble(placelat));
	pdto.setPlacelon(Double.parseDouble(placelng));
	pdto.setPlacename(placename);
	if(placeroadaddr!=null) {
		pdto.setPlaceroadaddr(placeroadaddr);
		pdto.setPlaceaddr(placeaddr);
	}else {
		pdto.setPlaceaddr(placeaddr);			
	}
	pdto.setPlacecategory(placecategoryname);
	pdto.setPlacephonenumber(placephone);
	
	ActionForward forward = new ActionForward();
	forward.setRedirect(true);
	if(mdao.updatePlace(pdto)) {
		
		forward.setPath(req.getContextPath()+"/moim/GetMoimInfo.mo?moimnum="+moimnum);
	} else {
		forward.setPath(req.getContextPath()+"/moim/UpdateMoim.mo?update=false");
	}
	
	return forward;
}
}
