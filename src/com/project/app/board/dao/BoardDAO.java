package com.project.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSession sqlsession;
	
	public BoardDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	
//				게시판 파트 기능 리스트				담당자
	
//				<게시판 리스트>						원희
//				<게시글 상세>						원희
//				<게시글 댓글>						원희
	
	
//	< - - - - - <게시판 리스트> - - - - - >

	
//	< - - - - - <SELECT> - - - - - >
	
	
	public int getBoardCnt(String keyword) {
		if(keyword == null) {
			return sqlsession.selectOne("Board.getBoardCnt");
		}else {
			return sqlsession.selectOne("Board.getBoardCntWithKey",keyword);
		}
	}
	
//	< - - - - - <SELECT-LIST> - - - - - >
	
	public List<BoardDTO> getBoardList(int startRow, int endRow,String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<BoardDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//			selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Board.getBoardList",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Board.getBoardListWithKey",datas);
		}
		
		return result;
	}
	
	
//	< - - - - - <게시글 상세> - - - - - >

	
//	< - - - - - <SELECT> - - - - - >
	

	public BoardDTO getDetail(int boardnum) {
		return sqlsession.selectOne("Board.getDetail",boardnum);
	}
	
	public int getLastNum(String userid) {
		return sqlsession.selectOne("Board.getLastNum",userid);
	}
	
	public int getLikes(int boardnum) {
		return sqlsession.selectOne("Board.likecnt",boardnum);
	}
	
	public int getHates(int boardnum) {
		return sqlsession.selectOne("Board.hatecnt",boardnum);
	}
	
//	< - - - - - <게시글 댓글> - - - - - >
	
//	< - - - - - <SELECT-LIST> - - - - - >
	
	public List<ReplyDTO> getReplies(int boardnum) {
		return sqlsession.selectList("Board.getReplies",boardnum);
	}
	
	
//	< - - - - - <게시글 상세> - - - - - >

	
//	< - - - - - <INSERT> - - - - - >
	
	
	public boolean insertBoard(BoardDTO board) {
		return 1 == sqlsession.insert("Board.insertBoard",board);
	}
	
//	< - - - - - <게시글 댓글> - - - - - >
	
	public boolean insertReply(ReplyDTO newReply) {
		return 1 == sqlsession.insert("Board.insertReply",newReply);
	}
	
	
//	< - - - - - <게시글 상세> - - - - - >

	
//	< - - - - - <UPDATE> - - - - - >
	
	
	public boolean updateBoard(BoardDTO board) {
		return 1 == sqlsession.update("Board.updateBoard",board);
	}
	
	public void updateViews(int boardnum) {
		sqlsession.update("Board.updateViews",boardnum);
	}

	public void boardLike(BoardDTO board) {
		sqlsession.update("Board.boardlike",board);
	}
	
	public void boardHate(BoardDTO board) {
		sqlsession.update("Board.boardhate",board);
	}
	
//	< - - - - - <게시글 댓글> - - - - - >
	
//	< - - - - - <UPDATE> - - - - - >
	
	public boolean modifyReply(int replynum, String contents) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("replynum",replynum);
		datas.put("contents",contents);
		return 1 == sqlsession.update("Board.modifyReply",datas);
	}

	
//	< - - - - - <게시글 상세> - - - - - >

	
//	< - - - - - <DELETE> - - - - - >
	

	public boolean removeBoard(int boardnum) {
		return 1 == sqlsession.delete("Board.removeBoard",boardnum);
	}
	
//	< - - - - - <게시글 댓글> - - - - - >
	
	public boolean deleteReply(int replynum) {
		return 1 == sqlsession.delete("Board.deleteReply",replynum);
	}


	public int getIndexBoardCnt() {
		return sqlsession.selectOne("Board.getIndexBoardCnt");
	}
	
	
	public List<BoardDTO> getIndexBoardList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		
//		쿼리문의 수행 결과가 여러 행일 경우 selectOne으로 검색해오면 맨 윗줄로 객체 한개 만들어서 리턴
//		selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
		List<BoardDTO> result = sqlsession.selectList("Board.getIndexBoardList",datas);
		return result;
	}

	public void deleteBoardReply(int boardnum) {
		System.out.println("보드넘 " + boardnum);
		sqlsession.delete("Board.deleteBoardReply", boardnum);
	}

// 공지사항
	public int getNoticeCnt(String keyword) {
		if(keyword == null) {
			return sqlsession.selectOne("Board.getNoticeCnt");
		}else {
			return sqlsession.selectOne("Board.getNoticeCntWithKey",keyword);
		}
	}


	public List<NoticeDTO> getNoticeList(int startRow, int endRow, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<NoticeDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//			selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Board.getNoticeList",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Board.getNoticeListWithKey",datas);
		}
		return result;
	}
	
	public NoticeDTO getDetailNotice(int boardnum) {
		return sqlsession.selectOne("Board.getDetailNotice",boardnum);
	}
	
	public void updateNoticeViews(int boardnum) {
		sqlsession.update("Board.updateNoticeViews",boardnum);
	}
	
}