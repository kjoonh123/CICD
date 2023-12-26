package world.navie.www.board2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController2 {
	@Autowired private BoardService2 service;
	
	// [ Board Form ]
	@RequestMapping("boardForm2")
	public String boardForm2(Model model, 
			@RequestParam(value="currentPage", required = false)String cp) {
		
		// 세션 확인은 view에서
		
		// BoardService에서 boardForm 실행
		service.boardForm(cp, model);
		
		return "board2/boardForm2";
	}
	
	
	// [ Board Write & Upload ]
	@Autowired private HttpSession session;
	
	@RequestMapping("boardWrite2")
	public String boardWrite2() {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:board2Login";
		
		return "board2/boardWrite2";
	}
	
	@PostMapping("boardWriteProc2")
	public String boardWriteProc2(MultipartHttpServletRequest multi, 
									@RequestParam("file") MultipartFile multipart, 
									Model model) {
		// 세션 확인
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:board2Login";
		
		// BoardService에서 boardWriteProc 실행
		String path = service.boardWriteProc(multi, multipart);

		return path;
	}
	
	
	// [ Board Content ]
	@RequestMapping("boardContent2")
	public String boardContent2(String no, Model model) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:board2Login";
		
		// boardDTO를 view로 전달
		BoardDTO2 board = service.boardContent(no);
		if (board == null) {
			return "redirect:boardForm2";
		}
		model.addAttribute("board", board);
		
		return "board2/boardContent2";
	}
	

	// [ Board Modify & Delete ]
	@RequestMapping("boardModify2")
	public String boardModify2(String no, Model model) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:board2Login";
		
		// BoardService에서 boardMdoify 실행
		String path = service.boardModify(no, model);
		
		return path;
	}
	
	@PostMapping("boardModifyProc2")
	public String boardModifyProc2(BoardDTO2 board, RedirectAttributes ra) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:board2Login";
		
		// BoardService에서 boardMdoifyProc 실행
		String msg = service.boardModifyProc(board);
		
		// 게시글 수정 성공시 실행
		if(msg.equals("게시글 수정 성공"))
			return "redirect:boardContent2?no="+board.getNo(); // 해당 게시글로 이동
		
		// 게시글 수정 실패시 실행
		ra.addFlashAttribute("msg", msg);
		return "redirect:boardModify2?no="+board.getNo();
	}
	
	@RequestMapping("boardDeleteProc2")
	public String boardDeleteProc2(String no, RedirectAttributes ra) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:board2Login";
		
		// BoardService에서 boardMdoifyProc 실행
		String msg = service.boardDeleteProc(no);
				
		// 게시글 삭제 성공시 실행
		if(msg.equals("게시글 삭제 완료"))
			return "redirect:boardForm2";
		
		// 게시글 삭제 실패시 실행
		ra.addFlashAttribute("msg", msg);
		return "redirect:boardContent2?no="+no;
	}


}
