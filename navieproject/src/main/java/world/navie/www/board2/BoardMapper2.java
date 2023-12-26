package world.navie.www.board2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper2 {
	// [ Board Form ]
	List<BoardDTO2> boardForm (@Param("begin")int begin, @Param("end")int end);
	int totalCount();
	
	// [ Board Write ]
	void boardWriteProc(BoardDTO2 board);
	
	// [ Board Content ]
	BoardDTO2 boardContent(int n);
	void incrementHits(int n);
	String boardDownload(int n);
	
	// [ Board Modify & Delete ]
	int boardModifyProc(BoardDTO2 board);
	void boardDeleteProc(int n);

}
