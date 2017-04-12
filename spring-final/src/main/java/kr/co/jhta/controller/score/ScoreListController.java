package kr.co.jhta.controller.score;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.service.score.ScoreService;
import kr.co.jhta.vo.Score;
import kr.co.jhta.vo.Scorelist;
import kr.co.jhta.vo.SubjectRegister;


@Controller
public class ScoreListController {
	@Autowired
	private ScoreService scoreService;
	
	@RequestMapping("/scorelist.do")
	public String scorelist(Model model){
		
		List<Scorelist> scoreinfolist = new ArrayList<Scorelist>();
		
		List<Score> scorelist = scoreService.getAllScoreList();
		for(Score score : scorelist){
			SubjectRegister srlist = scoreService.getRegiInfo(score.getRegiNo());
			Scorelist sclist = new Scorelist();
			sclist.setNo(srlist.getRegiNo());
			sclist.setStudent(scoreService.getStudentInfo(srlist.getStuNo()));
			sclist.setSubject(scoreService.getSubjectInfo(srlist.getjNo()));
			sclist.setScore(score);
			scoreinfolist.add(sclist);
		}
		model.addAttribute("scoreinfolist", scoreinfolist);
		
		return "score/scorelist";
	}
		
}
