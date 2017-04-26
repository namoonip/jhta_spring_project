package kr.co.jhta.controller.report;

import java.io.File;
import java.io.FileOutputStream;

import javax.validation.Valid;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jhta.controller.view.FiledownloadView;
import kr.co.jhta.service.report.StuReportService;
import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.service.user.RegisubjectService;
import kr.co.jhta.service.user.StudentService;
import kr.co.jhta.vo.Preport;
import kr.co.jhta.vo.PreportContent;
import kr.co.jhta.vo.PreportContentForm;
import kr.co.jhta.vo.stu.Enroll;
import kr.co.jhta.vo.stu.Student;

@Controller
@RequestMapping("/stud")
public class StuReportFileController {

	@Autowired
	StuReportService stuRepService;
	
	@Autowired
	StudentService stuService;
	
	@Autowired
	SitemapService sitemapService;
	
	@Autowired
	RegisubjectService regisubjectService;
	
	private String directory = "C:\\spring_project\\attachment";
	private String attchmentDirectory = "C:\\spring_project\\attachment";
	
	@Autowired
	private FiledownloadView filedownloadView;
	
	
	@RequestMapping(value="/editReport", method=RequestMethod.GET)
	public String editReport(@RequestParam(value="cno") int cno, Model model, Student student) {	
		PreportContent stuReport = stuRepService.getStuReportByCnoService(cno);
				
		PreportContentForm preportContentForm = new PreportContentForm();
		preportContentForm.setStudent(student);
		
		model.addAttribute("preportContentForm", preportContentForm);
		model.addAttribute("preportContent", stuReport);
		model.addAttribute("student", student);
		
		return "student/report/editStuReport";
	}
	
	
	@RequestMapping(value="/editReport", method=RequestMethod.POST)
	public String editReportPost(@Valid @ModelAttribute("preportContentForm") PreportContentForm preportContentForm,
									Errors errors, Model model, Student student) throws Exception{	
		int eno = preportContentForm.getEno();
		int cno = preportContentForm.getNo();
		PreportContent stuReport = stuRepService.getStuReportByCnoService(cno);

		if(errors.hasErrors()) {
			return "redirect:/stud/ReportHome?eno="+eno;
		}
		
		PreportContent preportContent = new PreportContent();
		
		MultipartFile upfile = preportContentForm.getFile();
		if(!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			preportContentForm.setFilename(filename);
			IOUtils.copy(upfile.getInputStream(), new FileOutputStream(new File(directory, filename)));
		}
		MultipartFile upfile2 = preportContentForm.getFile2();
		if(!upfile2.isEmpty()) {
			String filename2 = upfile2.getOriginalFilename();
			preportContentForm.setFilename2(filename2);
			IOUtils.copy(upfile2.getInputStream(), new FileOutputStream(new File(directory, filename2)));
		}
		MultipartFile upfile3 = preportContentForm.getFile3();
		if(!upfile3.isEmpty()) {
			String filename3 = upfile3.getOriginalFilename();
			preportContentForm.setFilename3(filename3);
			IOUtils.copy(upfile3.getInputStream(), new FileOutputStream(new File(directory, filename3)));
		}
		MultipartFile upfile4 = preportContentForm.getFile4();
		if(!upfile4.isEmpty()) {
			String filename4 = upfile4.getOriginalFilename();
			preportContentForm.setFilename4(filename4);
			IOUtils.copy(upfile4.getInputStream(), new FileOutputStream(new File(directory, filename4)));
		}
		MultipartFile upfile5 = preportContentForm.getFile5();
		if(!upfile5.isEmpty()) {
			String filename5 = upfile5.getOriginalFilename();
			preportContentForm.setFilename5(filename5);
			IOUtils.copy(upfile5.getInputStream(), new FileOutputStream(new File(directory, filename5)));
		}
				
		BeanUtils.copyProperties(preportContent, preportContentForm);
		preportContent.setStudent(student);
		model.addAttribute("preportContent", stuReport);
		model.addAttribute("student", student);	
		
		stuRepService.updateStuReportService(preportContent);				
		
		return "redirect:/stud/showStuReport?cno="+cno+"&eno="+eno;
	}
	
