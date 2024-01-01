package com.project.app.user;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.action.Action;
import com.project.action.ActionForward;
import com.project.app.board.dao.FileDAO;
import com.project.app.board.dao.FileDTO;
import com.project.app.moim.dao.MoimDAO;
import com.project.app.user.dao.UserDAO;
import com.project.app.user.dao.UserDTO;

public class UserByeByeAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDAO udao = new UserDAO();
		FileDAO fdao = new FileDAO(); 
		MoimDAO mdao = new MoimDAO();
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("session");
		String userid = user.getUserid();
//-----------------------------------------------------------------------------------------
//		탈퇴하려는 유저가 방장인 모임에 관련된 정보 지울거임
		
		System.out.println("세션에서 유저정보까지 가져왔음");
		//먼저 유저가 방장인 moimnum을 리스트로 전부 가져와야함
		List<Integer> moimnums = udao.selectMoimNum(userid);		
		System.out.println("유저의 모임들 리스트로 가져왔음");
		
		//방장인 모임의 갯수만큼 for문 돌아야함. 돌면서 관련된거 전부 삭제
		//근데 방장인 모임이 있을때만 for문을 돌아야함. 그래서 if로 먼저 확인
		if(moimnums.size()>0) {
			
			System.out.println("유저의 모임들 moimnums 리스트 : " + moimnums);
			// ① 첫번째 for문 - 유저가 방장인 모임들 전부 한바퀴 돌아야함.
			
			for(Integer moimnum : moimnums) {
				System.out.println("첫번째 for문 시작");
				
				System.out.println("moimnum : " + moimnum.intValue());

				// 그 모임의 채팅, 멤버, 강퇴, 가입신청 테이블 순차적으로 삭제
				mdao.deleteChat(moimnum.intValue());
				System.out.println("moimnum : " + moimnum.intValue() + "의 모임 채팅 삭제 완료");
				
				mdao.deleteMembers(moimnum.intValue());
				System.out.println("moimnum : " + moimnum.intValue() + "의 모임 멤버들 삭제 완료");
				
				mdao.deleteFireMoim(moimnum.intValue());
				System.out.println("moimnum : " + moimnum.intValue() + "의 모임 강퇴 리스트 삭제 완료");
				
				mdao.deleteMoimJoin(moimnum.intValue());
				System.out.println("moimnum : " + moimnum.intValue() + "의 모임 가입신청 리스트 삭제 완료");
				
				// moimnum으로 홍보게시글의 recruitnums 모두 가져와서 for문 돌려야함
				// 하나의 모임에 여러개의 홍보게시글 작성했을 수 있으니 일단 List로 홍보게시글 번호 가져와야함.
				List<Integer> recruitnums = mdao.getRecruitnums(moimnum.intValue());
				System.out.println("moimnum : " + moimnum.intValue() + "의 홍보 게시글 번호 리스트로 가져왔음");
				
				// recruitnums 없으면 (게시글 없으면) if문 그냥 지나감
				if(recruitnums.size() > 0) {
					// ② 두번째 for문 - 모임의 홍보게시글 관련된 테이블 순차적으로 삭제
			
					for(Integer recruitnum : recruitnums) {
						System.out.println("두번째 for문 시작");
						
						// 그 홍보 게시글의 답글, 홍보 게시글 삭제
						mdao.deleteRReply(recruitnum.intValue());
						System.out.println("recruitnum : " + recruitnum.intValue() + "의 댓글 삭제 완료");
						
						mdao.deleteRecruit(recruitnum.intValue());
						System.out.println("recruitnum : " + recruitnum.intValue() + "의 게시글 삭제 완료");
					}
					System.out.println("두번째 for문 끝");
				}	
				
				// 두번째 for문은 끝났고 (여기까지 왔으면 모임들 관련 홍보 게시글, 답변 모두 삭제 완료 된거임)
				// 이제 탈퇴하려는 user가 방장인 모임과 장소만 전부 지우면 됨.
				// moimnum으로 placenum 검색
				int placenum = mdao.getMPlaceNum(moimnum.intValue());
				System.out.println("moimnum : " + moimnum.intValue() + "의 장소Num 검색");
				
				// 모임 먼저 삭제
				mdao.deleteMoim(moimnum.intValue());
				System.out.println("moimnum : " + moimnum.intValue() + "의 모임 삭제 완료");
				
				// 마지막으로 장소 삭제
				mdao.deletePlace(placenum);
				System.out.println("moimnum : " + moimnum.intValue() + "의 장소 삭제 완료");
				
				System.out.println("첫번째 for문 끝");
			} // 첫번째 for문 끝
		}
