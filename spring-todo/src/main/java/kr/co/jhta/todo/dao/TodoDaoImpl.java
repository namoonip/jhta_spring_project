package kr.co.jhta.todo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jhta.todo.vo.Todo;

@SuppressWarnings("deprecation")
@Repository
public class TodoDaoImpl implements TodoDao{
	
	@Autowired
	private SqlMapClientTemplate template;

	@Override
	public void addTodo(Todo todo) {
		template.insert("addTodo", todo);
	}

	@Override
	public List<Todo> getTodoListByUserNo(int no) {
		return template.queryForList("getTodoListByUserNo", no);
	}	
}
