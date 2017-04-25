package kr.co.jhta.service.supplementLecture;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.supplementLectureDao.SupplementLectureDao;
import kr.co.jhta.vo.SupplementLectureTableVo;
import kr.co.jhta.vo.SupplementLectureVo;

@Service
public class SupplementLectureServiceImpl implements SupplementLectureService {

	@Autowired
	private SupplementLectureDao supplementlecturedao;
	
	//college 조회
	@Override
	public List<SupplementLectureVo> getMajorList(String majorCode) {
		
		
		return supplementlecturedao.getMajorList(majorCode);
	}
	
	//college table 조회
	@Override
	public List<SupplementLectureTableVo> getTableList(String majorCode) {
		
		return supplementlecturedao.getTableList(majorCode);
	}
	
	//휴강 신청
	@Override
	public SupplementLectureTableVo getTableModal(int subjectNo) {
		
		return supplementlecturedao.getTableModal(subjectNo);
	}
	
	//휴강취소
	@Override
	public SupplementLectureTableVo getTableModalCancle(int subjectNo) {
		
		return  supplementlecturedao.getTableModal(subjectNo);
	}
}
