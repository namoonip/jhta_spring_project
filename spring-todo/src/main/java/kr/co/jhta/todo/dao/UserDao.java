package kr.co.jhta.todo.dao;

import kr.co.jhta.todo.vo.User;

public interface UserDao {
	
	void addUser(User user);
	User getUserById(String id);
}
