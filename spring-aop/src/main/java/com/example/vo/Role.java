package com.example.vo;

public class Role {
	private String username;
	private String type;	// "USER" "ADMIN"
	
	public Role(String username, String type) {
		super();
		this.username = username;
		this.type = type;
	}
	
	public String getUsername() {return username;}
	
	public String getType() {return type;}

}