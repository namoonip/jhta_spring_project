package kr.co.jhta.service.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.jhta.dao.report.StuReportDao;
import kr.co.jhta.vo.Preport;
import kr.co.jhta.vo.PreportContent;

@Controller
public class StuReportServiceImpl implements StuReportService{

	@Autowired
	StuReportDao stuRepDao;
	
	private Map<String, Object> map = new HashMap<String, Object>();

	@Override
	public void addNewReportService(PreportContent stuReport) {
		stuRepDao.addNewReport(stuReport);
	}

	@Override
	public void addNewReportPlusShowService(PreportContent stuReport) {
		stuRepDao.addNewReportPlusShow(stuReport);
	}

	@Override
	public PreportContent getStuReportByStuNoService(int stuNo) {
		return stuRepDao.getStuReportByStuNo(stuNo);
	}

	@Override
	public List<PreportContent> getStuAllReportByEnoService(int eno) {
		return stuRepDao.getStuAllReportByEno(eno);
	}

	@Override
	public List<Preport> getAllProfReportService(int eno) {
		return stuRepDao.getAllProfReport(eno);
	}

	@Override
	public Preport getProfReportByPnoService(int pno) {
		return stuRepDao.getProfReportByPno(pno);
	} 

	@Override
	public PreportContent getStuReportByCnoService(int cno) {
		return stuRepDao.getStuReportByCno(cno);
	}

	@Override
	public void deleteReportByCno(int cno, int stuNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("stuNo", stuNo);
		stuRepDao.deleteReportByCno(map);
	}

	@Override
	public void updateStuReportService(PreportContent preportContent) {
		stuRepDao.updateStuReport(preportContent);
	}

	@Override
	public String getAttchFileNameService(int no) {
		PreportContent stuReport =  stuRepDao.getStuReportByCno(no);
		return stuReport.getFilename();
	}
	@Override
	public PreportContent getStuAllReportByEno1(int no) {
		return stuRepDao.getStuAllReportByEno1(no);
	}

	
	
	@Override
	public String getFilenameByLike1Service(int cno, String filename) {
		map.put("cno", cno);
		map.put("filename", filename);
		return stuRepDao.getFilenameByLike1(map);
	}

	@Override
	public String getFilenameByLike2Service(int cno, String filename) {
		map.put("cno", cno);
		map.put("filename", filename);
		return stuRepDao.getFilenameByLike2(map);
	}

	@Override
	public String getFilenameByLike3Service(int cno, String filename) {
		map.put("cno", cno);
		map.put("filename", filename);
		return stuRepDao.getFilenameByLike3(map);
	}

	@Override
	public String getFilenameByLike4Service(int cno, String filename) {
		map.put("cno", cno);
		map.put("filename", filename);
		return stuRepDao.getFilenameByLike4(map);
	}

	@Override
	public String getFilenameByLike5Service(int cno, String filename) {
		map.put("cno", cno);
		map.put("filename", filename);
		return stuRepDao.getFilenameByLike5(map);
	}

	@Override
	public void deleteFilename1Service(int cno, String filefullname) {
		map.put("cno", cno);
		map.put("filefullname", filefullname);
		stuRepDao.deleteFilename1(map);
	}

	@Override
	public void deleteFilename2Service(int cno, String filefullname) {
		map.put("cno", cno);
		map.put("filefullname", filefullname);
		stuRepDao.deleteFilename1(map);
	}

	@Override
	public void deleteFilename3Service(int cno, String filefullname) {
		map.put("cno", cno);
		map.put("filefullname", filefullname);
		stuRepDao.deleteFilename1(map);		
	}

	@Override
	public void deleteFilename4Service(int cno, String filefullname) {
		map.put("cno", cno);
		map.put("filefullname", filefullname);
		stuRepDao.deleteFilename1(map);		
	}

	@Override
	public void deleteFilename5Service(int cno, String filefullname) {
		map.put("cno", cno);
		map.put("filefullname", filefullname);
		stuRepDao.deleteFilename1(map);		
	}
	
}
