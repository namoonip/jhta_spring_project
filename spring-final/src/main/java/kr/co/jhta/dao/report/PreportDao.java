package kr.co.jhta.dao.report;

import java.util.List;

import kr.co.jhta.vo.Preport;

public interface PreportDao {
	void addreport(Preport preport);
	List<Preport> getProftitle(int no);
	Preport getByProfNo(int no);
	List<Preport> getProfEnroll(String id);
	Preport getupdatereport(int no);
	void getByNoupdate(Preport preport);
	void deleteReport(int no);
}
