package demo3;

public enum Grade {
	
	// 학점
	A(4), B(3), C(2), D(1), F(0);
	
	// point는 괄호 안의 숫자를 가리킨다.
	private int point;
	
	// enum의 자동 생성자는 반드시 private이다.
	// 사용자가 싱글턴인 enum의 생성자에 접근하지 못하도록 private를 사용한다.
	// enum의 생성자는 한번이라도 사용하면 사용된 만큼 실행된다.
	// A, B, C, D, F의 기본 생성자이다.
	private Grade(int point) {
		this.point = point;
	}
	
	/*
	 * A(4)는
	 * class A {
	 * 			int point;
	 * 			public A(int point) {
	 * 				this.point = point;
	 * 			}
	 * 
	 * 			public int getPoint() {
	 * 				return point;
	 *			} 		
	 * 		}
	 * 와 같다. 
	 */
	
	public int getPoint() {
		return point;
	}
}
