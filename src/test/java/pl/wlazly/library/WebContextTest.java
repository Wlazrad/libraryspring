package pl.wlazly.library;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import pl.wlazly.library.controllers.BookController;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.service.BooksService;
import pl.wlazly.library.service.UserService;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.when;

@RunWith(SpringRunner.class)
@WebAppConfiguration
public class WebContextTest {
    @Mock
    BooksService booksService;

    @Mock
    UserService userService;

    @InjectMocks
    BookController bookController;

    private MockMvc mockMvc;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(bookController).build();
    }

    @Test
    public void testBook() throws Exception {

        Book book1 = new Book();
        Book book2 = new Book();

        List<Book> books = new ArrayList<>(2);
        books.add(book1);
        books.add(book2);


        when(booksService.getBookList()).thenReturn(books);

    }

}
