package com.project.app.moim;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.admin.dao.AdminDAO;
import com.project.app.moim.dao.MoimDAO;

public class AdMoimAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MoimDAO mdao = new MoimDAO();
//		리스트에서 보여달라고 요청한 페이지
		String temp = req.getParameter("page");
		String join = req.getParameter("join");
		String keyword = req.getParameter("keyword");
		
//		처음으로 리스트에 들어오는 중이라면 요청하고 있는 page번호가 없으므로 그때는 무조건 1번 페이지를 띄워줘야 한다.
		int page = temp == null?1:Integer.parseInt(temp);

//		한 페이지에 보여줄 게시글의 개수
		int pageSize = 10;

//		전체 게시글의 개수
		int totalCnt = mdao.getBoardCnt(keyword);
		
//		보여줘야 되는 마지막 게시글의 rownum
		int endRow = page*pageSize;
		
//		보여줘야 되는 첫번째 게시글의 rownum
		int startRow = endRow-pageSize+1;
		
//		아래쪽 페이징 처리의 보여지는 첫번째 페이지 번호
		int startPage = ((page-1)/pageSize)*pageSize+1;
//		아래쪽 페이징 처리의 보여져야 하는 마지막 페이지 번호를 연산으로 구한것
		int endPage = startPage + pageSize-1;
//		전체 개수를 기반으로 가장 마지막 페이지 번호
		int totalPage = (totalCnt-1)/pageSize + 1;
		
//		가장 마지막 페이지 번호보다 연산으로 구해진 endPage가 더 큰 경우도 있다.(허구의 페이지 번호)
//		그때는 endPage를 가장 마지막 페이지 번호로 바꿔준다.
		endPage = endPage>totalPage?totalPage:endPage;
		
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("page", page);
		req.setAttribute("startPage",startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("AdMoimList", mdao.getAdMoimList(startRow,endRow,keyword));
		req.setAttribute("keyword", keyword);
		req.setAttribute("join", join);
		
		ActionForward forward = new ActionForward();
		//해당 페이지에 띄워주어야 할 Board 객체들을 들고가기 때문에
		//request가 초기화되면 안된다. 무조건 forward 방식!!
		forward.setRedirect(false);
		forward.setPath("/app/moim/admoim.jsp");
		return forward;
	}
}
