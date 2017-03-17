package kr.co.jhta.model2;

import javax.servlet.http.HttpServletRequest;

public interface Controller {

		/**
		 * 
		 * @param req 클라이언트가 서버로 전송한 요청 메세지를 담고 있는 HttpServletRequert
		 * @return
		 * @throws Exception
		 */
		String exec(HttpServletRequest req) throws Exception;
}
