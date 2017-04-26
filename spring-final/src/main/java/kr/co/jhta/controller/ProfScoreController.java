package kr.co.jhta.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.service.score.ScoreService;
import kr.co.jhta.vo.Professor;
import kr.co.jhta.vo.Score;
import kr.co.jhta.vo.stu.Regisubject;

@Controller
public class ProfScoreController {
	@Autowired
	private ScoreService scoreService;
	
	@RequestMapping("/prof/profscorelist")
	public String profscorelist(HttpSession session, Model model){
		Professor prof = (Professor) session.getAttribute("LOGIN_USER");
		List<Regisubject> regilist =  scoreService.getAllScorelistByProfID(prof.getId());
		model.addAttribute("regilist", regilist);
		
		return "/prof/score/profscorelist";
	}
	
	@RequestMapping(value="/prof/scoreform", method=RequestMethod.GET)
	public String scoreedit(@RequestParam String sno, Model model){
		int no = Integer.parseInt(sno);
		Score score = scoreService.getScoreByNo(no);
		model.addAttribute("no", no);
		model.addAttribute("score", score);
		model.addAttribute("scoreupdate", new Score());
		return "/prof/score/scoreform";
	}
	
	@RequestMapping(value="/prof/scoreform", method=RequestMethod.POST)
	public String scoreupdate(@Valid @ModelAttribute("scoreupdate") Score scores, Errors errors){
		if(errors.hasErrors()){
			return "/prof/scoreform";
		}
		scoreService.updateScoreByNo(scores);
		return "redirect:/prof/profscorelist";
	}
}
