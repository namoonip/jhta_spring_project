package kr.co.jhta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.vo.SiteMap;

@Controller
public class AdminRegisterSubjectController {
	
	@Autowired
	private SitemapService sitemapService;
	
	@RequestMapping(value="/adminregsubject", method=RequestMethod.GET)
	public String adminRegSubject(Model model) {
		List<SiteMap> deptList = sitemapService.getAllSitemapPreService();
		
		if (deptList == null) {
			throw new RuntimeException("Data is not found.");
		}
		
		model.addAttribute("deptList", deptList);
		
		return "administer/adminregsubject";
	}
	
	@RequestMapping(value="/adminregsubject", method=RequestMethod.POST)
	public List<SiteMap> adminRegSubjectGetDept(String dept) {
		
		return null;
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
