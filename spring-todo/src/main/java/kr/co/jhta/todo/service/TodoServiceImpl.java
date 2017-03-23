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

	@Override	// 4번의 DB Access 작업이 있다.
	public void completeTodo(int no, int userNo) {
		Todo todo = todoDao.getTodoByNo(userNo);
		if(todo != null) {
			if(todo.getUser().getNo() != userNo) {
				throw new RuntimeException("본인이 등록한 일정만 완료저리할 수 있습니다.");
			}
		}
		todoDao.completeTodoByNo(no);
		userDao.increaseCompletedTodoAmount(userNo);
		userDao.decreaseUncompletedTodoAmount(userNo);
		// 컨트롤러에서 no와 userNo만 전달하면 된다.
	}
}
