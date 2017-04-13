package kr.co.jhta.service.lecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.lecture.LectureDao;
import kr.co.jhta.vo.SiteMap;
import kr.co.jhta.vo.Subject;

@Service
public class LectureServiceImpl implements LectureService {
	
	@Autowired
	private LectureDao lectureDao;
	
	@Override
	public List<Subject> getMajorList(String majorCode) {
		return lectureDao.getMajorList(majorCode);
	}
	
	@Override
	public SiteMap getDetpList(String majorCode) {
		return lectureDao.getDetpList(majorCode);
	}
}
