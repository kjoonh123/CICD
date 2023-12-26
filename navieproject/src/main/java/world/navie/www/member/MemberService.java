package world.navie.www.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

@Service
public class MemberService {
	@Autowired private IMemberMapper mapper;
	@Autowired private HttpSession session;
	ArrayList<MemberDTO> mem = new ArrayList<MemberDTO>();
	
	// [ 회원가입 ]
	public String registProc(MemberDTO member) {
		if(member.getId() == null || member.getId().trim().isEmpty()) {
			return "아이디를 입력하세요.";
		}
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		if(member.getUserName() == null || member.getUserName().trim().isEmpty()) {
			return "이름을 입력하세요.";
		}
		if(member.getPostcode() == null || member.getPostcode().trim().isEmpty()) {
			return "주소를 입력하세요.";
		}
		
		MemberDTO check = mapper.login(member.getId());
		if(check != null) {
			return "이미 사용중인 아이디 입니다.";
		}
		
		/* 암호화 과정 */
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(member.getPw());
		member.setPw(secretPass);
		
		/*
			암호문 : $2a$10$HJ3CfbI4MxDDSM3emVsuNudQyQE5StjV7g/UGK2vSQZQRmGy23OXi
			암호문 길이: 60
			
			pw 컬럼의 크기를 암호문 크기와 같거나 크게 변경
			ALTER TABLE db_quiz MODIFY pw varchar2(60);
			COMMIT;
		 */
		
		System.out.println("암호문 : " + secretPass);
		System.out.println("암호문 길이: " + secretPass.length());
		
		int result = mapper.registProc(member);
		if(result == 1)
			return "회원 등록 완료";
		
		return "회원 등록을 다시 시도하세요.";
	}
	
