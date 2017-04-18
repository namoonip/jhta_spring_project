package kr.co.jhta.ex.service;

import java.util.List;

import kr.co.jhta.ex.model.Member;

public interface MemberService {

	Member login(String id, String pwd);
	List<Member> getAllMembers();
}
