package com.example.erp;

import java.util.List;

public interface EmployeeDao {
	
	// 검색 조건과 일치하는 데이터행의 개수 조회
	int getRowCount(SearchForm searchForm);
	
	// 검색 조건과 일치하는 데이터 조회하기
	List<Employee> getEmployees(SearchForm searchForm);
}
