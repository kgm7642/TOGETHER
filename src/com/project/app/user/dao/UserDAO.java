package com.project.app.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.project.app.board.dao.BoardDTO;
import com.project.app.moim.dto.FollowDTO;
import com.project.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	public UserDAO() {
		sqlsession = factory.openSession(true);// true濡� �꽕�젙�떆 �삤�넗而ㅻ컠
	}

	public boolean join(UserDTO user) {
		int result = sqlsession.insert("User.join", user);
		return result == 1;
	}

	public boolean checkId(String userid) {
		int result = 1;
		result = sqlsession.selectOne("User.checkId", userid);
		return result == 0;
	}

	public boolean login(String userid, String userpw) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		return 1 == (Integer) sqlsession.selectOne("User.login", datas);
	}

	public UserDTO getDetail(String userid) {
		return sqlsession.selectOne("User.getDetail", userid);
	}

	public boolean mypage(String userid) {
		int result = 1;
		result = sqlsession.selectOne("User.myPage", userid);
		return result == 0;
	}

	// 아이디 찾기
	public String findId(String username, String userphone) {
		HashMap<String, String> userMap = new HashMap<>();
		userMap.put("username", username);
		userMap.put("userphone", userphone);

		System.out.println(username);
		System.out.println(userphone);

		return sqlsession.selectOne("User.findId", userMap);
	}

	// 비밀번호 찾기
	public String findpw(String userid, String userphone) {
		HashMap<String, String> userMap = new HashMap<>();
		userMap.put("userid", userid);
		userMap.put("userphone", userphone);

		System.out.println(userid);
		System.out.println(userphone);

		return sqlsession.selectOne("User.findpw", userMap);
	}
	
	// 회원정보 수정
	public boolean updatemyinfo(UserDTO user) {
		System.out.println(user.getUserid());
		System.out.println(user.getUsername());
		System.out.println(user.getUseremail());
		int result = sqlsession.update("User.updatemyinfo", user);
		return result == 1;
	}

	// 친구 추가
	public UserDTO plusFriend(String userid) {

		return sqlsession.selectOne("User.plusFriend", userid);
	}

	public void insertMyFriend(FollowDTO fdto) {
		sqlsession.insert("User.insertMyFriend", fdto);

	}

	public void insertFriend(FollowDTO follow) {
		sqlsession.insert("User.insertFriend", follow);

	}
	
	// 친구 찾기
	public UserDTO findFriend(String userid) {
		return sqlsession.selectOne("User.findFriend", userid);
	}
	
	// 내정보 검색
	public UserDTO getUser(String userid) {
		return sqlsession.selectOne("User.getUser", userid);
	}
	
	// 하나의 친구 정보
	public FollowDTO findFriendtwo(String followid) {
		return sqlsession.selectOne("User.findFriendtwo", followid);
	}
			
	public List<String> getFUserid(String userid) {
		return sqlsession.selectList("User.getFUserid", userid);
	}
		
	// 친구 리스트
	public List<FollowDTO> listFriend(String userid) {
		return sqlsession.selectList("User.listFriend", userid);
	}

	public void deleteMyFriend(String userid, String followid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("followid",followid);
		
		sqlsession.delete("User.deleteMyFriend", datas);
		
	}
	// 팔로우, 팔로잉 (UseFollowListOK, UserFollowingListOK)
	// UserFollowListOK에서 쓰고 있어서 수정 힘듬..?
	// UserDAO에서도 쓰고 있음
	public List<FollowDTO> followingList(String userid) {
		return sqlsession.selectList("User.followingList", userid);
	}

	// 친구 있는지 검색해줌
//	public boolean checkFriend(String userid, String followid) {
//		System.out.println(userid);
//		System.out.println(followid);
//		int result = 1;
//		HashMap<String, Object> datas = new HashMap<String, Object>();
//		datas.put("userid", userid);
//		datas.put("followid", followid);
//		result = sqlsession.selectOne("User.checkFriend", datas);
//		return result == 0;
//	}

	public int getIndexFollowCnt() {
		return sqlsession.selectOne("User.getIndexFollowCnt");
	}

	public List<FollowDTO> getIndexFriendList(int startRowF, int endRowF, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();

		datas.put("startRow", startRowF);
		datas.put("endRow", endRowF);
		datas.put("userid", userid);

		return sqlsession.selectList("User.getIndexFriendList",datas);
	}
	
//-----------------------------------------------------------------------------------------
// 회원 탈퇴 관련 메소드들
	
	//강퇴 삭제
	public void deleteFire(String userid) {
		sqlsession.delete("User.deleteFire", userid);
	}
	
	//채팅 삭제
	public void deleteChat(String userid) {
		sqlsession.delete("User.deleteChat", userid);
	}

	//가입신청 삭제(내가한거)
	public void deleteJoinJ(String userid) {
		sqlsession.delete("User.deleteJoinJ", userid);
	}
	
	//가입신청 삭제(내가 받은거)
	public void deleteJoinK(String userid) {
		sqlsession.delete("User.deleteJoinK", userid);
	}

	//멤버 삭제
	public void deleteMember(String userid) {
		sqlsession.delete("User.deleteMember", userid);
	}
	
	//모임넘 전부 가져온다.
	public List<Integer> selectMoimNum(String userid) {
		return sqlsession.selectList("User.selectMoimNum", userid);
	}

	//보드넘 전부 가져온다.
	public List<Integer> selectBoardNum(String userid) {
		return sqlsession.selectList("User.selectBoardNum", userid);
	}

	//보드 댓글 삭제
	public void deleteBoardReply(String userid) {
		sqlsession.delete("User.deleteBoardReply", userid);
	}

	//보드 삭제
	public void deleteBoard(String userid) {
		sqlsession.delete("User.deleteBoard", userid);
	}

	//친구 삭제(팔로우)
	public void dellteFollowU(String userid) {
		sqlsession.delete("User.dellteFollowU", userid);
	}

	//친구 삭제(팔로잉)
	public void deleteFollowF(String userid) {
		sqlsession.delete("User.deleteFollowF", userid);
	}

	//유저 삭제
	public void deleteUser(String userid) {
		sqlsession.delete("User.deleteUser", userid);
	}
}
