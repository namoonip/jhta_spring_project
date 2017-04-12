package kr.co.jhta.controller.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.service.user.StudentService;
import kr.co.jhta.vo.SiteMap;

@Controller
public class StuEnrollController {
	
	@Autowired
	StudentService stuService;
	
	@Autowired
	SitemapService sitemapService;
	
	private static final Logger logger = LoggerFactory.getLogger(StuEnrollController.class);
	
	@RequestMapping(value="/enroll", method=RequestMethod.GET)
	public String stuEnroll(Model model) {
		List<SiteMap> sitemapPreList = sitemapService.getAllSitemapPreService();
//		List<SiteMap> sitemapSecList = sitemapService.getAllSitemapSecService(); 
		model.addAttribute("sitemapPreList", sitemapPreList);
//		model.addAttribute("sitemapSecList", sitemapSecList);
		
		return "/student/enroll/enrollMain";
	}
	
	@RequestMapping(value="/enroll", method=RequestMethod.POST)
	public String stuEnrollProcess() {
		
		return "redirect:/student/enroll/enrollMain";
	}
	
	
	
	
}
