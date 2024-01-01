package com.project.app.moim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.app.moim.dto.FireMoimDTO;
import com.project.app.moim.dto.MoimChatDTO;
import com.project.app.moim.dto.MoimDTO;
import com.project.app.moim.dto.MoimjoinDTO;
import com.project.app.moim.dto.MoimrecruitDTO;
import com.project.app.moim.dto.MoimreplyDTO;
import com.project.app.user.dao.UserDTO;
import com.project.app.moim.dto.PlaceDTO;
import com.project.mybatis.SqlMapConfig;

public class MoimDAO {
	SqlSession sqlsession;

	public MoimDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
		
	
//				모임 파트 기능 리스트					담당자
	
//				<마이 모임>						지우
//				<모임 생성>						경민
//				<홍보 게시판>						경민
//				<모임 신청 관리>					경민
//				<오늘 모임 리스트 검색>				경민
//				<모임 챗>							경민
//				<모임 검색>						원희
//				<모임 멤버 강퇴>					원희
//				<모임 관리>						원희
		
	
//	< - - - - - - - - - - <지우> - - - - - - - - - - >
	
	
//	< - - - - - <마이 모임> - - - - - >

	
//	< - - - - - <SELECT> - - - - - >
	
	
	public int getPMoimNum(int placenum) {
		return sqlsession.selectOne("Moim.getPMoimNum",placenum);
	}
	
	public int getMyMoim1Cnt(String userid) {
		return sqlsession.selectOne("Moim.getMyMoim1Cnt",userid);
	}
	
//	< - - - - - <SELECT-LIST> - - - - - >
	
	public List<MoimDTO> getMyMoimList1(int startRow, int endRow, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<MoimDTO> result;
		datas.put("userid", userid);
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		result = sqlsession.selectList("Moim.getMyMoimList1", datas);
		return result;
	}
	
	public List<MoimDTO> getMyMoimList2(int startRow, int endRow, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<MoimDTO> result;
		datas.put("userid", userid);
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		result = sqlsession.selectList("Moim.getMyMoimList2", datas);
		return result;
	}
	
	
//	< - - - - - - - - - - <지우> - - - - - - - - - - >
	
	
//	< - - - - - <마이 모임> - - - - - >

	
//	< - - - - - <UPDATE> - - - - - >
	
	
	public boolean updateMoim(MoimDTO mdto) {
		return 1 == sqlsession.update("Moim.updateMoim", mdto);
	}

	public boolean updatePlace(PlaceDTO pdto) {
		return 1 == sqlsession.update("Moim.updatePlace", pdto);
	}
	
	
//	< - - - - - - - - - - <지우> - - - - - - - - - - >
	   
	   
//	< - - - - - <index 오늘 나의 모임> - - - - - >
	
   
//	< - - - - - <SELECT> - - - - - >
	
	
	public int getTodayMoimNum(String userid) {
	      return sqlsession.selectOne("Moim.getTodayMoimNum", userid);
	   }


	public int getMaxTodayMoimNum(String userid) {
	      return sqlsession.selectOne("Moim.getMaxTodayMoimNum",userid);
	   }
	
//	< - - - - - <SELECT-LIST> - - - - - >	
	
	public List<MoimDTO> getTodayMyMoimList(String userid){
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      List<MoimDTO> result;
	      datas.put("userid", userid);
	      result = sqlsession.selectList("Moim.getTodayMyMoimList", datas);
	      return result;
	   }
	
	
//	< - - - - - - - - - - <경민> - - - - - - - - - - >	

	
//	< - - - - - <모임 생성> - - - - - >

	
//	< - - - - - <SELECT> - - - - - >
	
	
	public int getPlaceNum() {
		return sqlsession.selectOne("Moim.selectPlaceNum");
	}
	
	public int getMoimNum() {
		return sqlsession.selectOne("Moim.selectMoimNum");
	}

	public int selectMoimNum() {
		return sqlsession.selectOne("Moim.selectMoimNum");
	}
	
//	< - - - - - - - - - - <경민> - - - - - - - - - - >		

		
//	< - - - - - <모임 생성> - - - - - >	
	
	
//	< - - - - - <INSERT> - - - - - >
	
	
	public void insertPlace(PlaceDTO pdto) {
		sqlsession.insert("Moim.insertPlace", pdto);
	}

