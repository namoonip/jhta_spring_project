package kr.co.jhta1;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;

import kr.co.jhta.dao.BoardDao;
import kr.co.jhta.vo.Board;

public class App {
	public static void main(String[] args) {
		
		String resources = "classpath:/META-INF/spring/app-context.xml";
		GenericXmlApplicationContext container
			= new GenericXmlApplicationContext(resources);
		
		BoardDao dao = container.getBean("boardDao", BoardDao.class);
		
		Board board = new Board("테스트", "관리자", "게시판 테스트중입니다.");
		dao.addBoard(board);
		
		List<Board> boardList = dao.getAllBoards();
		
		System.out.println("게시글 개수 : " + boardList.size());
	}
}
