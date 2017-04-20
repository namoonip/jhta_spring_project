package kr.co.jhta.controller.open;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.service.openlecture.OpenLectureService;
import kr.co.jhta.vo.LectureEvaluationSheet;
import kr.co.jhta.vo.ProfessorOpenLecture;
import kr.co.jhta.vo.ProfessorSubject;

@RestController
public class OpenLectureRest {	

	@Autowired
	private OpenLectureService openlectureservice;
	
	
	@GetMapping(path="/search/{Search}")
	public @ResponseBody List<ProfessorOpenLecture> getProfessorOpenLecture(@PathVariable("Search") String id){
		
		System.out.println(id);
		
		List<ProfessorOpenLecture> professorId = openlectureservice.getInformationProfessor(id);
		
		
		if (professorId == null) {
			
			ProfessorOpenLecture professor = new ProfessorOpenLecture();
		}
		
		return professorId;
	}
	
	
	//조회관련 테이블
	@GetMapping(path="/searchtable/{SearchTable}")
	public @ResponseBody List<ProfessorSubject> getProfessorSubject(@PathVariable("SearchTable") String id){
		
		List<ProfessorSubject> professorsubject= openlectureservice.subjectInquiries(id);
		
		return professorsubject;
	}
	
	
	//모달 관련 ajax
	@GetMapping(path="/subjectNo/{SubjectNo}")
	public @ResponseBody List<LectureEvaluationSheet> getSheetContents(@PathVariable("SubjectNo") int subjectNo){
		
		List<LectureEvaluationSheet> evaluationSheet = openlectureservice.getLecturEevaluationSheet(subjectNo);
		
		return evaluationSheet;
		
	}
}

