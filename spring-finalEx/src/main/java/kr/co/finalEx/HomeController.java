package kr.co.finalEx;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.finalEx.util.MakeExcel;
import kr.co.finalEx.vo.Student;
import net.sf.jxls.transformer.XLSTransformer;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	Student student1 = new Student(1, "hong", "hong12", "1234", new Date());
	Student student2 = new Student(2, "kong", "kong34", "1234", new Date());
	Student student3 = new Student(3, "yong", "yong56", "1234", new Date());

	List<Student> studentList = new ArrayList<Student>();
		
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/studentList.do")
	public String studentList(HttpServletRequest req, Student student,ModelMap modelMap) {
	
		studentList.add(student1);
		studentList.add(student2);
		studentList.add(student3);
		
		modelMap.addAttribute("studentList",studentList);
		
		return "home";
	}
	
	/*@RequestMapping(value="/studentExcel.do")
	public void studentListExcel(HttpServletRequest req, HttpServletResponse res, 
								Student student) {
		String templateFile = "C:\\spring_project\\workspace\\spring-finalEx\\src\\main\\webapp\\WEB-INF\\practice.xlsx";
		String destFile = "C:\\spring_project\\workspace\\spring-finalEx\\src\\main\\webapp\\WEB-INF\\practice-demo.xlsx";
		
		studentList.add(student1);
		studentList.add(student2);
		studentList.add(student3);
		
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("studentList", studentList);
		
		XLSTransformer transformer = new XLSTransformer();
		try {
			transformer.transformXLS(templateFile, beans, destFile);
		} catch (Exception e) {
			e.getStackTrace();
		}
	}*/
	
	@RequestMapping(value="/studentExcel.do")
	public void studentListExcel(HttpServletRequest req, HttpServletResponse res, 
			Student student) {
		
		studentList.add(student1);
		studentList.add(student2);
		studentList.add(student3);
		
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("studentList", studentList);
		
		MakeExcel makeExcel = new MakeExcel();
		makeExcel.download(req, res, beans, 
								makeExcel.get_Filename("excelProject"), "practice.xlsx");
	}
	
}
