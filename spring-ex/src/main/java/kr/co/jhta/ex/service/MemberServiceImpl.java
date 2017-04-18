package kr.co.jhta.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.ex.dao.MemberDao;
import kr.co.jhta.ex.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public Member login(String id, String pwd) {
		Member member = memberDao.getMemberById(id);
		if (member == null) {
			throw new RuntimeException("Login fail.");
		}
		if (!member.getPwd().equals(pwd)) {
			throw new RuntimeException("Login fail.");
		}
		return member;
	}
	
	@Override
	public List<Member> getAllMembers() {
		return memberDao.getAllMembers();
	}
	
}
