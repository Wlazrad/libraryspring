package pl.wlazly.library.controllers;

import com.arexe.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GET
    @RequestMapping(value = "/login")
    public String loginPage(){
        return "login";
    }
}
