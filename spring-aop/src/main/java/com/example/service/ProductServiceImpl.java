package com.example.service;

import java.util.Arrays;
import java.util.List;

public class ProductServiceImpl implements ProductService{
	@Override
	public void deleteAllProducts() { }
	@Override
	public void deleteProductByNo(int no) {	}	
	@Override
	public String findProductNameByNo(int no) {
		return "맥북";
	}
	@Override
	public List<String> searchProductNamesByPrice(int min, int max) {
		List<String> names = Arrays.asList("연필", "공책", "샤프");
		return names;
	}

}

