package kr.co.jhta.ex.dao;

import java.util.List;

import kr.co.jhta.ex.vo.Book;

public interface BookMapper {
	void addBook(Book book);
	List<Book> getAllBooks();
}