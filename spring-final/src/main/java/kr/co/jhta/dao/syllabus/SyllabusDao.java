package kr.co.jhta.dao.syllabus;

import java.util.List;

import kr.co.jhta.vo.Syllabus;

public interface SyllabusDao {
	void addNewSyll(Syllabus syllabus);
	List<Syllabus> getAllList();
}
