package kr.co.jhta.todo.controller.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.AbstractView;

@Service
public class FiledownloadView extends AbstractView{

	@Override // IRVR이 아니라 다른 파일 다운로드 뷰로 데이터를 보낸다.
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// Map객체 형태의 Model객체에서 파일 이름과 경로를 가져오기.
		String filename = (String) model.get("filename");
		String directory = (String) model.get("directory");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", 
				"attachment;filename=" + URLEncoder.encode(filename, "utf-8"));
		// 서버에서 파일을 outputStream으로 내려보내준다.
		// 응답객체의 OutputStream은 웹서버에 브라우저 데이터를 보내는 스트림이다.
		OutputStream out = response.getOutputStream();
		IOUtils.copy(new FileInputStream(new File(directory, filename)), out);		
	}
	
}
