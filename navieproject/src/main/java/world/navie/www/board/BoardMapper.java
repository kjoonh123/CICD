package world.navie.www.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {
	// [ Board Form ]
	List<BoardDTO> boardForm (@Param("begin")int begin, @Param("end")int end);
	int totalCount();
	
	// [ Board Write ]
	void boardWriteProc(BoardDTO board);
	
	// [ Board Content ]
	BoardDTO boardContent(int n);
	void incrementHits(int n);
	String boardDownload(int n);
	
	// [ Board Modify & Delete ]
	int boardModifyProc(BoardDTO board);
	void boardDeleteProc(int n);

}
