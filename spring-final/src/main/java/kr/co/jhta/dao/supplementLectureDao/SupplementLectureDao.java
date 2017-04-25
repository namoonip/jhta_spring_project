package kr.co.jhta.dao.supplementLectureDao;

import java.util.List;

import kr.co.jhta.vo.SupplementLectureTableVo;
import kr.co.jhta.vo.SupplementLectureVo;

public interface SupplementLectureDao {

	//college 조회
	List<SupplementLectureVo> getMajorList(String majorCode);
	
	//college table 조회
	List<SupplementLectureTableVo>getTableList(String majorCode);
	
	//휴강신청
	SupplementLectureTableVo getTableModal(int subjectNo);
	
	//휴강취소
	SupplementLectureTableVo getTableModalCancle(int subjectNo);
}
