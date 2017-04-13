package kr.co.jhta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.lecture.LectureService;
import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.vo.SiteMap;
import kr.co.jhta.vo.Subject;

@Controller
public class AdminRegisterSubjectController {
	
	@Autowired
	private SitemapService sitemapService;
	
	@Autowired
	private LectureService lectureService;
	
	@RequestMapping(value="/adminregsubject", method=RequestMethod.GET)
	public String adminRegSubject(Model model) {
		List<SiteMap> deptList = sitemapService.getAllSitemapPreService();
		
		if (deptList == null) {
			throw new RuntimeException("Data is not found.");
		}
		
		model.addAttribute("deptList", deptList);
		
		return "administer/adminregsubject";
	}
	
	// 대학을 선택하면 
	@RequestMapping(value="/adminregsubjectmenu", method=RequestMethod.POST)
	public @ResponseBody List<SiteMap> adminRegSubjectGetDept(String dept) {
		SiteMap siteMap = new SiteMap();
		siteMap.setPreCode(dept);;
		
		return sitemapService.getAllSitemapSecService(siteMap);
	}
	
	// 대학과 학과를 선택해서 조회
	@RequestMapping(value="/adminregsubject", method=RequestMethod.POST)
	public String adminRegSubjectSearch(Model model, String major) {
		List<SiteMap> deptList = sitemapService.getAllSitemapPreService();
		List<Subject> subList = lectureService.getMajorList(major);
		SiteMap searchDept = lectureService.getDetpList(major);
		
		for (int i=0; i<subList.size(); i++) {
			subList.get(i).getSiteCode().setName(searchDept.getName());
		}
		
		model.addAttribute("deptList", deptList);	
		model.addAttribute("subList", subList);
		
		return "administer/adminregsubject";
	}
	
	
	@RequestMapping("/adminregstudent")
	public String adminRegStudent() {
		return "administer/adminregstudent";
	}
	
	@RequestMapping("/adminsendemail")
	public String adminSendEmail() {
		return "administer/adminsendemail";
	}
	
	@RequestMapping("/adminsendemailbox")
	public String adminSendEmailBox() {
		return "administer/adminsendemailbox";
	}
	
	@RequestMapping("/adminrecievemailbox")
	public String adminRecieveEmailBox() {
		return "administer/adminrecievemailbox";
	}
}
