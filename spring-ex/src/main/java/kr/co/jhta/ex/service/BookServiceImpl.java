package kr.co.jhta.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.ex.dao.BookMapper;
import kr.co.jhta.ex.vo.Book;
import kr.co.jhta.ex.vo.SearchForm;

@Transactional
@Service
public class BookServiceImpl implements BookService{

	@Autowired
	BookMapper bookDao;
	
	@Override
	public void registerBook(Book book) {
		bookDao.addBook(book);		
	}

	@Override
	public List<Book> getAllBooks() {
		List<Book> bookList = bookDao.getAllBooks();		
		return bookList;
	}

	@Override
	public void deleteBook(int no) {
		bookDao.deleteBook(no);
	}

	@Override
	public List<Book> getBestBookBySellCount() {
		List<Book> bestBookList = bookDao.getBestBookBySellCount();
		return bestBookList;
	}

	@Override
	public Book getBookByNo(int no) {
		Book book = bookDao.getBookByNo(no);
		return book;
	}

	@Override
	public void editBook(Book book) {
		bookDao.editBook(book);
	}

	@Override
	public List<Book> searchBook(SearchForm searchForm) {
		Book book = new Book();
		List<Book> bookList = bookDao.searchBook(searchForm);
		return bookList;
	}	
}
