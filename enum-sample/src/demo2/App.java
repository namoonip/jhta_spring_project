package demo2;

public class App {

	
	public static void shipping(Cloth cloth) {
		if (Size.SMALL == cloth.getSize()) {
			System.out.println("무료");
		} else if (Size.MEDIUM == cloth.getSize()) {
			System.out.println("만원");
		} else if (Size.LARGE == cloth.getSize()){
			System.out.println("100만원");
		}
		
	}
	
	public static void main(String[] args) {
		
		// 생성자에 Enum(Size)타입만 들어가도록 정의했기 때문에 enum을 제외한 다른 타입이 들어 갈 수 없다.
		Cloth shirt = new Cloth("셔츠", Size.LARGE);
		Cloth pants = new Cloth("바지", Size.SMALL);
		
		shipping(shirt);
		shipping(pants);
		
	}
}
