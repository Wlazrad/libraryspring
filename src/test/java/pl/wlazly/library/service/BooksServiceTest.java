package pl.wlazly.library.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.repository.BooksRepository;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
class BooksServiceTest {

    @Autowired
    private BooksRepository repository;
    @Autowired
    private BooksService service;

    @BeforeEach
    void init() {
        repository.deleteAll();
    }

    @Test
    void bookListShouldBeEmptyOnStart() {
        //when
        List<Book> bookList = service.getBookList();
        //then
        assertTrue(bookList.isEmpty());
    }

    @Test
    void bookListShouldContainNewBookAfterAdding() {
        //given
        String expectedIsbn = "123";
        String expectedAuthor = "Author";
        String expectedTitle = "Book";
        Book book = Book.builder()
                .isbn("123")
                .author("Author")
                .title("Book")
                .build();
        service.saveBook(book);
        //when
        List<Book> bookList = service.getBookList();
        //then
        Book bookFromList = bookList.get(0);
        assertEquals(expectedIsbn, bookFromList.getIsbn());
        assertEquals(expectedAuthor, bookFromList.getAuthor());
        assertEquals(expectedTitle, bookFromList.getTitle());
    }

    @Test
    void shouldReturnEmptyListAfterDeletingExistingBook() {
        //given
        Book existingBook = Book.builder().title("Book").build();
        service.saveBook(existingBook);
        //when
        service.deleteBookById(existingBook.getId());
        List<Book> bookList = service.getBookList();
        //then
        assertTrue(bookList.isEmpty());
    }

}
