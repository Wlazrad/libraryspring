package pl.wlazly.library.mainpages;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;

@Controller
public class ErrorPageController implements ErrorController {

    @GET
    @RequestMapping(value = "/error")
    public String showErrorPage() {
        return "error";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}
