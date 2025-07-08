package com.library.service;

import com.library.repository.BookRepository;

public class BookService {

	private BookRepository bookRepository;

    public void setBookRepository(BookRepository bookRepository) {
    	System.out.println("BookRepository has been injected!");
        this.bookRepository = bookRepository;
    }

	public void addBook(String bookName) {
		bookRepository.savebook(bookName);
	}
}
