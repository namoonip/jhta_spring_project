package kr.co.jhta.service.user;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.user.ScheduleEventDao;
import kr.co.jhta.vo.ScheduleEvent;

@Service
public class SchduleEventServiceImpl implements SchduleEventService{

	@Autowired
	ScheduleEventDao schDao;

	@Override
	public ScheduleEvent addNewSchEventService(ScheduleEvent schedule) {
		schDao.addNewSchEvent(schedule);
		return schDao.getSchEventBySchNo(schDao.getSequence()-1);
	}

	@Override
	public ScheduleEvent getSchEventBySchNoService(int schNo) {
		return schDao.getSchEventBySchNo(schNo);
	}

	@Override
	public List<ScheduleEvent> getSchEventByDateService(int studNo, Date start, Date end) {	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studNo", studNo);
		map.put("start", start);
		map.put("end", end);
		return schDao.getSchEventByDate(map);
	}
	
	@Override // 보여주기
	public void updateCompletedTrueService(ScheduleEvent schedule) {
		schDao.updateCompletedTrue(schedule);
	}

	@Override // 숨기기
	public void updateCompletedFalseService(ScheduleEvent schedule) {
		schDao.updateCompletedFalse(schedule);
	}

	@Override
	public void deleteSchEvent(Integer studNo, Integer schNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("studNo", studNo);
		map.put("schNo", schNo);
		schDao.deleteSchEvent(map);
	}

	@Override
	public ScheduleEvent editeSchduleByNoService(ScheduleEvent schedule) {
		schDao.editeSchduleByNo(schedule);
		return new ScheduleEvent();
	}


	
}