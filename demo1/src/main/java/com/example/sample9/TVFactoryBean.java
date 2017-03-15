package com.example.sample9;

import org.springframework.beans.factory.FactoryBean;

public class TVFactoryBean implements FactoryBean<TV>{
	// FactroyBean<T>을 Bean으로 등록하면 FactoryBean<T>이 등록되는 것이 아니라
	// FactoryBean을 상속한 클래스가 실제 빈으로 등록된다.
	
	private String type;
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public Class<?> getObjectType() {
		// 반환하고자 하는 클래스를 적는다.
		return TV.class;
	}
	
	@Override
	public TV getObject() throws Exception {
		// ColorTV를 등록
		if("color".equals(type)) {
			return new ColorTV();
		} else if ("black".equals(type)) {
			return new BlackTV();
		} else {
			return null;
		}
	}
	
	@Override
	public boolean isSingleton() {
		// 싱글톤이면 true, 아니면 false
		return true;
	}
	
}

