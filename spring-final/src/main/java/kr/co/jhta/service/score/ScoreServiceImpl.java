package kr.co.jhta.service.score;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.jhta.dao.score.ScoreDao;
import kr.co.jhta.vo.Score;
import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectRegister;
import kr.co.jhta.vo.stu.Student;

@Service
public class ScoreServiceImpl implements ScoreService{
	
	@Autowired
	private ScoreDao scoreDao;

	@Override
	public List<Score> getAllScoreList() {
		return scoreDao.getAllScoreList();
	}
	
	@Override
	public SubjectRegister getRegiInfo(int regino) {
		return scoreDao.getRegiInfo(regino);
	}
	
	//수강등록관리 리스트
	@Override
	public List<SubjectRegister> getAllSubjectList() {
		return scoreDao.getAllSubjectList();
	}
	
	@Override
	public Student getStudentInfo(int uno) {
		return scoreDao.getStudentInfo(uno);
	}

	@Override
	public Subject getSubjectInfo(int jno) {
		return scoreDao.getSubjectinfo(jno);
	}

	@Override
	public Score getScoreListByRegiNo(int regino) {
		return scoreDao.getScoreListByRegiNo(regino);
	}
		
}
