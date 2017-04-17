package kr.co.jhta.dao.user;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.stu.Regisubject;

@Transactional
public interface RegisubjectDao {

	List<Regisubject> getAllRegisInfo();
	Regisubject getRegisById(String id);	
	void deleteRegisubByENo(int enrollNo);
}
