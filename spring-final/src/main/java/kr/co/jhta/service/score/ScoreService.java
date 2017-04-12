package kr.co.jhta.service.score;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Score;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectRegister;
import kr.co.jhta.vo.stu.Student;

@Transactional
@Service
public interface ScoreService {
	List<Score> getAllScoreList();
	
	Score getScoreListByRegiNo(int regino);
	SubjectRegister getRegiInfo(int regino);
	
	List<SubjectRegister> getAllSubjectList();
	Student getStudentInfo(int uno);
	Subject getSubjectInfo(int jno);
}