	@RequestMapping(value="/stuReportAfter", method=RequestMethod.POST)
	public String stuReportAfterProcess(@Valid @ModelAttribute("preportContentForm") PreportContentForm preportContentForm, 
							Errors errors, Model model, Student student)
							throws Exception{
		int eno = preportContentForm.getEno();
		int rno = preportContentForm.getRno();
		if(errors.hasErrors()) {
			return "redirect:/stud/ReportHome?eno="+eno;
		}
		
		PreportContent preportContent = new PreportContent();
		
		MultipartFile upfile = preportContentForm.getFile();
		if(!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			preportContentForm.setFilename(filename);
			IOUtils.copy(upfile.getInputStream(), new FileOutputStream(new File(directory, filename)));
		}
		MultipartFile upfile2 = preportContentForm.getFile2();
		if(!upfile2.isEmpty()) {
			String filename2 = upfile2.getOriginalFilename();
			preportContentForm.setFilename2(filename2);
			IOUtils.copy(upfile2.getInputStream(), new FileOutputStream(new File(directory, filename2)));
		}
		MultipartFile upfile3 = preportContentForm.getFile3();
		if(!upfile3.isEmpty()) {
			String filename3 = upfile3.getOriginalFilename();
			preportContentForm.setFilename3(filename3);
			IOUtils.copy(upfile3.getInputStream(), new FileOutputStream(new File(directory, filename3)));
		}
		MultipartFile upfile4 = preportContentForm.getFile4();
		if(!upfile4.isEmpty()) {
			String filename4 = upfile4.getOriginalFilename();
			preportContentForm.setFilename4(filename4);
			IOUtils.copy(upfile4.getInputStream(), new FileOutputStream(new File(directory, filename4)));
		}
		MultipartFile upfile5 = preportContentForm.getFile5();
		if(!upfile5.isEmpty()) {
			String filename5 = upfile5.getOriginalFilename();
			preportContentForm.setFilename5(filename5);
			IOUtils.copy(upfile5.getInputStream(), new FileOutputStream(new File(directory, filename5)));
		}
		
		model.addAttribute("student", student);
		Preport profReport = stuRepService.getProfReportByPnoService(rno);
		model.addAttribute("profReport", profReport);
		
		BeanUtils.copyProperties(preportContent, preportContentForm);
		preportContent.setStudent(student);
		
		// 추가하기
		Enroll enroll = new Enroll();
		enroll.setNo(eno);
		Preport preport = new Preport();
		preport.setNo(rno);
		preportContent.setStudent(student);
		preportContent.setEnroll(enroll);
		preportContent.setReport(preport);

		stuRepService.addNewReportService(preportContent);
		return "redirect:/stud/ReportHome?eno="+eno;
	}

	@RequestMapping(value="/stuReportAfter", method=RequestMethod.GET)
	public String stuReportAfterForm(Model model, Student student, 
						@RequestParam(value="rno") int rno) {
		Preport profReport = stuRepService.getProfReportByPnoService(rno);
		model.addAttribute("profReport", profReport);
		model.addAttribute("student", student);
		PreportContentForm preportContentForm = new PreportContentForm();
		preportContentForm.setStudent(student);
		model.addAttribute("preportContentForm", preportContentForm);
		return "student/report/stuAfterReportForm";
	}
	
	@RequestMapping(value="/fileDownload.do") 
	public ModelAndView reportFileDownload(@RequestParam(value="cno") int cno, Model model) {
		
		String filename = stuRepService.getAttchFileNameService(cno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("directory", attchmentDirectory);
		mav.addObject("filename", filename);
		mav.setView(filedownloadView);		
		return mav;
	}
	
}
