package com.example.sample5;

public class BarChart implements Chart{
	
	// 직접 값을 등록하는 하드 코딩은 좋은 방법이 아니다.
	// ex) int a = 10; 따라서 유연한 코딩을 진행한다.
	private String color;
	private int gap;
	
	public void setColor(String color) {
		this.color = color;
	}
	public void setGap(int gap) {
		this.gap = gap;
	}

	@Override
	public void draw() {
		System.out.println("막대 차트를 표시합니다.");
		System.out.println("바의 색["+color+"] 바의 간격["+gap+"]");
	}
}

