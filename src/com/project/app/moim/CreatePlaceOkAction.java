package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.PlaceDTO;

public class CreatePlaceOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		MoimDAO mdao = new MoimDAO();
		PlaceDTO pdto = new PlaceDTO();
		
		//place 정보 변수에 세팅
		String placeroadaddr = "";
		String placeaddr = "";
		
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
		
		//PlaceDTO에 가져온 값 저장
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
		
		mdao.insertPlace(pdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/moim/CreateMoim.mo");
		return forward;
	}
}
