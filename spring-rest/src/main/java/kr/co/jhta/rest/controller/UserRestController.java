package kr.co.jhta.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.rest.service.UserService;
import kr.co.jhta.rest.vo.User;

@RestController
public class UserRestController {

		@Autowired
		UserService userService;
		
		// 모든 사용자 정보 조회
		@GetMapping(path="/user/") // Get방식으로 맵핑을 하기
		public @ResponseBody List<User> listAllUsers() {
			List<User> users = userService.getAllUsers();
			return users;
		}
		
		// 특정 번호에 해당하는 사용자 한 명 조회
		@GetMapping(path="/user/{no}")
		public @ResponseBody User getUser(@PathVariable("no") int no) {
			User user = userService.getUserByNo(no);
			return user;
		}
		
		// 새로운 사용자 생성하기
		@PostMapping(path="/user/")
		public User saveUser(@RequestBody User user) {
			userService.saveUser(user);
			return user;
		}
		
}

