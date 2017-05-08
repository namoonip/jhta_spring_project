package annotaion;

public class App {

	public static void main(String[] args) {
		Person p = new Person();
		p.setUserId("hong");
		p.setPassword("zxcv1234");
		p.setUsername("길동");
		
		System.out.println(Tostrings.toString(p));
		
		HomeController c = new HomeController();
		Mappings.processMapping(c);
	}
}
