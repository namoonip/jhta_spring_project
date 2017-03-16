package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Board;

public interface BoardDao {
	void addBoard(Board board);
	List<Board> getAllBoards();
}
