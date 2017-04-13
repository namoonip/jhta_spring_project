package kr.co.jhta.dao.lecture;

import java.util.List;

import kr.co.jhta.vo.SiteMap;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectDivision;

public interface LectureDao {
	
	List<Subject> getMajorList(String code);
	SiteMap getDetpList(String code);
	SubjectDivision getDivisionList(int no);
}
