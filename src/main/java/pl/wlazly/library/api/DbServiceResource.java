package pl.wlazly.library.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.repository.BooksRepository;
import pl.wlazly.library.service.BooksService;

import java.util.List;

@RestController
@RequestMapping("/api")
public class DbServiceResource {

    @Autowired
    BooksService booksService;

    @Autowired
    BooksRepository booksRepository;

    @GetMapping("/books")
    private List<Book> returnAllBook() {
        return booksService.getBookList();
    }

    @GetMapping("/books/{id}")
    public List<Book> getBookById(@PathVariable(value = "id") int id) {
        return (List<Book>) booksService.getBookById(id);
    }

    @PostMapping("/books")
    public Book addBook(@RequestBody Book book) {
        return booksRepository.save(book);
    }

    @PutMapping("/books")
    public ResponseEntity updateBook(@RequestBody Book book) {
        return new ResponseEntity(HttpStatus.SERVICE_UNAVAILABLE);
    }

    @DeleteMapping("/books/{id}")
    public String deleteBookById(@PathVariable(value = "id") Long id) {
        booksRepository.deleteBookById(Math.toIntExact(id));
        return "Book with id=" + id + " deleted";
    }
}