	public void insertMoim(MoimDTO mdto) {
		sqlsession.insert("Moim.insertMoim", mdto);
	}
	
	public void InsertMember(String userid, int moimnum) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("moimnum", moimnum);
		sqlsession.insert("Moim.insertMember", datas);
	}
	

//	< - - - - - - - - - - <경민> - - - - - - - - - - >

	
//	< - - - - - <홍보 게시판> - - - - - >	
	
	
//	< - - - - - <SELECT> - - - - - >
	
	
	public int getBoardCnt(String keyword) {
		if(keyword == null) {
			return sqlsession.selectOne("Moim.getBoardCnt");
		}else {
			return sqlsession.selectOne("Moim.getBoardCntWithKey",keyword);
		}
	}

	public String getKingId(int moimnum) {
		return sqlsession.selectOne("Moim.getKingId", moimnum);
	}

	public MoimDTO getMoim(int moimnum) {
		return sqlsession.selectOne("Moim.getMoim", moimnum);
	}

	public String getMoimNumWithRtnum(int recruitnum) {
		return sqlsession.selectOne("Moim.getMoimNumWithRtnum", recruitnum);
	}
	
	public boolean checkAlreadyJoin(String userid, int moimnum) {
		int result = 1;
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("moimnum", moimnum);
		result = sqlsession.selectOne("Moim.checkAlreadyJoin",datas);
		return result == 0;
	}

	public boolean checkKing(String userid) {
		int result = 0;
		result = sqlsession.selectOne("Moim.checkKing", userid);
		if(result>=1) {
			return true;
		}else {
			return false;
		}
	}
	
	public int getLastNum(String userid) {
		return sqlsession.selectOne("Moim.getLastNum",userid);
	}

	public MoimrecruitDTO getRecruitDetail(int recruitnum) {
		return sqlsession.selectOne("Moim.getRecruitDetail",recruitnum);
	}
	
	public int selectCountReply(int recruitnum) {
        return sqlsession.selectOne("Moim.selectCountReply", recruitnum);
    }
	
//	< - - - - - <SELECT-LIST> - - - - - >
	
	public List<MoimrecruitDTO> getAdMoimList(int startRow, int endRow, String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<MoimrecruitDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//			selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Moim.getAdMoimList",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Moim.getAdMoimListWithKey",datas);
		}
		return result;
	}
	
	public List<MoimreplyDTO> getReplyList(int recruitnum) {
		return sqlsession.selectList("Moim.getReplyList", recruitnum);
	}

	public List<MoimDTO> getMyMoimList(String userid) {
		return sqlsession.selectList("Moim.getMyMoimList", userid);
	}
	
	public List<MoimjoinDTO> getMoimJoinList(int moimnum) {
		return sqlsession.selectList("Moim.getMoimJoinList", moimnum);
	}


//	< - - - - - - - - - - <경민> - - - - - - - - - - >	

	
//	< - - - - - <홍보 게시판> - - - - - >	
	
	
//	< - - - - - <INSERT> - - - - - >
	
	
	public void insertADReply(MoimreplyDTO reply) {
		sqlsession.insert("Moim.insertReply", reply);
	}
	
	public boolean insertJoinMoim(MoimjoinDTO mjdto) {
		return 1 == sqlsession.insert("Moim.insertJoinMoim", mjdto);
	}
	
	public boolean insertRecruit(MoimrecruitDTO mdto) {
		return 1 == sqlsession.insert("Moim.insertRecruit", mdto);
	}


//	< - - - - - - - - - - <경민> - - - - - - - - - - >	

	
//	< - - - - - <홍보 게시판> - - - - - >	
	
	
//	< - - - - - <UPDATE> - - - - - >
	
	
	public void updateReply(MoimreplyDTO reply){
		sqlsession.update("Moim.updateReply", reply);
	}
	
	public void updateViews(int recruitnum) {
		sqlsession.update("Moim.updateReadCnt",recruitnum);
	}
	
	public boolean updateRecruit(MoimrecruitDTO mrdto) {
		return 1 == sqlsession.update("Moim.updateRecruit", mrdto);			
	}
	
	
