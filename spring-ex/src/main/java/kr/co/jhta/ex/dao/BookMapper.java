package kr.co.jhta.ex.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.jhta.ex.vo.Book;
import kr.co.jhta.ex.vo.SearchForm;

@Repository
public interface BookMapper {
	void addBook(Book book);
	List<Book> getAllBooks();
	void deleteBook(int no);
	List<Book> getBestBookBySellCount();
	Book getBookByNo(int no);
	void editBook(Book book);
	List<Book> searchBook(SearchForm searchForm);
}