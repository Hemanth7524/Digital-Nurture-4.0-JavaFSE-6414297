package com.library.LibraryManagemen;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.library.repository.BookRepository;
import com.library.service.BookService;

/**
 * Hello world!
 *
 */
public class App
{
    public static void main( String[] args )
    {
    	ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        BookRepository service = context.getBean("bookrepository", BookRepository.class);

        BookService service1 = context.getBean("bookservice", BookService.class);

        service.method();
        service1.details();

    }
}