//	< - - - - - - - - - - <경민> - - - - - - - - - - >	

	
//	< - - - - - <홍보 게시판> - - - - - >	
	
	
//	< - - - - - <DELETE> - - - - - >
	
	
	public void deleteReply(int replyNum) {
		sqlsession.delete("Moim.deleteReply", replyNum);
	}
	
	public boolean removeReply(int recruitnum) {
		return 1 == sqlsession.delete("Moim.removeReply", recruitnum);
	}
	
	public boolean removeRecruit(int recruitnum) {
		return 1 == sqlsession.delete("Moim.removeRecruit", recruitnum);
	}
	
	
//	< - - - - - - - - - - <경민> - - - - - - - - - - >	

	
//	< - - - - - <모임 신청 관리> - - - - - >	
	
	
//	< - - - - - <SELECT> - - - - - >
	

	public MoimjoinDTO getMoimJoin(int moimjoinnum) {
		return sqlsession.selectOne("Moim.getMoimJoin", moimjoinnum);
	}
	
	
//	< - - - - - - - - - - <경민> - - - - - - - - - - >	

	
//	< - - - - - <모임 신청 관리> - - - - - >	
	
			
//	< - - - - - <DELETE> - - - - - >
	
	
	public void removeJoinList(String joinuserid, int moimnum) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("joinuserid", joinuserid);
		datas.put("moimnum", moimnum);
		sqlsession.delete("Moim.removeJoinList", datas);
	}
	
	
//	< - - - - - - - - - - <경민> - - - - - - - - - - >
	
	
//	< - - - - - <오늘 모임 리스트 검색> - - - - - >
	
	
//	< - - - - - <SELECT-LIST> - - - - - >
	
	
	public List<MoimDTO> getTodayMoimList() {
	    return sqlsession.selectList("Moim.getTodayMoimList");
	}
	
	
//	< - - - - - - - - - - <원희> - - - - - - - - - - >
	
	
//	< - - - - - <모임 검색> - - - - - >	
	
	
//	< - - - - - <SELECT> - - - - - >


	public int getMoimCnt(String keyword) {
		if(keyword == null) {
			return sqlsession.selectOne("Moim.getMoimCnt");
		}else {
			return sqlsession.selectOne("Moim.getMoimCntWithKey",keyword);
		}
	}
	
	public int getMPlaceNum(int moimnum) {
		return sqlsession.selectOne("Moim.getMPlaceNum", moimnum);
	}
	
	public MoimDTO getDetail(int moimnum) {
		return sqlsession.selectOne("Moim.getDetail",moimnum);
		}
	
	public PlaceDTO getPlaceDetail(int moimnum) {
		return sqlsession.selectOne("Moim.getPlaceDetail", moimnum);
	}
	
	public UserDTO getMemberInfo(String userid) {
		return sqlsession.selectOne("Moim.getMemberInfo",userid);
	}
	
//	< - - - - - <SELECT-LIST> - - - - - >
	
	public List<MoimDTO> getMoimList(int startRow, int endRow,String keyword) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		List<MoimDTO> result;
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		if(keyword == null) {
//		selectList로 검색해 오면 그 모든 줄들로 객체를 만들고 그것들이 담겨있는 List를 리턴
			result = sqlsession.selectList("Moim.getMoimList",datas);
		}
		else {
			datas.put("keyword",keyword);
			result = sqlsession.selectList("Moim.getMoimListWithKey",datas);
		}
		
		return result;
	}
	
	public List<String> getUserid(int moimnum) {
		return sqlsession.selectList("Moim.getUserid", moimnum);
	}	
	
	
//	< - - - - - - - - - - <원희> - - - - - - - - - - >
	
	
//	< - - - - - <모임 멤버 강퇴> - - - - - >
	
	
//	< - - - - - <INSERT> - - - - - >
	

	public void fireMessage(FireMoimDTO firemoim) {
		sqlsession.insert("Moim.fireMessage", firemoim);
	}

	
