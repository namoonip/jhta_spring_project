package kr.co.jhta.ex.service;

import java.util.Date;
import java.util.List;

import kr.co.jhta.ex.model.Event;


public interface EventService {

	Event addEvent(Event event);
	Event getEventById(int id);
	List<Event> getEvents(String memberId, Date start, Date end);
	Event removeEvent(int id);
	Event modifyEvent(Event event);
}
