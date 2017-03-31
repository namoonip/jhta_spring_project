package com.example.erp;

public class Pagination {
	
	private int pagesPerBlock = 5;		// 한 화면에 표시할 내비게이션 개수
	private int rowsPerPage = 5;		// 한 화면에 표시할 데이터 개수
	private int currentPage;			// 현재 페이지 번호
	private int totalRows;				// 전체 데이터 개수	
	
	//private int totalPages;			// 전체 페이지 개수
	//private int beginIndex;			// 조회 시작번호
	//private int endIndex;				// 조회 끝번호
	
	public Pagination(int currentPage, int totalRows) {
		this.currentPage = currentPage;
		this.totalRows = totalRows;
	}
	
	public Pagination(int rowsPerPage, int currentPage, int totalRows) {
		this.rowsPerPage = rowsPerPage;
		this.currentPage = currentPage;
		this.totalRows = totalRows;
	}
	
	// 전체 페이지 개수 계산 : ex) 110/10 -> 총 페이지는 11 Page
	public int getTotalPages() {
		return (int) Math.ceil((double)totalRows/rowsPerPage);
	}
	
	// 현재 페이지 번호
	public int getCurrentPage() {
		return currentPage;
	}
	
	// 조회 시작번호
	public int getBeginIndex() {
		return (currentPage -1) * rowsPerPage + 1;
	}
	
	// 조회 끝번호
	public int getEndIndex() {
		return currentPage * rowsPerPage;
	}
	
	// 전체 페이지 블록 개수
	public int getTotalBlocks() {
		return (int) Math.ceil((double) getTotalPages()/pagesPerBlock);
	}
	
	// 현재 블록 번호
	public int getCurrentBlock() {
		return (int) Math.ceil((double) currentPage/pagesPerBlock);
	}
	
	// 표시할 페이지 시작 번호
	public int getBeginPage() {
		return (getCurrentBlock() - 1) * pagesPerBlock + 1;
	}
	
	// 표시할 페이지 끝 번호
	public int getEndPage() {
		int endPage = getCurrentBlock() * pagesPerBlock;
		if(getCurrentBlock() == getTotalBlocks()) {
			endPage = getTotalPages();
		}
		return endPage;
	}
	
	// 이전 블록의 페이지 번호
	public int getPrevBlock() {
		return (getCurrentBlock() - 1) * pagesPerBlock;
	}
	
	// 다음 블록의 페이지 번호
	public int getNextBlock() {
		return getCurrentBlock() * pagesPerBlock + 1;
	}
	
	/*public void setRowsPerPage(int rowsPerPage) {
	this.rowsPerPage = rowsPerPage;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}*/ // set이 너무 길기 때문에 아래의 생성자로 만듦.
}
