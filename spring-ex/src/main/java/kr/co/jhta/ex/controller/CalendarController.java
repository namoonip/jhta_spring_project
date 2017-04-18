package kr.co.jhta.ex.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.ex.form.EventForm;
import kr.co.jhta.ex.model.Event;
import kr.co.jhta.ex.model.Member;
import kr.co.jhta.ex.service.EventService;

@RestController
public class CalendarController {

	private static Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	private EventService eventService;
	
	@InitBinder
	public void stringToDateBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping("/addevent.do")
	public Event addEvent(EventForm eventForm, HttpSession session) {
		logger.info(eventForm.toString());
		
		Member member = (Member) session.getAttribute("LOGIN_MEMBER");
		if (member == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		
		Event event = new Event();
		event.setTitle(eventForm.getTitle());
		event.setDescription(eventForm.getDescription());
		event.setStart(eventForm.getStart());
		event.setEnd(eventForm.getEnd());
		event.setMember(member);
		
		logger.info(event.toString());

		return eventService.addEvent(event);
	}
	
	@RequestMapping("/events.do")
	public List<Event> getEvents(Date start, Date end, HttpSession session) {
		logger.info("start: " + start);
		logger.info("end: " + end);
		
		Member member = (Member) session.getAttribute("LOGIN_MEMBER");
		if (member == null) {
			throw new RuntimeException("로그인이 필요합니다.");
		}
		
		List<Event> events = eventService.getEvents(member.getId(), start, end);
		logger.info(events.toString());
		
		return events;
	}
}
