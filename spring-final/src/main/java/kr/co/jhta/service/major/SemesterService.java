package kr.co.jhta.service.major;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Semester;

@Transactional
@Service
public interface SemesterService {

	void addSemester(Semester semester);
}
