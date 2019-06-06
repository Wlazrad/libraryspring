package pl.wlazly.library.mainpages;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wlazly.library.entity.Book;
import pl.wlazly.library.service.BooksService;

import javax.ws.rs.GET;
import java.util.List;

@Controller
public class MainPageController {

    @Autowired
    BooksService booksService;

    @GET
    @RequestMapping(value = {"/", "/index"})
    public String showMainPage(Model model){
        List<Book> bookList = booksService.getBookList();
        model.addAttribute("bookList", bookList);
        return "index";
    }
}