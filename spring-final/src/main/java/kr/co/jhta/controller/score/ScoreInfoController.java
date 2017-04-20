package kr.co.jhta.controller.score;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.jhta.dao.score.ScoreDao;
import kr.co.jhta.vo.SemesterAvg;
import kr.co.jhta.vo.stu.Regisubject;

@Controller
public class ScoreInfoController {
	@Autowired
	private ScoreDao scoreDao;
	
	@RequestMapping("/scoreInfo.do")
	public String scoreInfo(@RequestParam String stuno, Model model){
		int sno = Integer.parseInt(stuno);
		List<Regisubject> regilist = scoreDao.getSearchInfoBySno(sno);
		SemesterAvg savg = scoreDao.getSemesterAvgBySno(sno);
		model.addAttribute("regilist", regilist);
		model.addAttribute("savg", savg);
		
		return "score/scoreInfoList";
	}
}
