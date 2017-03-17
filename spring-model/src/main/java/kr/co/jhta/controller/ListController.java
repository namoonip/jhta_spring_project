package kr.co.jhta.controller;

import javax.servlet.http.HttpServletRequest;

import kr.co.jhta.model2.Controller;

public class ListController implements Controller{
	@Override
	public String exec(HttpServletRequest req) throws Exception {
		System.out.println("ListController is running");
		return null;
	}
}
