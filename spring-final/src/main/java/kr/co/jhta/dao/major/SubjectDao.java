package kr.co.jhta.dao.major;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectIsPassed;

@Transactional
public interface SubjectDao {

	void addSubject (Subject subject);
	
	List<Subject> getAllList();
	
	List<Subject> getByProIdList(String id);
	
	List<SubjectIsPassed> getPassAllList();
}
