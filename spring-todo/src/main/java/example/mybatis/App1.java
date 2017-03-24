package example.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.jhta.todo.vo.User;

public class App1 {
	
	public static void main(String[] args) throws Exception{
		
		String resource = "example/mybatis/mybatis-config.xml";
		Reader reader = Resources.getResourceAsReader(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		
		// DB Access 작업 수행하기
		// SessionFactory를 사용해 핵심 객체인 sqlSession을 만든다.
		/*SqlSession session = sqlSessionFactory.openSession();
		User user = (User) session.selectOne("getUserById", "aaaa");
		System.out.println(user);*/ // 아래의 코딩이 
		
		SqlSession session = sqlSessionFactory.openSession();
		// 매직!!
		UserMapper mapper = session.getMapper(UserMapper.class);
		User user = mapper.getUserById("aaaa");
		System.out.println(user);
		session.close();
		
	}
}