//		탈퇴하려는 유저가 방장인 모임에 관련된 정보를 모두 지웠음
//-----------------------------------------------------------------------------------------		
//		여기서부턴 탈퇴하려는 유저가 방장이아니고 단순 참여한 모임에 관한 정보 모두 지워야됨
		
		// 채팅 모두 지워줌
		udao.deleteChat(userid);
		System.out.println("채팅 삭제 완료");
		
		// 멤버에서 모두 제외시켜줌
		udao.deleteMember(userid);
		System.out.println("멤버에서 삭제 완료");
		
		// 강퇴목록에서도 모두 지워줌
		udao.deleteFire(userid);
		System.out.println("강퇴목록 삭제 완료");
		
		// 가입신청 정보도 모두 지워줌(본인이 신청)
		udao.deleteJoinJ(userid);
		System.out.println("본인이 가입 신청한 정보 삭제 완료");
		
		// 가입신청 정보도 모두 지워줌(본인모임에 신청 받은거)
		udao.deleteJoinK(userid);
		System.out.println("가입 신청 받은 정보 삭제 완료");
		
//		모임 관련된 테이블 정보 모두 지웠음		
//-----------------------------------------------------------------------		
//		여기부턴 모임 상관 x
//		유저가 게시글 여러개 썼을 수 있으니까 먼저 유저가 쓴 게시글들의 boardnum을 리스트로 모두 가져와야함
		List<Integer> boardnums = udao.selectBoardNum(userid);
		System.out.println("유저가 쓴 게시글Num 리스트로 가져왔음" );
		
		String saveFolder = "D:\\web_file";
		
		//게시글이 없으면 if문 그냥 지나감
		if(boardnums.size() > 0) {
			//게시글만큼 for문 돌아야함
			for(Integer boardnum : boardnums) {
				System.out.println("for문 시작");
				
				//그 게시글에 첨부된 파일을 리스트에 담아줌
				List<FileDTO> files = fdao.getFiles(boardnum);
				System.out.println("파일 가져와서 리스트에 담아주기 성공");
				
				
				if(files.size()>0) {
					for(FileDTO f : files) {
						File file = new File(saveFolder,f.getSystemname());
						//파일 존재하는지 먼저 확인
						if(file.exists()) {
							file.delete();
						}
						fdao.deleteFileByName(f.getSystemname());
						System.out.println("DB에서 파일 삭제 완료");
					}
				}
			}
		}
		
		//게시글의 답변 삭제
		udao.deleteBoardReply(userid);
		System.out.println("게시글 답변 삭제 완료");
		
		//게시글 삭제
		udao.deleteBoard(userid);
		System.out.println("게시글 삭제 완료");
		
		//팔로우 정보 삭제
		udao.dellteFollowU(userid);
		System.out.println("팔로우 삭제 완료");
		
		//팔로잉 정보 삭제
		udao.deleteFollowF(userid);
		System.out.println("팔로잉 삭제 완료");
		
		//회원 정보 삭제
		udao.deleteUser(userid);
		System.out.println("회원 정보 삭제 완료");
		
		//세션을 비워주고 마무리!!
		session.invalidate();
		System.out.println("세션 비워주기 완료");
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/index.jsp?resign=true");
		
		return forward;
	}
}
