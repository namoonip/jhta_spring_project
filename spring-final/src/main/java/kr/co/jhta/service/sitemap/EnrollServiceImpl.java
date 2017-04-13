package kr.co.jhta.service.sitemap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.sitemap.EnrollDao;
import kr.co.jhta.vo.stu.Enroll;

@Service
public class EnrollServiceImpl implements EnrollService{

	@Autowired
	EnrollDao enrollDao;

	@Override
	public List<Enroll> getAllEnrollService() {
		List<Enroll> enrollList = enrollDao.getAllEnroll();
		return enrollList;
	}

	@Override
	public Enroll getEnrollByENoService(int no) {
		Enroll enroll = enrollDao.getEnrollByENo(no);
		return enroll;
	}

	@Override
	public void addRegisubService(Enroll enroll) {
		enroll.setNo(200);
		enrollDao.addRegisub(enroll);
	}

}
