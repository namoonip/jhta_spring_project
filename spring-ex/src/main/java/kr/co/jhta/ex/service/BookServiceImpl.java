package kr.co.jhta.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.ex.dao.BookMapper;
import kr.co.jhta.ex.vo.Book;

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
}
