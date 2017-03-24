package kr.co.jhta.todo.service;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.todo.vo.User;

@Transactional
public interface UserService {

	void registerUser(User user);
	User getLoginUserInfo(String id, String pwd);
}
