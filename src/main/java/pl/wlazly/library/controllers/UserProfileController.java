package pl.wlazly.library.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.wlazly.library.entity.User;
import pl.wlazly.library.service.UserService;
import pl.wlazly.library.utils.UserUtils;
import pl.wlazly.library.validators.ChangePasswordValidator;
import pl.wlazly.library.validators.RegisterValidator;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.util.Locale;

@Controller
public class UserProfileController {

    @Autowired
    private UserService userService;
    @Autowired
    private MessageSource messageSource;

    @GET
    @RequestMapping(value = "/profile")
    public String showUserProfile(Model model) {

        String loggedUser = UserUtils.getLoggedUser();
        User user = userService.findUserByEmail(loggedUser);

        int roleNumber = user.getRoles().iterator().next().getId();
        user.setRoleNumber(roleNumber);

        model.addAttribute("user", user);

        return "profile";
    }

    @GET
    @RequestMapping(value = "/changepassword")
    public String changeUserPassword(Model model) {
        String loggedUser = UserUtils.getLoggedUser();
        User user = userService.findUserByEmail(loggedUser);
        model.addAttribute("user", user);
        return "changepassword";
    }

    @POST
    @RequestMapping(value = "/updatepassword")
    public String updateUserPassword(User user, BindingResult result, Model model, Locale locale) {
        String redirectPage = null;

        new ChangePasswordValidator().checkPassword(user.getNewPassword(), result);
        if (result.hasErrors()) {
            redirectPage = "changepassword";
        } else {
            userService.updateUserPassword(user.getNewPassword(), user.getEmail());
            redirectPage = "changepassword";
            model.addAttribute("message", messageSource.getMessage("changePassword.success", null, locale));
        }
        return redirectPage;
    }

    @GET
    @RequestMapping(value = "/editprofile")
    public String editUserProfile(Model model) {
        String loggedUser = UserUtils.getLoggedUser();
        User user = userService.findUserByEmail(loggedUser);
        model.addAttribute("user", user);
        return "editprofile";
    }

    @POST
    @RequestMapping(value = "/updateprofile")
    public String updateUserProfile(User user, BindingResult result, Model model, Locale locale) {
        String redirectPage = null;

        String loggedUser = UserUtils.getLoggedUser();
        User actualUser = userService.findUserByEmail(loggedUser);

        User existingLogin = userService.findUserByLogin(user.getLogin());
        if(!actualUser.getLogin().equals(user.getLogin())) {
            new RegisterValidator().validateLoginExist(existingLogin, result);
        }

        if (result.hasErrors()) {
            redirectPage = "editprofile";
        } else {
            userService.updateUserProfile(user.getLogin(), user.getFirstName(), user.getLastName(), user.getEmail());
            redirectPage = "editinfo";
            model.addAttribute("message", messageSource.getMessage("editProfile.success", null, locale));
        }

        return redirectPage;
    }



}