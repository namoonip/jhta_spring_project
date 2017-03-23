package kr.co.jhta.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.todo.dao.TodoDao;
import kr.co.jhta.todo.dao.UserDao;
import kr.co.jhta.todo.vo.Todo;

@Service
public class TodoServiceImpl implements TodoService{
	@Autowired
	private TodoDao todoDao;
	
	@Autowired
	private UserDao userDao;

	@Override
	public void registerTodo(Todo todo) {
		todoDao.addTodo(todo);
		userDao.increaseUncompletedTodoAmount(todo.getUser().getNo());
	}

	@Override
	public List<Todo> getTodoList(int no) {
		return todoDao.getTodoListByUserNo(no);
	}
	
	
}
