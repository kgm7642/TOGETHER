package com.project.app.moim;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.moim.dao.MoimDAO;

public class CancelMoimAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
		int moimnum = Integer.parseInt(req.getParameter("moimnum"));
		System.out.println(moimnum);
		
		//채팅 삭제 기능 추가
		mdao.deleteChat(moimnum);
		mdao.deleteMembers(moimnum);
		mdao.deleteFireMoim(moimnum);
		mdao.deleteMoimJoin(moimnum);
		
		// moimnum으로 홍보게시글의 recruitnums 모두 가져와서 for문 돌려야함
		List<Integer> recruitnums = mdao.getRecruitnums(moimnum);
		// recruitnums 없으면 (게시글 없으면) if문 그냥 지나감
		if(recruitnums.size() > 0) {
			System.out.println(recruitnums);
			for(Integer recruitnum : recruitnums) {
				mdao.deleteRReply(recruitnum.intValue());
				mdao.deleteRecruit(recruitnum.intValue());
			}
		}
			
		int placenum = mdao.getMPlaceNum(moimnum);
		System.out.println(placenum);
		mdao.deleteMoim(moimnum);
		mdao.deletePlace(placenum);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward = new ActionForward(true,req.getContextPath()+"/moim/MyMoim.mo");
		
		return forward;
	}
}
