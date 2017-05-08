package annotaion;

import java.lang.reflect.Field;

public class Tostrings {
	
	public static String toString(Object obj) {
		
		if (obj == null) {
			return "null";
		}
		
		Class<?> clazz = obj.getClass();
		
		// 해당 클래스에 @ToString 어노테이션이 정의되어 있는지 조사하기
		ToString ts = clazz.getAnnotation(ToString.class);
		if (ts == null) {
			// @ToString이 정의되어 있지 않으면 그 객체의 toString()을 실행한 결과를 반환한다.
			return obj.toString();
		}
		
		StringBuilder result = new StringBuilder();
		if (ts.include()) {	// .include는 include가 true인 것들을 가져 온다.
			result.append(clazz.getName());	// 클래스 이름을 포함시킨다.
		}
		
		result.append("[");
		
		// 설계도에서 모든 멤버변수 가져오기
		Field[] fields =  clazz.getDeclaredFields();
		for (Field field : fields) {
			ts = field.getAnnotation(ToString.class);
			if (ts != null) {
				field.setAccessible(true);
				if(ts.include()) {
					result.append(field.getName());
					result.append("=");
					
					try {
						result.append(Tostrings.toString(field.get(obj)));
						result.append(", ");
					} catch (ReflectiveOperationException ex) {
						ex.getStackTrace();
					}					
				}
			}
		}
		result.append("]");
		
		return result.toString();
	}
}

