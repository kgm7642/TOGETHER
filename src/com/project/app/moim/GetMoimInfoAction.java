package com.project.app.moim;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimDTO;
import com.project.app.moim.dto.PlaceDTO;
import com.project.app.user.dao.UserDTO;

public class GetMoimInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("getmoimokaction이동 완료");
		MoimDAO mdao = new MoimDAO();
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));// moimnum 정상적으로 불러와짐
//		모임에서 플레이스넘 찾아
		int placenum = mdao.getMPlaceNum(moimnum);
		//placenum 변수에 moimnum으로 찾은 placenum 가져오기
		MoimDTO moim = mdao.getDetail(moimnum);
		PlaceDTO place = mdao.getPlaceDetail(placenum);

		List<String> members = mdao.getUserid(moimnum);
		
		ArrayList<UserDTO> MemberInfo = new ArrayList<>();
		for (String member : members) {
			MemberInfo.add(mdao.getMemberInfo(member));
		}
		
		req.setAttribute("moim", moim);
		req.setAttribute("place", place);
		req.setAttribute("members", MemberInfo);
		System.out.println("정보확인완료");
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/app/moim/getmoiminfo.jsp");
		return forward;
	}
}
