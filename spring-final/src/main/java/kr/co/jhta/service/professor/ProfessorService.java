package kr.co.jhta.service.professor;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Professor;

@Transactional
public interface ProfessorService {
	List<Professor> proAllList();
}
