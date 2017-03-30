package kr.co.jhta.ex.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.ex.vo.Book;
import kr.co.jhta.ex.vo.SearchForm;

@Transactional
public interface BookService {
	void registerBook(Book book);
	List<Book> getAllBooks();
	void deleteBook(int no);
	List<Book> getBestBookBySellCount();
	Book getBookByNo(int no);
	void editBook(Book book);
	List<Book> searchBook(SearchForm searchForm);
}
