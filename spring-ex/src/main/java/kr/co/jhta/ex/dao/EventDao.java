package kr.co.jhta.ex.dao;

import java.util.Date;
import java.util.List;

import kr.co.jhta.ex.model.Event;


public interface EventDao {

	int getSequence();
	void addEvent(Event event);
	Event getEventById(int id);
	List<Event> getEvents(String memberId, Date start, Date end);
	void removeEvent(int id);
	void modifyEvent(Event event);
}
