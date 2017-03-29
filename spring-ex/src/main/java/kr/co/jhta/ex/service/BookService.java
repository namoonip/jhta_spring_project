package kr.co.jhta.ex.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.ex.vo.Book;

@Transactional
public interface BookService {
	
	void registerBook(Book book);
	List<Book> getAllBooks();
}
