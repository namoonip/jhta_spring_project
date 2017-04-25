package kr.co.jhta.dao.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.Board;
import kr.co.jhta.vo.BoardView;
import kr.co.jhta.vo.SearchForm;

public interface BoardDao {

	void addNoticeBoard(Board board);

	int searchBoardCount(SearchForm searchForm);

	List<Board> searchBoard(SearchForm searchForm);

	void deleteBoardByNo(int no);

	Board getBoard(int no);

	void updateBoard(Map<String, Object> map);

	void updateBoardByViewUser(HashMap<String, Object> map);

	void updateCount(int bno);

	void addBoardView(BoardView view);

	List<BoardView> getBoardViewUser(int bno);

	List<Board> serachBoardByType(String boardType);

	void deleteView(int no);

	void addProfBoard(Board board);

	void addStuQnaBoard(Board board);

	void addFreeBoard(Board board);

	void addDeptBoard(Board board);

	List<Board> getProfQnaBoard(String id);

	int countProfBoard(String id);

	List<Board> searchNoticeBoardByCount(String BOARDTYPE);

	List<Board> searchDeptBoardByCount(SearchForm searchForm);

}
