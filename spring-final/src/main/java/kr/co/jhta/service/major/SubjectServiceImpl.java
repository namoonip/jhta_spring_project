package kr.co.jhta.service.major;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.major.SubjectDao;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectIsPassed;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDao subjectDao;
	
	@Override
	public void addSubject(Subject subject) {
		subjectDao.addSubject(subject);
	}
	
	@Override
	public List<Subject> getAllList() {
		return subjectDao.getAllList();
	}
	@Override
	public List<Subject> getByProIdList(String id) {
		return subjectDao.getByProIdList(id);
	}
	@Override
	public List<SubjectIsPassed> getPassAllList() {
		return subjectDao.getPassAllList();
	}
}
