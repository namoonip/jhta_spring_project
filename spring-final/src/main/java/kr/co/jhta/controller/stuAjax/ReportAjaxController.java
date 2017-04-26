package kr.co.jhta.controller.stuAjax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.service.report.StuReportService;

@RestController
@RequestMapping("/stud")
public class ReportAjaxController {

	@Autowired
	StuReportService stuRepService;
	
	@PostMapping(path="/deleteReportFile/{cno}/{filename}")
	public @ResponseBody String deleteFilename(@PathVariable("filename") String filename, @PathVariable("cno") int cno) {
		String filingname = stuRepService.getFilenameByLike1Service(cno, filename);
		if(filingname != null) {
			stuRepService.deleteFilename1Service(cno, filingname);					
		}
		
		String filingname2 = stuRepService.getFilenameByLike2Service(cno, filename);
		if(filingname2 != null) {
			stuRepService.deleteFilename1Service(cno, filingname2);					
		}
		
		String filingname3 = stuRepService.getFilenameByLike3Service(cno, filename);
		if(filingname3 != null) {
			stuRepService.deleteFilename1Service(cno, filingname3);					
		}
		
		String filingname4 = stuRepService.getFilenameByLike4Service(cno, filename);
		if(filingname4 != null) {
			stuRepService.deleteFilename1Service(cno, filingname4);					
		}
		
		String filingname5 = stuRepService.getFilenameByLike5Service(cno, filename);
		if(filingname5 != null) {
			stuRepService.deleteFilename1Service(cno, filingname5);					
		}

		return "success";
	}
	
	
}
