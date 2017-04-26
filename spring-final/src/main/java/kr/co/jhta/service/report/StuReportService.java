package kr.co.jhta.service.report;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Preport;
import kr.co.jhta.vo.PreportContent;

@Transactional
public interface StuReportService {

	void addNewReportService(PreportContent stuReport);
	void addNewReportPlusShowService(PreportContent stuReport);
	
	PreportContent getStuReportByStuNoService(int stuNo);
	List<PreportContent> getStuAllReportByEnoService(int eno);
	List<Preport> getAllProfReportService(int eno);
	
	Preport getProfReportByPnoService(int pno);
	PreportContent getStuReportByCnoService(int cno);
	
	void deleteReportByCno(int cno, int stuNo);
	
	void updateStuReportService(PreportContent preportContent);
	String getAttchFileNameService(int no);
	
	PreportContent getStuAllReportByEno1(int no);
	
	String getFilenameByLike1Service(int cno, String filename);
	String getFilenameByLike2Service(int cno, String filename);
	String getFilenameByLike3Service(int cno, String filename);
	String getFilenameByLike4Service(int cno, String filename);
	String getFilenameByLike5Service(int cno, String filename);
	
	void deleteFilename1Service(int cno, String filefullname);
	void deleteFilename2Service(int cno, String filefullname);
	void deleteFilename3Service(int cno, String filefullname);
	void deleteFilename4Service(int cno, String filefullname);
	void deleteFilename5Service(int cno, String filefullname);
}
