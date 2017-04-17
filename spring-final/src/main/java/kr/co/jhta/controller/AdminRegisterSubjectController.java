package kr.co.jhta.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.lecture.LectureService;
import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.vo.Semester;
import kr.co.jhta.vo.SiteMap;

@Controller
public class AdminRegisterSubjectController {
	
	@Autowired
	private SitemapService sitemapService;
	
	@Autowired
	private LectureService lectureService;
	
	@RequestMapping(value="/adminregsubject", method=RequestMethod.GET)
	public String adminRegSubject(Model model) {
		List<SiteMap> deptList = sitemapService.getAllSitemapPreService();
		List<Semester> semesterList = lectureService.getAllSemesterList();
		
		if (deptList == null) {
			throw new RuntimeException("Data is not found.");
		}
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("semesterList", semesterList);
		
		return "administer/adminregsubject";
	}
	
	// 대학을 선택하면 학과들이 검색되도록 하는 ajax 검색 기능
	@RequestMapping(value="/adminregsubjectmenu", method=RequestMethod.POST)
	public @ResponseBody List<SiteMap> adminRegSubjectGetDept(String dept) {
		SiteMap siteMap = new SiteMap();
		siteMap.setPreCode(dept);;
		
		return sitemapService.getAllSitemapSecService(siteMap);
	}
	
	// 대학과 학과를 선택해서 조회
	@RequestMapping(value="/adminregsubject", method=RequestMethod.POST)
	public String adminRegSubjectSearch(Model model, String major, int semesterNo, int pagination, int currentPageNo) {
		// 화면이 로드될 때마다 선택메뉴가 보이게 하기 위한 리스트 생성문
		model.addAttribute("deptList", sitemapService.getAllSitemapPreService());
		model.addAttribute("semesterList", lectureService.getAllSemesterList());
		
		// 검색했을 때 과목 정보를 가져오는 코드
		List<Map<String, Object>> subTempList = lectureService.getSubjectList(major);
		
		// 검색했을 때 과목 이름을 가져오는 코드
		SiteMap searchDept = lectureService.getDetpList(major);
		
		// 검색했을 때 수강신청기간 정보를 가져오는 코드
		Semester semester = lectureService.getSemesterList(semesterNo);
		
		// 페이지네이션
		int totalRows = lectureService.getSubjectRowCount(major);	// ex> 40
		int totalPageNo = (int) Math.ceil((double) totalRows/pagination);	// ex> 20
		int beginPage = (currentPageNo - 1) * pagination + 1;
		int endPage = currentPageNo * pagination;
		int blockCurrentNo = (int) Math.ceil((double) currentPageNo/5);
		int blockBeginNo = (blockCurrentNo - 1) * 5 + 1;
		int blockEndNo = blockCurrentNo * 5;
		
		// 마지막 블록이 5단위 블록 숫자보다 작을 때 마지막 숫자를 대입하는 코드
		if (blockEndNo > totalPageNo) {
			blockEndNo = totalPageNo;
		}
		
		// 마지막 페이지의 갯수가 페이지 표시 숫자보다 작을 때 페이지 숫자를 대입하는 코드
		if (endPage > totalRows) {
			endPage = totalRows;
		}
		
		Map<String, Object> paginationList = new HashMap<String, Object>();
		paginationList.put("totalPageNo", totalPageNo);
		paginationList.put("blockCurrentNo", blockCurrentNo);
		paginationList.put("blockEndNo", blockEndNo);
		paginationList.put("blockBeginNo", blockBeginNo);
		
		List<Map<String, Object>> subList = new ArrayList<Map<String, Object>>();
		
		// form 대신에 검색된 페이지네이션 갯수만큼 전체 결과에서 페이지 갯수만큼 다시 복사하는 코드
		if (subTempList.size() != 0) {
			for (int i=beginPage-1; i<endPage; i++) {
				subList.add(subTempList.get(i));
			}

			// 과목 정보에 과목 이름을 전부 넣는 코드
			for (int i=0; i<subList.size(); i++) {
				subList.get(i).put("DEPTNAME", searchDept.getName());
				subList.get(i).put("SEMSTART", semester.getEnrollTermStart());
				subList.get(i).put("SEMEND", semester.getEnrollTermEnd());
			}
		}
		
		model.addAttribute("subList", subList);
		model.addAttribute("paginationList", paginationList);
		
		// 페이지네이션 정보를 다시 보내기 위한 코드
		model.addAttribute("major", major);
		model.addAttribute("semesterNo", semesterNo);
		model.addAttribute("pagination", pagination);
		
		return "administer/adminregsubject";
	}
	
	@RequestMapping("/adminallsubject")
	public String adminRegAllSubject(Model model) {
		model.addAttribute("deptList", sitemapService.getAllSitemapPreService());
		model.addAttribute("semesterList", lectureService.getAllSemesterList());
		
		List<Map<String, Object>> subList = lectureService.getAllSubjectList();
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
