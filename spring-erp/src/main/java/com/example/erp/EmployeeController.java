package com.example.erp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeDao employeeDao;
	
	@RequestMapping("/search.do")
	public String search(SearchForm searchForm, Model model) {
		
		// 검색 조건과 일치하는 데이터 개수 조회하기
		int rows = employeeDao.getRowCount(searchForm);
		
		// 현재 페이지 번호, 조회덴 데이터 개수로 Pagination객체 생성하기
		Pagination pagination = null; 
		if (searchForm.getDisplay() != 0) {			
			pagination = new Pagination(searchForm.getDisplay(), searchForm.getPageNo(), rows);
		} else {
			pagination = new Pagination(searchForm.getPageNo(), rows);
		}
		// 현재 페이지 번호에 해당하는 조회 시작번호와 조회 끝번호를 SearchForm에 저장하기
		searchForm.setBeginIndex(pagination.getBeginIndex());
		searchForm.setEndIndex(pagination.getEndIndex());
		
		// 검색 조건과 일치하는 데이터 조회하기
		List<Employee> employees = employeeDao.getEmployees(searchForm);
		// jsp에 조회된 데이터 전달하기
		model.addAttribute("employees", employees);
		// jsp에 페이지 내비게이션 정보 전달하기
		model.addAttribute("pagination", pagination);
		// jsp에 검색 정보 전달하기
		model.addAttribute("search", searchForm);
		
		return "search";
	}
}


