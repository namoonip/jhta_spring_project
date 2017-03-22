package kr.co.jhta.todo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.todo.dao.TodoDao;
import kr.co.jhta.todo.dao.UserDao;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	private TodoDao todoDao;
	
	@Autowired
	private UserDao userDao;
}