//	< - - - - - - - - - - <원희> - - - - - - - - - - >
	
	
//	< - - - - - <모임 멤버 강퇴> - - - - - >
	
	
//	< - - - - - <DELETE> - - - - - >
	

	public void fireMember(String userid) {
		sqlsession.delete("Moim.fireMember", userid);
	}
	
	
//	< - - - - - - - - - - <원희> - - - - - - - - - - >
	
	
//	< - - - - - <모임 관리> - - - - - >	
	
	
//	< - - - - - <SELECT> - - - - - >
	
	
	public List<Integer> getRecruitnums(int moimnum) {
		return sqlsession.selectList("Moim.getRecruitnums", moimnum);
	}
	
	
//	< - - - - - - - - - - <원희> - - - - - - - - - - >
	
	
//	< - - - - - <모임 관리> - - - - - >	
	
	
//	< - - - - - <DELETE> - - - - - >
	
	
//	< - - <삭제 되는 순서대로 정렬됨> - - >
	

	public int deleteMembers(int moimnum) {
		return sqlsession.delete("Moim.deleteMembers", moimnum);
	}
	
	public void deleteFireMoim(int moimnum) {
		sqlsession.delete("Moim.deleteFireMoim", moimnum);
	}
	
	public void deleteMoimJoin(int moimnum) {
		sqlsession.delete("Moim.deleteMoimJoin", moimnum);
	}
	
	public void deleteRReply(int recruitnum) {
		sqlsession.delete("Moim.deleteRReply", recruitnum);
	}
	
	public void deleteRecruit(int recruitnum) {
		sqlsession.delete("Moim.deleteRecruit", recruitnum);
	}
	
	public void deleteMoim(int moimnum) {
		sqlsession.delete("Moim.deleteMoim", moimnum);
	}

	public void deletePlace(int placenum) {
		sqlsession.delete("Moim.deletePlace", placenum);
	}
	

//	< - - - - - - - - - - <경민> - - - - - - - - - - >
	
	
//	< - - - - - <모임 챗> - - - - - >
	
	
//	< - - - - - <INSERT> - - - - - >
	
	
	// 모임의 채팅을 모두 가져온다.
	   public List<MoimChatDTO> getChatList(int moimnum) {
			return sqlsession.selectList("Moim.getChatList", moimnum);
		}
	   
	   //채팅 등록
	   public void insertMoimChat(MoimChatDTO mcdto) {
		   sqlsession.insert("Moim.insertMoimChat", mcdto);
	   }
	   
	   public void SendChat(String userid, int moimnum) {
	      HashMap<String, Object> datas = new HashMap<String, Object>();
	      datas.put("userid", userid);
	      datas.put("moimnum", moimnum);
	      sqlsession.insert("Moim.sendChat", datas);
	   }

	   
	   public void deleteChat(int moimnum) {
		   sqlsession.delete("Moim.deleteChat", moimnum);
		}


	   public int getIsRecruit(int moimnum) {
			return sqlsession.selectOne("Moim.getIsRecruit", moimnum);
		}

	   public FireMoimDTO getBanUser(String userid) {
		   return sqlsession.selectOne("Moim.getBanUser", userid);
	   }


	public void banCheck(String message) {
			sqlsession.delete("Moim.banCheck", message);
	}

	public int getMaxMyBanMoimNum(String userid) {
		return sqlsession.selectOne("Moim.getMaxMyBanMoimNum");
	}


	public void outMoim(int moimnum, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("moimnum", moimnum);
	    datas.put("userid", userid);
	    sqlsession.insert("Moim.outMoim", datas);
	}


	public int getDislike(int moimnum) {
		return sqlsession.selectOne("Moim.getDislike", moimnum);
	}


	public void updateDislike(int moimnum) {
		sqlsession.update("Moim.updateDislike", moimnum);
	}

	public int getDislikeRecruitnum(int recruitnum) {
		return sqlsession.selectOne("Moim.getDislikeRecruitnum", recruitnum);
	}
	
	public void updateDislikeRecruitnum(int recruitnum) {
		sqlsession.update("Moim.updateDislikeRecruitnum", recruitnum);
	}
	
}