package kr.co.jhta.ex.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.jhta.ex.service.BookService;
import kr.co.jhta.ex.vo.Book;
import kr.co.jhta.ex.vo.BookForm;
import kr.co.jhta.ex.vo.SearchForm;

@Controller
public class BookController {
	
	String directory = "C:\\spring_project\\workspace\\spring-ex\\src\\main\\webapp\\resources\\images\\map";
	
	@Autowired
	BookService bookService;
	
	@RequestMapping(value="bookSearch.do")
	public String searchBookList(Model model, SearchForm searchForm) {
		List<Book> bookList = bookService.searchBook(searchForm);
		model.addAttribute("bookList", bookList);
		return "bookSearchForm";
	}	
	
	@RequestMapping(value="bookEditForm.do", method=RequestMethod.GET)
	public String editBookDetailPage(@RequestParam("no") int no, Model model) {
		Book book = bookService.getBookByNo(no);
		
		BookForm bookForm = new BookForm();
		BeanUtils.copyProperties(book, bookForm);
		
		model.addAttribute("bookForm", bookForm);
		return "bookEditForm";
	}
	
	@RequestMapping(value="bookEditForm.do", method=RequestMethod.POST)
	public String editBookDetail(@Valid @ModelAttribute("bookForm") BookForm bookForm, 
							BindingResult errors, Model model, @RequestParam("no") int no) throws Exception{
		if(errors.hasErrors()) {
			return "bookEditForm";
		}
		Book book = new Book();
		model.addAttribute("bookForm", new BookForm());
		BeanUtils.copyProperties(bookForm, book);
		bookService.editBook(book);
		return "redirect:/bookDetail.do?no=" + no;
	}
	
	@RequestMapping(value="bookDetail.do", method=RequestMethod.GET)
	public String getBookDetailPage(@RequestParam(value="no", required=false) int no, Model model) {
		Book book = bookService.getBookByNo(no);
		model.addAttribute("bookDetail", book);
		return "bookDetail";
	}	
	
	@RequestMapping(value="/deleteBook.do")
	public String deleteBook(@RequestParam(value="no", required=true) int no) {
		bookService.deleteBook(no);		
		return "redirect:/book.do";
	}
	
	@RequestMapping(value="/book.do")
	public String registerBook(Book book, Model model) {
		model.addAttribute("bookList",bookService.getAllBooks());
		model.addAttribute("bestBookList", bookService.getBestBookBySellCount());
		return "book";
	}
	
	@RequestMapping(value="/addBook.do", method=RequestMethod.GET)
	public String bookdetail(Model model) {
		model.addAttribute("bookForm", new BookForm());
		return "bookForm";
	}
	
	@RequestMapping(value="/addBook.do", method=RequestMethod.POST)
	public String bookForm(@Valid @ModelAttribute("bookForm") BookForm bookForm, 
						BindingResult errors, Model model)  throws Exception{		
		if(errors.hasErrors()) {
			return "bookForm";
		}	
		Book book = new Book();
		model.addAttribute("bookForm", bookForm);
		MultipartFile upfile = bookForm.getUploadFile();
		if(!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			book.setImg(filename);
			IOUtils.copy(upfile.getInputStream(), new FileOutputStream(new File(directory, filename)));
		}
		BeanUtils.copyProperties(bookForm, book);
		
		bookService.registerBook(book);
		return "redirect:/book.do";
	}
	
	@InitBinder
	public void stringToDateBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true, 10));
	}

}
