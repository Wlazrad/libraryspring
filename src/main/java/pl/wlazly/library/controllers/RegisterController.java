package pl.wlazly.library.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wlazly.library.entity.User;
import pl.wlazly.library.service.UserService;
import pl.wlazly.library.validators.RegisterValidator;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.math.BigDecimal;

@Controller
public class RegisterController {

    @Autowired
    private UserService userService;

    @GET
    @RequestMapping(value = "/register")
    public String registerForm(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @POST
    @RequestMapping(value = "/adduser")
    public String registerPost(Model model, User user, BindingResult result) {

        String returnPage = null;

        User existingEmail = userService.findUserByEmail(user.getEmail());
        User existingLogin = userService.findUserByLogin(user.getLogin());

        new RegisterValidator().validateEmailExist(existingEmail, result);
        new RegisterValidator().validateLoginExist(existingLogin, result);
        new RegisterValidator().validate(user, result);
        user.setBan(false);
        user.setCosts(BigDecimal.valueOf(0.00));
        if (result.hasErrors()) {
            returnPage = "register";
        } else {
            userService.saveUser(user);
            returnPage = "index";
        }

        return returnPage;
    }

}
