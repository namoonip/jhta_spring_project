package kr.co.jhta.dao.score;

import java.util.List;

import kr.co.jhta.vo.Score;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectRegister;
import kr.co.jhta.vo.stu.Student;

public interface ScoreDao {
	List<Score> getAllScoreList();
	Score getScoreListByRegiNo(int regino);
	SubjectRegister getRegiInfo(int regino);
	void addScore(Score score);
	List<SubjectRegister> getAllSubjectList();
	Student getStudentInfo(int uno);
	Subject getSubjectinfo(int jno);
}
