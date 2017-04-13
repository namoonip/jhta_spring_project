package kr.co.jhta.service.lecture;

import java.util.List;

import kr.co.jhta.vo.SiteMap;
import kr.co.jhta.vo.Subject;

public interface LectureService {
	
	List<Subject> getMajorList(String majorCode);
	SiteMap getDetpList(String majorCode);
}
