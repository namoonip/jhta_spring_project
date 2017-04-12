package kr.co.jhta.service.major;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.major.SemesterDao;
import kr.co.jhta.vo.Semester;

@Service
public class SemesterServiceImpl implements SemesterService{
	
	@Autowired
	private SemesterDao semesterDao;
	
	@Override
	public void addSemester(Semester semester) {
		semesterDao.addSemester(semester);
		
	}
}
