package world.navie.www.board;

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
public class BoardController {
	@Autowired private BoardService service;
	
	// [ Board Form ]
	@RequestMapping("boardForm")
	public String boardForm(Model model, 
			@RequestParam(value="currentPage", required = false)String cp) {
		
		// 세션 확인은 view에서
		
		// BoardService에서 boardForm 실행
		service.boardForm(cp, model);
		
		return "board/boardForm";
	}
	
	
	// [ Board Write & Upload ]
	@Autowired private HttpSession session;
	
	@RequestMapping("boardWrite")
	public String boardWrite() {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:boardLogin";
		
		return "board/boardWrite";
	}
	
	@PostMapping("boardWriteProc")
	public String boardWriteProc(MultipartHttpServletRequest multi, 
									@RequestParam("file") MultipartFile multipart, 
									Model model) {
		// 세션 확인
		String sessionId = (String)session.getAttribute("id");
		if(sessionId == null)
			return "redirect:boardLogin";
		
		// BoardService에서 boardWriteProc 실행
		String path = service.boardWriteProc(multi, multipart);

		return path;
	}
	
	
	// [ Board Content ]
	@RequestMapping("boardContent")
	public String boardContent(String no, Model model) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:boardLogin";
		
		// boardDTO를 view로 전달
		BoardDTO board = service.boardContent(no);
		if (board == null) {
			return "redirect:boardForm";
		}
		model.addAttribute("board", board);
		
		return "board/boardContent";
	}
	

	// [ Board Modify & Delete ]
	@RequestMapping("boardModify")
	public String boardModify(String no, Model model) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:boardLogin";
		
		// BoardService에서 boardMdoify 실행
		String path = service.boardModify(no, model);
		
		return path;
	}
	
	@PostMapping("boardModifyProc")
	public String boardModifyProc(BoardDTO board, RedirectAttributes ra) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:boardLogin";
		
		// BoardService에서 boardMdoifyProc 실행
		String msg = service.boardModifyProc(board);
		
		// 게시글 수정 성공시 실행
		if(msg.equals("게시글 수정 성공"))
			return "redirect:boardContent?no="+board.getNo(); // 해당 게시글로 이동
		
		// 게시글 수정 실패시 실행
		ra.addFlashAttribute("msg", msg);
		return "redirect:boardModify?no="+board.getNo();
	}
	
	@RequestMapping("boardDeleteProc")
	public String boardDeleteProc(String no, RedirectAttributes ra) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if(sessionId == null)
			return "redirect:boardLogin";
		
		// BoardService에서 boardMdoifyProc 실행
		String msg = service.boardDeleteProc(no);
				
		// 게시글 삭제 성공시 실행
		if(msg.equals("게시글 삭제 완료"))
			return "redirect:boardForm";
		
		// 게시글 삭제 실패시 실행
		ra.addFlashAttribute("msg", msg);
		return "redirect:boardContent?no="+no;
	}


}
