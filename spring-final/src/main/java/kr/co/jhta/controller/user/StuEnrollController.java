package kr.co.jhta.controller.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.service.sitemap.EnrollService;
import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.service.user.StudentService;
import kr.co.jhta.vo.SiteMap;
import kr.co.jhta.vo.stu.Enroll;

@Controller
public class StuEnrollController {
	
	@Autowired
	StudentService stuService;
	
	@Autowired
	EnrollService enrollService;
	
	@Autowired
	SitemapService sitemapService;
	
	private static final Logger logger = LoggerFactory.getLogger(StuEnrollController.class);
	
	@RequestMapping(value="/enrollMain", method=RequestMethod.GET)
	public String stuEnroll(Model model) {
		
		// 수강신청 검색
		List<SiteMap> sitemapPreList = sitemapService.getAllSitemapPreService();
//		List<SiteMap> sitemapSecList = sitemapService.getAllSitemapSecService(); 
		model.addAttribute("sitemapPreList", sitemapPreList);
//		model.addAttribute("sitemapSecList", sitemapSecList);
		
		// 수강신청 목록 뿌려주기
		List<Enroll> enrollList = enrollService.getAllEnrollService();
		model.addAttribute("enrollList", enrollList);
		
		return "/student/enroll/enrollMain";
	}
	
	@RequestMapping(value="/enroll", method=RequestMethod.POST)
	public String stuEnrollProcess(Model model) {
		
		
		return "redirect:/student/enroll/enrollMain";
	}
		
}
