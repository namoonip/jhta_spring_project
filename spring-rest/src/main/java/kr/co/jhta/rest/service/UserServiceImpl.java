package kr.co.jhta.rest.service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.stereotype.Service;

import kr.co.jhta.rest.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	private static List<User> db;
	// 하나씩 증가하는 수를 뽑는 AtomicInteger 클래스
	private static AtomicInteger counter = new AtomicInteger(1);
	
	static {
		db = new ArrayList<User>();
		// getAndIncrement()는 숫자를 하나 뽑아 증가한 수를 반환한다.
		db.add(new User(counter.getAndIncrement(),"hong","zxcv1234","홍길동","010-1111-2222","hong@gmail.com"));
		db.add(new User(counter.getAndIncrement(),"lee","zxcv1234","이순신","010-1234-3333","lee@gmail.com"));
	}

	@Override
	public List<User> getAllUsers() {
		return db;
	}

	@Override
	public User getUserByNo(int no) {
		for (User user : db) {
			if (user.getNo() == no){
				return user;
			}
		}
		return null;
	}

	@Override
	public User saveUser(User user) {
		user.setNo(counter.getAndIncrement());
		db.add(user);
		return user;
	}
}

