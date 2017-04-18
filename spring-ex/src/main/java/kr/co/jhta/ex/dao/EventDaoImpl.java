package kr.co.jhta.ex.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ex.model.Event;
import kr.co.jhta.ex.model.Member;

@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	JdbcTemplate template;
	
	private static final AtomicInteger counter = new AtomicInteger(1);
	
	private static final String INSERT_EVENT_SQL = "insert into tb_event(id, title, start, end, description, member_id) values(?,?,?,?,?,?)";
	private static final String SELECT_EVENT_BY_ID_SQL = "select * from tb_event where id = ?";
	private static final String SELECT_EVENTS_SQL = "select * from tb_event where member_id = ? and start >= ? and start <= ?";
	private static final String DELETE_EVENT_BY_ID_SQL = "delete from tb_event where id = ?";
	private static final String UPDATE_EVENT_SQL = "update tb_event set title=?, start=?, end=? where id=?";
	
	@Override
	public int getSequence() {
		return counter.getAndIncrement();
	}
	
	@Override
	public void addEvent(Event event) {
		template.update(INSERT_EVENT_SQL, event.getId(),
										event.getTitle(),
										event.getStart(),
										event.getEnd(),
										event.getDescription(),
										event.getMember().getId());
	}

	@Override
	public Event getEventById(int id) {
		return template.queryForObject(SELECT_EVENT_BY_ID_SQL, new RowMapper<Event>() {
			@Override
			public Event mapRow(ResultSet rs, int rownum) throws SQLException {
				Event event = new Event();
				event.setId(rs.getInt("id"));
				event.setTitle(rs.getString("title"));
				event.setStart(rs.getTimestamp("start"));
				event.setEnd(rs.getTimestamp("end"));
				event.setDescription(rs.getString("description"));
				event.setMember(new Member(rs.getString("member_id")));
				
				return event;
			}
		}, id);
	}

	@Override
	public List<Event> getEvents(String memberId, Date start, Date end) {
		return template.query(SELECT_EVENTS_SQL, new RowMapper<Event>() {
			@Override
			public Event mapRow(ResultSet rs, int rownum) throws SQLException {
				Event event = new Event();
				event.setId(rs.getInt("id"));
				event.setTitle(rs.getString("title"));
				event.setStart(rs.getTimestamp("start"));
				event.setEnd(rs.getTimestamp("end"));
				event.setDescription(rs.getString("description"));
				event.setMember(new Member(rs.getString("member_id")));
				
				return event;
			}
		}, memberId, start, end);
	}

	@Override
	public void removeEvent(int id) {
		template.update(DELETE_EVENT_BY_ID_SQL, id);
	}

	@Override
	public void modifyEvent(Event event) {
		template.update(UPDATE_EVENT_SQL, event.getTitle(), 
										event.getStart(), 
										event.getEnd(), 
										event.getId());
	}

}
