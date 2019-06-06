package pl.wlazly.library.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.entity.BookStatus;
import pl.wlazly.library.entity.Borrow;
import pl.wlazly.library.entity.User;
import pl.wlazly.library.service.BooksService;
import pl.wlazly.library.service.BorrowService;
import pl.wlazly.library.service.CostsService;
import pl.wlazly.library.service.UserService;
import pl.wlazly.library.utils.UserUtils;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class BorrowController {

    @Autowired
    private UserService userService;
    @Autowired
    private BorrowService borrowService;
    @Autowired
    BooksService booksService;
    @Autowired
    private CostsService costsService;

    @POST
    @RequestMapping(value = "addnewborrow")
    public String addBorrow(Model model, Book book) {
        costsService.saveCosts(getLoggedUser());
        costsService.blockBorrowBooks(getLoggedUser());
        if(!getLoggedUser().isBan()==true) {
            Borrow borrow = new Borrow();
            borrow.setUser(getLoggedUser());
            borrow.setBook(book);
            borrow.setStartDate(LocalDate.now());

            booksService.updateBookStatus(book.getId(), BookStatus.UNAVAILABLE.toString());

            borrowService.saveBorrow(borrow);
        }
        return "redirect:books";
    }

    @GET
    @RequestMapping(value = "borrows")
    public String getBorrowList(Model model, Borrow borrow) {
        List<Borrow> borrowList = borrowService.getBorrowsByUser(getLoggedUser()).stream().filter(b -> b.getEndDate() == null).collect(Collectors.toList());
        model.addAttribute("borrowList", borrowList);
        return "borrows";
    }

    @PUT
    @RequestMapping(value = "returnbook")
    public String returnBook(Model model, Borrow borrow) {
        Borrow borrowById = borrowService.getBorrowById(borrow.getId());
        borrowById.setEndDate(LocalDate.now());
        booksService.updateBookStatus(borrowById.getBook().getId(), BookStatus.AVAILABLE.toString());
        borrowService.saveBorrow(borrowById);
        return "redirect:borrows";
    }

    private User getLoggedUser() {
        String loggedUser = UserUtils.getLoggedUser();
        return userService.findUserByEmail(loggedUser);
    }

    @GET
    @RequestMapping(value = "costs")
    public String getCosts(Model model) {
        BigDecimal costs = getLoggedUser().getCosts();
        costsService.saveCosts(getLoggedUser());
        costsService.blockBorrowBooks(getLoggedUser());
        model.addAttribute("costs", costs);
        return "costs";
    }


}