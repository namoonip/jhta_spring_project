package com.example.service;

import com.example.vo.Role;

public interface AdminService {
	
	void login(String id, String pwd);
	void deleteUser(String id, Role role);
}

