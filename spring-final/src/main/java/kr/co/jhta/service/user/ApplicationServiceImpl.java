package kr.co.jhta.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.user.ApplicationDao;

@Service
public class ApplicationServiceImpl implements ApplicationService{

	@Autowired
	ApplicationDao appliDao;
	
	
}
