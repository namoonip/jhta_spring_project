package kr.co.jhta.service.appli;

import java.util.List;

import kr.co.jhta.vo.appli.Leave;

public interface LeaveService {

	void addNewLeaveService(Leave leave);
	List<Leave> getAllEnrolledLeaveByStuNoService(int stuNo);
}
