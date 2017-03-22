package kr.co.jhta.todo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.todo.dao.UserDao;
import kr.co.jhta.todo.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public void registerUser(User user) {
		User savedUser = userDao.getUserById(user.getId());
		if (savedUser == null ) {
			userDao.addUser(user);
		} else {
			throw new RuntimeException("동일한 아이디로 가입한 사용자가 있습니다.");
		}
	}	
}