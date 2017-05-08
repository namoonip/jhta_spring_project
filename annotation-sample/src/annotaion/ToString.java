package annotaion;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE, ElementType.FIELD})
// 필드와 타입만 가능하다. 생성자와 메소드에는 접근할 수 없다.
@Retention(RetentionPolicy.RUNTIME)
public @interface ToString {
	
	boolean include() default true;
}

