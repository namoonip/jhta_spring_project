package kr.co.jhta.ex.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.ex.service.BookService;
import kr.co.jhta.ex.vo.Book;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@RequestMapping(value="/book.do")
	public String registerBook(Book book, Model model) {
		model.addAttribute("bookList",bookService.getAllBooks());
		
		return "book";
	}
	
	@RequestMapping(value="/addBook.do", method=RequestMethod.GET)
	public String bookdetail() {
		return "bookForm";
	}
	
	@RequestMapping(value="/addBook.do", method=RequestMethod.POST)
	public String bookForm(Book book, Model model, Errors errors) {
		bookService.registerBook(book);
		if(errors.hasErrors()) {
			return "bookForm";
		}		
		return "redirect:/book.do";
	}
	
	@InitBinder
	public void stringToDateBinding(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
