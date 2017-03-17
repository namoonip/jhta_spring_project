package kr.co.jhta.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import kr.co.jhta.model2.Controller;
import kr.co.jhta.service.BookService;
import kr.co.jhta.vo.Book;

public class AddController implements Controller{
	private BookService bookService;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	// 값을 확인할 logger 만들기
		private static Logger logger = Logger.getLogger(AddController.class);	
		
		@Override
		public String exec(HttpServletRequest req) throws Exception {
			String title = req.getParameter("title");
			String author = req.getParameter("author");
			String publisher = req.getParameter("publisher");
			int price = Integer.parseInt(req.getParameter("price"));
			String description = req.getParameter("description");
					
			logger.info("title=["+title+"]");
			logger.info("author=["+author+"]");
			logger.info("publisher=["+publisher+"]");
			logger.info("price=["+price+"]");
			logger.info("description=["+description+"]");
			
			Book book = new Book();
			book.setTitle(title);
			book.setAuthor(author);
			book.setPublisher(publisher);
			book.setPrice(price);
			book.setDescription(description);
			
			bookService.addNewBook(book);
			
			return "redirect:list.hta";
		}
}

