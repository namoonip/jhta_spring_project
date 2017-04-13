package kr.co.jhta.service.sitemap;

import java.util.List;

import kr.co.jhta.vo.stu.Enroll;

public interface EnrollService {
	
	List<Enroll> getAllEnrollService();
	Enroll getEnrollByENoService(int no);
	void addRegisubService(Enroll enroll);
}
