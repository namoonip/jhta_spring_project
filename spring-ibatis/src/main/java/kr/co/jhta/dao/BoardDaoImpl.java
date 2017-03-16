package kr.co.jhta.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import kr.co.jhta.vo.Board;

public class BoardDaoImpl implements BoardDao{
	
	// 클래스에 관련된 로그 정보를 전달한다.
	static Logger logger = Logger.getLogger(BoardDaoImpl.class);
	
	private SqlMapClientTemplate template;
	
	public void setTemplate(SqlMapClientTemplate template) {
		this.template = template;
	}	
	
	public void addBoard(Board board) {
		logger.debug("start");
		logger.debug("게시글" + board);
		template.insert("addBoard", board);
		logger.debug("end");
	}
	
	@SuppressWarnings("unchecked")
	public List<Board> getAllBoards() {
		logger.debug("start");
		List<Board> boardList = template.queryForList("getAllBoards");
		logger.debug("조회 결과:" + boardList);
		logger.info("조회 건수:" + boardList.size());
		logger.debug("end");
		return boardList;
	}
}
