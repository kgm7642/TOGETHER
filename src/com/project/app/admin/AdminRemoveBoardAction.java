package com.project.app.admin;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.BoardDAO;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.FileDTO;

public class AdminRemoveBoardAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao = new FileDAO();
		int boardnum = Integer.parseInt(req.getParameter("boardnum"));
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		String saveFolder = "D:\\web_file";
		
		List<FileDTO> files = fdao.getFiles(boardnum);
		if(files.size()>0) {
			for(FileDTO f : files) {
				File file = new File(saveFolder,f.getSystemname());
				if(file.exists()) {
					file.delete();
				}
				fdao.deleteFileByName(f.getSystemname());
			}
		}
		bdao.deleteBoardReply(boardnum);
		
		if(bdao.removeBoard(boardnum)) {
			forward.setPath(req.getContextPath()+"/admin/AdminBoardList.ad?delete=true");
		}else {
			forward.setPath(req.getContextPath()+"/admin/AdminBoardView.ad");
		}
		return forward;
	}
}
