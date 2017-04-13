package kr.co.jhta.service.professor;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Syllabus;

@Transactional
public interface SyllabusService {
	void addNewSyll(Syllabus syllabus);
	List<Syllabus> getAllList();
}
