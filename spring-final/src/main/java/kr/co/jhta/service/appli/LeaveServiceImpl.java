package kr.co.jhta.service.appli;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void deleteEnrollByNoService(int lNo, int stuNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lNo", lNo);
		map.put("stuNo", stuNo);
		leaveDao.deleteEnrollByNo(map);		
	}

	@Override
	public String getCnameByCcodeService(String cCode) {
		String cName = leaveDao.getCnameByCcode(cCode);
		return cName;
	}

}
