package pl.wlazly.library.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.entity.BookStatus;
import pl.wlazly.library.service.BooksService;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    BooksService booksService;

    @GET
    @RequestMapping(value = "/admin/books")
    @Secured(value = {"ROLE_ADMIN"})
    public String showAllBooks(Model model) {
        List<Book> bookList = booksService.getBookList();
        model.addAttribute("bookList", bookList);
        return "admin/books";
    }

    @GET
    @RequestMapping(value = "/admin/books/search/{title}")
    @Secured(value = {"ROLE_ADMIN"})
    public String searchBooks(Model model, @PathVariable("title") String title) {
        List<Book> bookList = booksService.findBooksByTitle(title);
        model.addAttribute("bookList", bookList);
        return "admin/books";
    }

    @GET
    @RequestMapping(value = "/admin/addbook")
    @Secured(value = {"ROLE_ADMIN"})
    public String showBookForm(Model model){
        return "admin/addbook";
    }

    @POST
    @RequestMapping(value = "/admin/addnewbook")
    @Secured(value = {"ROLE_ADMIN"})
    public String addBook(Model model, Book book) {
        book.setStatus(BookStatus.AVAILABLE);
        booksService.saveBook(book);
        return "admin/addbook";
    }

    @GET
    @RequestMapping(value = "/admin/books/edit/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String bookEditPanel(Model model, @PathVariable("id") int id) {
        Book book = booksService.getBookById(id);
        model.addAttribute("book", book);
        return "admin/editbook";
    }

    @PUT
    @RequestMapping(value = "/admin/updatebook/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String updateBookFromPanel(Book book, @PathVariable("id") int id) {
        booksService.updateBook(id, book);
        return "redirect:/admin/books";
    }

    @DELETE
    @RequestMapping(value = "/admin/deletebook/{id}")
    @Secured(value = {"ROLE_ADMIN"})
    public String deleteBookFromPanel(Book book,@PathVariable("id") int id) {
        booksService.deleteBookById(id);
        return "redirect:/admin/books";
    }


}