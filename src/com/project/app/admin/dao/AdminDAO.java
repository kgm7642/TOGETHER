package com.project.app.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.app.board.dao.BoardDTO;
import com.project.app.board.dao.NoticeDTO;
import com.project.app.moim.dto.MoimDTO;
import com.project.app.moim.dto.MoimrecruitDTO;
import com.project.mybatis.SqlMapConfig;

public class AdminDAO {
	SqlSession sqlsession;

	public AdminDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	// 모임
	public List<MoimDTO> getMoimListAdmin(int startRow, int endRow,String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<MoimDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//		selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Admin.getMoimListAdmin",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Admin.getMoimListWithKeyAdmin",datas);
		}
		
		return result;
	}
	
	// 홍보 게시판
	public List<MoimrecruitDTO> getAdMoimListAdmin(int startRow, int endRow, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<MoimrecruitDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//			selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Admin.getAdMoimListAdmin",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Admin.getAdMoimListWithKeyAdmin",datas);
		}
		return result;
	}
	
	// 게시판
	public List<BoardDTO> getBoardListAdmin(int startRow, int endRow,String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<BoardDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//			selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Admin.getBoardListAdmin",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Admin.getBoardListWithKeyAdmin",datas);
		}
		
		return result;
	}
	
	// 공지사항
	public List<NoticeDTO> getNoticeList(int startRow, int endRow,String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<NoticeDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//			selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Admin.getNoticeList",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Admin.getNoticeListWithKeyAdmin",datas);
		}
		
		return result;
	}
	
	public boolean insertNotice(NoticeDTO notice) {
		return 1 == sqlsession.insert("Admin.insertNotice",notice);
	}
	
	public int getLastNumNotice(String userid) {
		return sqlsession.selectOne("Admin.getLastNumNotice",userid);
	}

	public NoticeDTO getDetailNotice(int boardnum) {
		return sqlsession.selectOne("Admin.getDetailNotice",boardnum);
	}
	public boolean updateNotice(NoticeDTO board) {
		return 1 == sqlsession.update("Admin.updateNotice",board);
	}
	
	public boolean removeNotice(int boardnum) {
		return 1 == sqlsession.delete("Admin.removeNotice",boardnum);
	}

	public int getNoticeCnt(String keyword) {
		if(keyword == null) {
			return sqlsession.selectOne("Admin.getNoticeCnt");
		}else {
			return sqlsession.selectOne("Admin.getNoticeCntWithKey",keyword);
		}
	}
}