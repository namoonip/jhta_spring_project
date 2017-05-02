package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.TodoDao;
import kr.co.jhta.model.Todo;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	private TodoDao todoDao;
	
	public Todo insertTodo(Todo todo) {
		todo.setId(todoDao.getSequence());
		todo.setCompleted(false);
		todoDao.saveTodo(todo);
		
		return todo;
	}


	public List<Todo> getAllTodos() {
		return todoDao.getAllTodos();
	}


	public Todo getTodo(Integer id) {
		return todoDao.getTodoById(id);
	}


	public Todo deleteTodo(Integer id) {
		Todo todo = todoDao.getTodoById(id);
		todoDao.deleteTodoById(id);
		
		return todo;
	}


	public void updateTodo(Todo todo) {
		todoDao.updateTodo(todo);
	}

	
}
