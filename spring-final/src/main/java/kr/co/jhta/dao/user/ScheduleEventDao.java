package kr.co.jhta.dao.user;

import java.util.List;
import java.util.Map;

import kr.co.jhta.vo.ScheduleEvent;

public interface ScheduleEventDao {
	int getSequence();
	void addNewSchEvent(ScheduleEvent schedule);
	ScheduleEvent getSchEventBySchNo(int schNo);
	List<ScheduleEvent> getSchEventByDate(Map<String, Object> map);
	
	void updateSchEvent(ScheduleEvent schedule);
	void updateIsShowTrue(ScheduleEvent schedule);
	void updateIsShowFalse(ScheduleEvent schedule);
	void deleteSchEvent(Map<String, Integer> map);
}
