package pl.wlazly.library.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.entity.BookStatus;
import pl.wlazly.library.entity.User;
import pl.wlazly.library.service.BooksService;
import pl.wlazly.library.service.UserService;
import pl.wlazly.library.utils.UserUtils;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import java.util.List;
import java.util.stream.Collectors;

import static pl.wlazly.library.utils.UserUtils.getLoggedUser;

@Controller
public class BookController {

    @Autowired
    BooksService booksService;

    @Autowired
    UserService userService;

    @GET
    @RequestMapping(value = "/books")
    public String showAvailableBooks(Model model) {
        List<Book> bookList = booksService.getBookList().stream().filter(b -> b.getStatus().equals(BookStatus.AVAILABLE)).collect(Collectors.toList());
        model.addAttribute("bookList", bookList);
        model.addAttribute("user", getLoggedUser());
        return "books";
    }

    @GET
    @RequestMapping(value = "/books/search/{title}")
    public String searchAvailableBooks(Model model, @PathVariable("title") String title) {
        List<Book> bookList = booksService.findBooksByTitle(title).stream().filter(b -> b.getStatus().equals(BookStatus.AVAILABLE)).collect(Collectors.toList());
        model.addAttribute("bookList", bookList);
        return "books";
    }

    @GET
    @RequestMapping(value = "/admin/books")
    @Secured(value = {"ROLE_ADMIN"})
    public String showAllBooksAdmin(Model model) {
        List<Book> bookList = booksService.getBookList();
        model.addAttribute("bookList", bookList);
        return "admin/books";
    }

    @GET
    @RequestMapping(value = "/admin/books/search/{title}")
    @Secured(value = {"ROLE_ADMIN"})
    public String searchBooksAdmin(Model model, @PathVariable("title") String title) {
        List<Book> bookList = booksService.findBooksByTitle(title);
        model.addAttribute("bookList", bookList);
        return "admin/books";
    }

    @GET
    @RequestMapping(value = "/admin/addbook")
    @Secured(value = {"ROLE_ADMIN"})
    public String showBookForm(Model model) {
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
    public String deleteBookFromPanel(Book book, @PathVariable("id") int id) {
        booksService.deleteBookById(id);
        return "redirect:/admin/books";
    }

    private User getLoggedUser() {
        String loggedUser = UserUtils.getLoggedUser();
        return userService.findUserByEmail(loggedUser);
    }


}