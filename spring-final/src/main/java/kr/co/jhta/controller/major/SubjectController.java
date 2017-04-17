package kr.co.jhta.controller.major;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.major.SemesterService;
import kr.co.jhta.service.major.SubjectService;
import kr.co.jhta.service.professor.ProfessorService;
import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.vo.Professor;
import kr.co.jhta.vo.Semester;
import kr.co.jhta.vo.SiteMap;
import kr.co.jhta.vo.Subject;

@Controller
@RequestMapping("/admin")
public class SubjectController {

	@Autowired
	private SitemapService sitemapService;
	
	@Autowired
	private SemesterService semesterService;
	
	@Autowired
	private ProfessorService professorService;
	
	@Autowired
	private SubjectService subjectService;
	
	
	@RequestMapping("/subjectmain")
	public String subjectMain(Model model) {
		return "major/subjectmain";
	}
	
	@RequestMapping(value="/addsubject", method=RequestMethod.GET)
	public String subjectform(Model model) {
		
		List<SiteMap> deptList = sitemapService.getAllSitemapPreService();
		List<Semester> semeList = semesterService.getAllSemester(); 
		if (deptList == null) {
			throw new RuntimeException("Data is not found.");
		}
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("semeList", semeList);
		
		return "major/subjectform";
	}
	
	// 대학을 선택하면 학과들이 검색되도록 하는 ajax 검색 기능
	@RequestMapping(value="/addmajormenu", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, List> addSubjectDept(String dept) {
		SiteMap siteMap = new SiteMap();
		siteMap.setPreCode(dept);
		List<SiteMap> sitemapList = sitemapService.getAllSitemapSecService(siteMap);
		List<Professor> profList = professorService.getProListByTCode(sitemapList.get(0).getCode());
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("sitemapList", sitemapList);
		map.put("profList", profList);
		return map;
	}
	
	// 학과 선택하면 교수를 불러오는 ajax 검색 기능
	@RequestMapping(value="/addprofmenu", method=RequestMethod.POST)
	public @ResponseBody List<Professor> addProfDept(String code) {
		
		return professorService.getProListByTCode(code);
	}
	
	
	@RequestMapping(value="/addsubject", method=RequestMethod.POST)
	public String registersubject(Subject subjectaddform, String major, String semeSelect, String professorId) throws Exception {
		
		Semester semester = new Semester();
		SiteMap sitemap = new SiteMap();
		Professor professor = new Professor();
		semester.setSemeSelect(semeSelect);
		sitemap.setCode(major);
		professor.setId(professorId);
		
		subjectaddform.setSelectNo(semester);
		subjectaddform.setSiteCode(sitemap);
		subjectaddform.setProfessor(professor);
		
		subjectService.addSubject(subjectaddform);
		return "redirect:/admin/subjectmain";
	}
	
	
}
