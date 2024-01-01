package com.project.app.index;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.BoardDAO;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.moim.dto.MoimDTO;
import com.project.app.moim.dto.PlaceDTO;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class indexAction implements Action{
   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
      
      UserDAO udao = new UserDAO();
      MoimDAO mdao = new MoimDAO();
      
      HttpSession session = req.getSession();
      UserDTO user = (UserDTO)session.getAttribute("session");

	//세션이 비어있으면 홈 이동할때 이동이 안됨, 따라서 세션이 비어있는지 체크해야함
	//세션이 비어있다면 (로그인상태x) 바로 return
      if(session.getAttribute("session") == null) {
    	  ActionForward forward = new ActionForward();
          forward.setRedirect(true);
          forward.setPath(req.getContextPath()+"/index.jsp");
          return forward;
      }
      System.out.println("세션 비어있는지 확인(이게 출력되었다면 로그인 된거) : " + session.getAttribute("session"));
      
//오늘의 모임 담당 ---------------------------------------------------------------------------------------------------------------------------

      List<MoimDTO> todayMoimList = mdao.getTodayMoimList();
      req.setAttribute("todayMoimList", todayMoimList);

//인기 게시글 ---------------------------------------------------------------------------------------------------------------------------
      BoardDAO bdao = new BoardDAO();
      String temp = req.getParameter("page");
      
      int page = temp == null?1:Integer.parseInt(temp);
      int pageSize = 5;
      int totalCnt = bdao.getIndexBoardCnt();
      int endRow = page*pageSize;
      int startRow = endRow-pageSize+1;
      int startPage = ((page-1)/pageSize)*pageSize+1;
      int endPage = startPage + pageSize-1;
      int totalPage = (totalCnt-1)/pageSize + 1;

      endPage = endPage>totalPage?totalPage:endPage;
		
      req.setAttribute("totalPage", totalPage);
      req.setAttribute("totalCnt", totalCnt);
      req.setAttribute("page", page);
      req.setAttribute("startPage",startPage);
      req.setAttribute("endPage", endPage);
      req.setAttribute("boardList", bdao.getIndexBoardList(startRow,endRow));
      
//투데이 나의 모임 --------------------------------------------------------------------------------------------------------------
      
      int moimcnt = 0;
      moimcnt = mdao.getMaxTodayMoimNum(user.getUserid());
      if(moimcnt ==1) {
         int moimnum = mdao.getTodayMoimNum(user.getUserid());
         int placenum = mdao.getMPlaceNum(moimnum);
         
         MoimDTO moim = mdao.getDetail(moimnum);
         PlaceDTO place = mdao.getPlaceDetail(placenum);
         
         req.setAttribute("moim", moim);
         req.setAttribute("place", place);
         req.setAttribute("moimcnt", moimcnt);
      }else if (moimcnt >1) {
    	 System.out.println(moimcnt);
    	 List<MoimDTO> todayMyMoimList = mdao.getTodayMyMoimList(user.getUserid());
         req.setAttribute("todayMyMoimList", todayMyMoimList);
         req.setAttribute("moimcnt", moimcnt);
      }
      else if(moimcnt ==0) {
         req.setAttribute("moimcnt", moimcnt); 
      }
      
//친구 목록 ---------------------------------------------------------------------------------------------------------------------------

		String userid = user.getUserid();
		int totalCntF = udao.getIndexFollowCnt();
		int pageSizeF = 3;
		int endRowF = page * pageSizeF;
		int startRowF = endRowF - pageSizeF + 1;
		int startPageF = ((page - 1) / pageSizeF) * pageSizeF + 1;
		int endPageF = startPageF + pageSizeF - 1;
		int totalPageF = (totalCntF - 1) / pageSizeF + 1;
		endPageF = endPageF > totalPageF ? totalPageF : endPageF;

		
		req.setAttribute("totalPageF", totalPageF);
		req.setAttribute("totalCntF", totalCntF);
		req.setAttribute("page", page);
		req.setAttribute("startPageF", startPageF);
		req.setAttribute("endPageF", endPageF);
		req.setAttribute("FriendList", udao.getIndexFriendList(startRowF, endRowF, userid));

//------------------------------------------------------------------------------------------------------------------------------------ 
        
      ActionForward forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/index.jsp");
      return forward;
   }
}