package kr.co.jhta.rest.service;

import java.util.ArrayList;
import java.util.Date;
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
		user.setRegDate(new Date());
		db.add(user);
		return user;
	}

	@Override
	public User deleteUser(int no) {
		int userIndex = -1;
		for(int index=0; index<db.size(); index++ ) {
			User user = db.get(index);
			if(user.getNo() == no) {
				userIndex = index;
				break;
			}
		}
		if(userIndex != -1) {
			return db.remove(userIndex);
		}
		return null;
	}

	@Override
	public void updateUser(User user) {
		int userIndex = -1; // List가 0부터 양의 정수까지이므로 나올 수 없는 음수를 디폴트로 지정
		for (int index=0; index<db.size(); index++) {
			User item = db.get(index);
			if(item.getNo() == user.getNo()) {
				userIndex = index;
				break;
			}
		}
		
		if(userIndex != -1) {
			db.set(userIndex, user);	// 지정된 위치의 객체를 새로운 객체로 교체
		}
	}
}

