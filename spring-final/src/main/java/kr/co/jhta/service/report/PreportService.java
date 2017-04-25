package kr.co.jhta.service.report;

import java.util.List;

import kr.co.jhta.vo.Preport;

public interface PreportService {
	void addreport(Preport preport);
	List<Preport> getProftitle(int no);
	Preport getByProfNo(int no);
	List<Preport> getProfEnroll(String id);
	Preport getupdatereport(int no);
	void getByNoupdate(Preport preport);
	void deleteReport(int no);
}
