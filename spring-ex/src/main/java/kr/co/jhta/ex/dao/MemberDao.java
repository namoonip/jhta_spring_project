package kr.co.jhta.ex.dao;

import java.util.List;

import kr.co.jhta.ex.model.Member;

public interface MemberDao {

	Member getMemberById(String userId);
	List<Member> getAllMembers();
}
