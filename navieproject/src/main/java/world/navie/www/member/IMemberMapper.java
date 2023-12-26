package world.navie.www.member;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberMapper {

		// 중복 체크
		MemberDTO login(String id);
		
		// 회원정보 등록
		int registProc(MemberDTO member);

		// 회원조회
		ArrayList<MemberDTO> memberInfo();
		
		// 회원수정 맵퍼
		int updateProc(MemberDTO member);
		
		// 회원삭제 맵퍼
		int deleteProc(String id);
}
