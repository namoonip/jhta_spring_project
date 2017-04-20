package kr.co.jhta.service.appli;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.appli.LeaveDao;
import kr.co.jhta.vo.appli.Leave;

@Service
public class LeaveServiceImpl implements LeaveService{
	
	@Autowired
	LeaveDao leaveDao;

	@Override
	public void addNewLeaveService(Leave leave) {
		leaveDao.addNewLeave(leave);
	}

	@Override
	public List<Leave> getAllEnrolledLeaveByStuNoService(int stuNo) {
		List<Leave> leaveList = leaveDao.getAllEnrolledLeaveByStuNo(stuNo);
		return leaveList;
	}

}
