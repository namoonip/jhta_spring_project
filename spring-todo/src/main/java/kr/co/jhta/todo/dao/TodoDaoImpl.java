package kr.co.jhta.todo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@SuppressWarnings("deprecation")
@Repository
public class TodoDaoImpl implements TodoDao{
	
	@Autowired
	private SqlMapClientTemplate template;
}

