package annotaion;

@ToString(include=true)
public class Person {

	@ToString
	private String userId;
	
	@ToString(include=false)
	private String password;
	
	@ToString(include=true)
	private String username;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}


