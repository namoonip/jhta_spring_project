package kr.co.jhta.model2;

import javax.servlet.http.HttpServletRequest;

/**
 * 클라이언트의 요청처리를 담당하는 컨트롤러 클래스는 반드시 이 인터페이스를 수현해서 작성한다.
 * @author JHTA
 */
public interface Controller {

		/**
		 * @param req 클라이언트가 서버로 전송한 요청 메세지를 담고 있는 HttpServletRequert객체다.
		 * @return 클라이언트의 요청처리가 완료된 후 이동할 URL이다.
		 * @throws Exception
		 */
		String exec(HttpServletRequest req) throws Exception;
}
