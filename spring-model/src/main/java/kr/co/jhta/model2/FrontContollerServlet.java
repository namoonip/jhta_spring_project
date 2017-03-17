package kr.co.jhta.model2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class FrontContollerServlet extends HttpServlet{
	
	private ApplicationContext context = null;
	
	@Override
	public void init() throws ServletException {
		String resources = "classpath:/META-INF/spring/applicationContext.xml";
		context = new GenericXmlApplicationContext(resources);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = req.getRequestURI().replace(req.getContextPath(), "");
		System.out.println("요청 url[" + url + "]");
		
		try {
			Controller controller = (Controller) context.getBean(url);
			String path = controller.exec(req);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}
