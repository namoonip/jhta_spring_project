package kr.co.jhta.todo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import kr.co.jhta.todo.vo.User;

@SuppressWarnings("deprecation")
@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlMapClientTemplate template;
	
	public void setTemplate(SqlMapClientTemplate template) {
		this.template = template;
	}

	@Override
	public void addUser(User user) {
		template.insert("addUser", user);
	}

	@Override
	public User getUserById(String id) {
		return (User) template.queryForObject("getUserById", id);
	}
	
}
