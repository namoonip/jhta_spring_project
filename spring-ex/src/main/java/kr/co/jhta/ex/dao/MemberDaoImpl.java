package kr.co.jhta.ex.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.jhta.ex.model.Member;


@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String SELECT_MEMBER_BY_ID = "select * from tb_member where id = ?";
	private static final String SELECT_MEMBERS = "select * from tb_member";
	
	@Autowired
	JdbcTemplate template;
	
	@Override
	public Member getMemberById(String userId) {
		return template.queryForObject(SELECT_MEMBER_BY_ID, new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member();
				
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setUsername(rs.getString("username"));
				
				return member;
			}
		}, userId);
	}
	
	@Override
	public List<Member> getAllMembers() {
		return template.query(SELECT_MEMBERS, new RowMapper<Member>() {
			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				Member member = new Member();
				
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setUsername(rs.getString("username"));
				
				return member;
			}
		});
	}
}
