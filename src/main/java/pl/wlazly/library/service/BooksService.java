package pl.wlazly.library.service;



import pl.wlazly.library.entity.Book;

import java.util.List;

public interface BooksService {

        List<Book> getBookList();
        List<Book> findBooksByTitle(String title);
        Book getBookById(int id);
        void saveBook(Book book);
        void updateBook(int id, Book book);

    void updateBookStatus(int id, String bookStatus);

    void deleteBookById(int id);
}