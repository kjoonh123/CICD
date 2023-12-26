package world.navie.www.board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import world.navie.www.PageService;

import jakarta.servlet.http.HttpSession;

@Service
public class BoardService {
	@Autowired
	private BoardMapper mapper;

	// [ Board Form ]
	public void boardForm(String cp, Model model) {
		
		// 현재 페이지 설정
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}
		
		// 목록 출력 관련 설정들
		int pageBlock = 8; // 한 페이지 당 출력할 목록의 개수
		int end = pageBlock * currentPage;
		int begin = end - pageBlock + 1;
		
		// DB의 board 테이블에서 출력할 목록 관련 데이터를 SELECT
		List<BoardDTO> boards = mapper.boardForm(begin, end);
		int totalCount = mapper.totalCount();

		// 목록 존재 확인
		if (totalCount == 0) {
			return;
		}
		
		// 목록 관련 설정
		String url = "boardForm?currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);
		
		// List<BoardDTO>와 result롤 view로 전달
		model.addAttribute("boards", boards);
		model.addAttribute("result", result);
	}

	
	// [ Board Write & Upload ]
	@Autowired
	private HttpSession session;

	public String boardWriteProc(MultipartHttpServletRequest multi, 
								@RequestParam("file") MultipartFile multipart) {
		
		// 세션 확인
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:boardLogin";
		
		// 제목 입력 확인
		String title = multi.getParameter("title");
		if (title == null || title.trim().isEmpty()) {
			return "redirect:boardWrite";
		}
		
		// BoardDTO setting
		BoardDTO board = new BoardDTO();
		board.setTitle(title);
		board.setContent(multi.getParameter("content"));
		board.setId(sessionId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		board.setWriteDate(sdf.format(new Date()));
		board.setFileName(null);
		
		// 파일 존재 체크, 존재하면 S3에 업로드 후 BoardDTO setting
		if (multipart.getSize() != 0) { 
			String fileName = multipart.getOriginalFilename();
			try {
				S3Util.uploadFile(fileName, multipart.getInputStream());			
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			board.setFileName(fileName);
		}

		// DB의 board 테이블에 INSERT (글번호 설정은 mapper에서 처리. 현존하는 글번호의 최댓값에 1을 더한 값)
		mapper.boardWriteProc(board); // 조회수랑 게시글 번호는 INSERT 명령 시 입력
		
		return "redirect:boardForm";
	}

	
	// [ Board Content & Download ]
	public BoardDTO boardContent(String no) {
		
		// 글번호 설정
		int n = 1;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return null;
		}

		// DB의 board 테이블에서 해당 글번호의 데이터를 SELECT
		BoardDTO board = mapper.boardContent(n);
		
		// 조회시 조회수 증가 (null 처리는 controller에서)
		if (board != null) { 
			mapper.incrementHits(n); 
			board.setHits(board.getHits() + 1);
		}
		
		return board;
	}

	
	// [ Board Modify & Delete ]
	public String boardModify(String no, Model model) {
		
		// 글번호 확인
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return "redirect:boardForm";
		}
		
		// DB의 board 테이블에서 해당 글번호의 데이터를 SELECT
		BoardDTO board = mapper.boardContent(n);
		if (board == null)
			return "redirect:boardForm";
		
		// 해당 BoardDTO를 view로 전달
		model.addAttribute("board", board);	
		return "board/boardModify";
	}

	public String boardModifyProc(BoardDTO board) {
		
		// DB의 board 테이블에서 해당 글번호의 데이터를 SELECT
		BoardDTO check = mapper.boardContent(board.getNo());
		
		// null 확인
		if (check == null)
			return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";

		// 세션 확인 - 로그인한 아이디와 작성자 아이디가 같은지 확인
		String sessionId = (String) session.getAttribute("id");
		if (check.getId().equals(sessionId) == false)
			return "작성자만 수정 할 수 있습니다.";
		
		// 제목 확인
		if (board.getTitle() == null || board.getTitle().trim().isEmpty()) {
			return "제목을 입력하세요.";
		}

		// 수정 확인
		int result = mapper.boardModifyProc(board);
		if (result == 0)
			return "게시글 수정에 실패했습니다. 다시 시도하세요.";

		return "게시글 수정 성공";
	}

	public String boardDeleteProc(String no) {
		
		// 글번호 확인
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";
		}

		// DB의 board 테이블에서 해당 글번호의 데이터를 SELECT
		BoardDTO board = mapper.boardContent(n);
		
		// null 확인
		if (board == null)
			return "게시글이 없습니다. 다시 시도하세요.";

		// 로그인한 아이디와 작성자 아이디가 같은지 확인
		String sessionId = (String) session.getAttribute("id");
		if (board.getId().equals(sessionId) == false)
			return "작성자 또는 관리자만 삭제 할 수 있습니다.";
		
		String fileName = board.getFileName();
//		if (fileName != null) { // 테이블에 파일이름이 있다면 삭제
//			// 시간이 있으면 구현
//		}

		// DB의 board 테이블에서 게시글번호와 일치하는 행(row)을 DELETE
		mapper.boardDeleteProc(n);
		
		return "게시글 삭제 완료";
	}

}