	// [ Login & Logout ]
	public String loginProc(String id, String pw) {
		if(id == null || id.trim().isEmpty()) {
			return "아이디를 입력하세요.";
		}
		if(pw == null || pw.trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		
		MemberDTO check = mapper.login(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(check != null && encoder.matches(pw, check.getPw()) == true) {
			session.setAttribute("id", check.getId());
			session.setAttribute("userName", check.getUserName());
			session.setAttribute("postcode", check.getPostcode());
			session.setAttribute("address", check.getAddress());
			session.setAttribute("detailAddress", check.getDetailAddress());
			session.setAttribute("mobile", check.getMobile());
			
			return "로그인 성공";
		}
		return "아이디 또는 비밀번호를 확인 후 다시 입력하세요.";
	}
	
	// [ Member 조회 ]
	public void memberInfo(Model model) {
		ArrayList<MemberDTO> mem = mapper.memberInfo();
		model.addAttribute("members", mem);
	}
	
	// [ Member 수정 ]
	public String updateProc(MemberDTO member) {
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		if(member.getUserName() == null || member.getUserName().trim().isEmpty()) {
			return "이름을 입력하세요.";
		}
		/* 암호화 과정 */
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(member.getPw());
		member.setPw(secretPass);
		
		int result = mapper.updateProc(member);
		if(result == 1)
			return "회원 수정 완료";
		
		return "회원 수정을 다시 시도하세요.";
	}
	
	// [ Member 삭제 ]
	public String deleteProc(MemberDTO member) {
		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
			return "비밀번호를 입력하세요.";
		}
		if(member.getPw().equals(member.getConfirm()) == false) {
			return "두 비밀번호를 일치하여 입력하세요.";
		}
		MemberDTO check = mapper.login(member.getId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(check != null && encoder.matches(member.getPw(), check.getPw()) == true) {
			int result = mapper.deleteProc(member.getId());
			if(result == 1)
				return "회원 탈퇴 완료";
			return "회원 탈퇴를 다시 시도하세요.";
		}
		
		return "비밀번호를 확인 후 다시 시도하세요.";
	}
}



//package com.test.boot.member;
//
//import java.util.ArrayList;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Service;
//import org.springframework.ui.Model;
//
//import jakarta.servlet.http.HttpSession;
//
//@Service
//public class MemberService {
//	@Autowired private IMemberMapper mapper;
//	@Autowired private HttpSession session;
//	ArrayList<MemberDTO> mem = new ArrayList<MemberDTO>();
//
//	// [ 회원가입 ]
//	public String registProc(MemberDTO member) {
//		if(member.getId() == null || member.getId().trim().isEmpty()) {
//			return "아이디를 입력하세요.";
//		}
//		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
//			return "비밀번호를 입력하세요.";
//		}
//		if(member.getPw().equals(member.getConfirm()) == false) {
//			return "두 비밀번호를 일치하여 입력하세요.";
//		}
//		if(member.getUserName() == null || member.getUserName().trim().isEmpty()) {
//			return "이름을 입력하세요.";
//		}
//		
//		MemberDTO check = mapper.login(member.getId());
//		if(check != null) {
//			return "이미 사용중인 아이디 입니다.";
//		}
//		
//		/* 암호화 과정 */
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		String secretPass = encoder.encode(member.getPw());
//		member.setPw(secretPass);
//		
//		/*
//			암호문 : $2a$10$HJ3CfbI4MxDDSM3emVsuNudQyQE5StjV7g/UGK2vSQZQRmGy23OXi
//			암호문 길이: 60
//			
//			pw 컬럼의 크기를 암호문 크기와 같거나 크게 변경
//			ALTER TABLE db_quiz MODIFY pw varchar2(60);
//			COMMIT;
//		 */
//		
//		System.out.println("암호문 : " + secretPass);
//		System.out.println("암호문 길이: " + secretPass.length());
//		
//		int result = mapper.registProc(member);
//		if(result == 1)
//			return "회원 등록 완료";
//		
//		return "회원 등록을 다시 시도하세요.";
//	}
//	
//	// [ Login & Logout ]
//	public String loginProc(String id, String pw) {
//		if(id == null || id.trim().isEmpty()) {
//			return "아이디를 입력하세요.";
//		}
//		if(pw == null || pw.trim().isEmpty()) {
//			return "비밀번호를 입력하세요.";
//		}
//		
//		MemberDTO check = mapper.login(id);
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		if(check != null && encoder.matches(pw, check.getPw()) == true) {
//			session.setAttribute("id", check.getId());
//			session.setAttribute("userName", check.getUserName());
//			session.setAttribute("address", check.getAddress());
//			session.setAttribute("mobile", check.getMobile());
//			
//			return "로그인 성공";
//		}
//		return "아이디 또는 비밀번호를 확인 후 다시 입력하세요.";
//	}
//	
//	// [ Member 조회 ]
//	public void memberInfo(Model model) {
//		ArrayList<MemberDTO> mem = mapper.memberInfo();
//		model.addAttribute("members", mem);
//	}
//	
//	// [ Member 수정 ]
//	public String updateProc(MemberDTO member) {
//		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
//			return "비밀번호를 입력하세요.";
//		}
//		if(member.getPw().equals(member.getConfirm()) == false) {
//			return "두 비밀번호를 일치하여 입력하세요.";
//		}
//		if(member.getUserName() == null || member.getUserName().trim().isEmpty()) {
//			return "이름을 입력하세요.";
//		}
//		/* 암호화 과정 */
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		String secretPass = encoder.encode(member.getPw());
//		member.setPw(secretPass);
//		
//		int result = mapper.updateProc(member);
//		if(result == 1)
//			return "회원 수정 완료";
//		
//		return "회원 수정을 다시 시도하세요.";
//	}
//	
//	// [ Member 삭제 ]
//	public String deleteProc(MemberDTO member) {
//		if(member.getPw() == null || member.getPw().trim().isEmpty()) {
//			return "비밀번호를 입력하세요.";
//		}
//		if(member.getPw().equals(member.getConfirm()) == false) {
//			return "두 비밀번호를 일치하여 입력하세요.";
//		}
//		if(member.getUserName() == null || member.getUserName().trim().isEmpty()) {
//			return "이름을 입력하세요.";
//		}
//		/* 암호화 과정 */
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		String secretPass = encoder.encode(member.getPw());
//		member.setPw(secretPass);
//		
//		int result = mapper.deleteProc(member.getId());
//		if(result == 1)
//			return "회원 탈퇴 완료";
//		return "회원 삭제를 다시 시도하세요.";
//	}
//}
