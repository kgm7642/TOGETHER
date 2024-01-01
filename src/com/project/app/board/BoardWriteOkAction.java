package com.project.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.FileDTO;

public class BoardWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");

		BoardDAO bdao = new BoardDAO();
		
		//파일이 저장될 경로
		String saveFolder = "D:\\web_file";
		//저장될 파일의 크기(5MB)	
		int size = 1024*1024*5;
		
		//cos
		//form에서 enctype을 multipart/form-data 로 보냈다면 필요한 객체(파일 업로드)
		MultipartRequest multi = new MultipartRequest(req, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		//<input type="file"> 중에 name이 file1 인 태그로 올린 파일이 있다면, 그 파일이 폴더에 저장되어 있는 이름
		String filename1 = multi.getFilesystemName("file1");
		System.out.println("filename1 : " + filename1);
		if(filename1 == null) {
			fcheck1 = true;
		}
		//파일을 올릴 때 사용자가 올렸던 이름(다운로드시에는 이 이름으로 다운로드 되게 해야함)
		String orgname1 = multi.getOriginalFileName("file1");
	
		String filename2 = multi.getFilesystemName("file2");
		System.out.println("filename2 : " + filename2);
		if(filename2 == null) {
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("file2");
		
		String boardtitle = multi.getParameter("boardtitle");
		String contents = multi.getParameter("contents");
		String userid = multi.getParameter("userid");
		int category = Integer.parseInt(multi.getParameter("category"));

		
		BoardDTO board = new BoardDTO();
		board.setBoardtitle(boardtitle);
		System.out.println("boardtitle : " + boardtitle);
		board.setContents(contents);
		System.out.println("contents : " + contents);
		board.setUserid(userid);
		System.out.println("userid : " + userid);
		board.setCategory(category);
		System.out.println("category : " + category);

		
		
		int boardnum = 0;
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(bdao.insertBoard(board)) {
			boardnum = bdao.getLastNum(userid);
			FileDAO fdao = new FileDAO();
			if(!fcheck1) {
//				file1의 정보를 TEST_FILE 테이블에 꽂아넣기
//				성공했다면 fcheck1 = true;
				FileDTO file = new FileDTO();
				file.setSystemname(filename1);
				file.setOrgname(orgname1);
				file.setBoardnum(boardnum);
				
				fcheck1 = fdao.insertFile(file);
			}
			if(!fcheck2) {
				FileDTO file = new FileDTO();
				file.setSystemname(filename2);
				file.setOrgname(orgname2);
				file.setBoardnum(boardnum);
				
				fcheck2 = fdao.insertFile(file);
			}
			System.out.println("파일까지 확인");
			
			
			if(fcheck1 && fcheck2) {
				forward.setPath(req.getContextPath()+"/board/BoardView.bo?boardnum="+boardnum);
				return forward;
			}
			//bdao.deleteBoard(boardnum);
				
		}
		forward.setPath(req.getContextPath()+"/board/BoardList.bo?flag=false");
		return forward;
	}
}




