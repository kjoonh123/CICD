package world.navie.www.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	@Autowired private HttpSession session;
	@Autowired private IMemberMapper mapper;
	
	
	@RequestMapping("regist")
	public String regist() {
		return "member/regist";
	}
	
	@PostMapping("registProc")
	public String registProc(MemberDTO member, String postcode, 
			String detailAddress, Model model, RedirectAttributes ra) {
		
//		if(member.getAddress() != null && member.getAddress().trim().isEmpty() == false)
//			member.setAddress( postcode + "," + member.getAddress() + "," + detailAddress);
		
		String msg = service.registProc(member);
		
		if(msg.equals("회원 등록 완료")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		
		model.addAttribute("msg", msg);
		return "member/regist";
	}
	
	// [ Login & Logout ]
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
		
	@PostMapping("loginProc")
	public String loginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
//			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/login";
	}
	
	@RequestMapping("boardLogin")
	public String boardLogin() {
		return "member/boardLogin";
	}
	
	@PostMapping("boardLoginProc")
	public String boardLoginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:boardForm";
		}
		model.addAttribute("msg", msg);
		return "member/boardLogin";
	}
	
	@RequestMapping("board2Login")
	public String board2Login() {
		return "member/board2Login";
	}
	
	@PostMapping("board2LoginProc")
	public String board2LoginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:boardForm2";
		}
		model.addAttribute("msg", msg);
		return "member/board2Login";
	}
	
	@RequestMapping("movieLogin")
	public String movieLogin() {
		return "member/movieLogin";
	}
	
	@PostMapping("movieLoginProc")
	public String movieLoginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:movie";
		}
		model.addAttribute("msg", msg);
		return "member/movieLogin";
	}
	
	@RequestMapping("dramaLogin")
	public String dramaLogin() {
		return "member/dramaLogin";
	}
	
	@PostMapping("dramaLoginProc")
	public String dramaLoginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:drama";
		}
		model.addAttribute("msg", msg);
		return "member/dramaLogin";
	}
	
	@RequestMapping("aniLogin")
	public String aniLogin() {
		return "member/aniLogin";
	}
	
	@PostMapping("aniLoginProc")
	public String aniLoginProc(String id, String pw, Model model, RedirectAttributes ra) {
		String msg = service.loginProc(id, pw);
		if(msg.equals("로그인 성공")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:animation";
		}
		model.addAttribute("msg", msg);
		return "member/aniLogin";
	}
	
	
	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {
		session.invalidate();
		// Session 정보 초기화
		ra.addFlashAttribute("msg", "로그 아웃");
		
		// 카카오 로그아웃을 위한 코드 추가 (토큰 만료. 하지 않으면 토큰 유효시간동안 로그인된채로 있게 됨)
		kakaoService.unlink();
		return "redirect:index";
	}
	
	// [ Member 조회 ]
	@RequestMapping("list")
	public String list(Model model) {
		service.memberInfo(model);
		return "member/list";
	}
		
	// [ Member 수정 ]
	@GetMapping("update")
	public String update() {
		return "member/update";
	}
	
	@PostMapping("update")
	public String update(MemberDTO member, Model model, RedirectAttributes ra) {
		String msg = service.updateProc(member);
		if(msg.equals("회원 수정 완료")) {
			session.invalidate();
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/update";
	}
	
	//회원삭제
//	@PostMapping("delete")
//	public String delete(MemberDTO member, Model model, RedirectAttributes ra) {
//		String msg = service.deleteProc(member);
//		if(msg.equals("회원 탈퇴 완료")) {
//			ra.addFlashAttribute("msg", msg);
//			return "redirect:index";
//		}
//		model.addAttribute("msg", msg);
//		return "member/delete";
//	}

	//회원삭제	
	@RequestMapping("delete")
	public String delete() {
		return "member/delete";
	}
	
	@PostMapping("delete")
	public String delete(MemberDTO member, Model model, RedirectAttributes ra) {
		String sessionId = (String)session.getAttribute("id");
		member.setId(sessionId);
		String msg = service.deleteProc(member);
		if(msg.equals("회원 탈퇴 완료")) {
			session.invalidate();
			ra.addFlashAttribute("msg", msg);
			return "redirect:index";
		}
		model.addAttribute("msg", msg);
		return "member/delete";
	}
	
	// [ Kakao Login ]
	@Autowired private KakaoService kakaoService;
	@RequestMapping("kakaoLogin")
	public String kakaoLogin(String code) {
		System.out.println("code : " + code);
		kakaoService.getAccessToken(code);
		kakaoService.getUserInfo();
		return "redirect:index";
	}
	
	// 중복 로그인 albert
	@GetMapping("/checkDuplicate")
	   @ResponseBody
	   public String checkDuplicate(@RequestParam String id) {
	       MemberDTO check = mapper.login(id);
	       return (check != null) ? "duplicate" : "unique";
	   }

	
}