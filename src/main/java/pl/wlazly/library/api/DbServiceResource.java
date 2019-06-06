package pl.wlazly.library.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.service.BooksService;

import java.util.List;

@RestController
@RequestMapping("/rest/db")
public class DbServiceResource {

    @Autowired
    BooksService booksService;

    @GetMapping("/1")
    private List<Book> returnAllBook(){
        return booksService.getBookList();
    }
}
