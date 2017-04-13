package kr.co.jhta.dao.sitemap;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.stu.Enroll;

@Transactional
public interface EnrollDao {
	List<Enroll> getAllEnroll();
	Enroll getEnrollByENo(int no);
	void addRegisub(Enroll enroll);
}
