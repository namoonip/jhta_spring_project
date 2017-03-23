package kr.co.jhta.todo.dao;

import java.util.List;

import kr.co.jhta.todo.vo.Todo;

public interface TodoDao {

	void addTodo(Todo todo);

	List<Todo> getTodoListByUserNo(int no);
}
