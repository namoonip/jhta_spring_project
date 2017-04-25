package kr.co.jhta.dao.report;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Preport;
import kr.co.jhta.vo.PreportContent;

@Transactional
public interface StuReportDao {
	
	void addNewReport(PreportContent stuReport);
	void addNewReportPlusShow(PreportContent stuReport);
	
	PreportContent getStuReportByStuNo(int stuNo);
	List<PreportContent> getStuAllReportByEno(int eno);
	List<Preport> getAllProfReport(int eno);

	Preport getProfReportByPno(int pno);
	PreportContent getStuReportByCno(int cno);
	
	void deleteReportByCno(Map<String, Object> map);
}