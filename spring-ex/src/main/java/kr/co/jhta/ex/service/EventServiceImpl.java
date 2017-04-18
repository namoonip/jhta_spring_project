package kr.co.jhta.ex.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ex.dao.EventDao;
import kr.co.jhta.ex.dao.MemberDao;
import kr.co.jhta.ex.model.Event;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao eventDao;
	
	@Autowired
	MemberDao memberDao;

	@Override
	public Event addEvent(Event event) {
		int sequence = eventDao.getSequence();
		event.setId(sequence);
		eventDao.addEvent(event);
		
		return event;
	}

	@Override
	public Event getEventById(int id) {
		return eventDao.getEventById(id);
	}

	@Override
	public List<Event> getEvents(String memberId, Date start, Date end) {
		return eventDao.getEvents(memberId, start, end);
	}

	@Override
	public Event removeEvent(int id) {
		Event event = eventDao.getEventById(id);
		eventDao.removeEvent(id);
		return event;
	}

	@Override
	public Event modifyEvent(Event event) {
		eventDao.modifyEvent(event);
		return eventDao.getEventById(event.getId());
	}
	
	
}
