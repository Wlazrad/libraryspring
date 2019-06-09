package pl.wlazly.library.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import pl.wlazly.library.entity.User;

public class RegisterValidator implements Validator {


    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        boolean isEmailCorrect = PatternChecker.check(ValidPatterns.EMAIL, user.getEmail());
        if (!isEmailCorrect) {
            errors.rejectValue("email", "error.userEmailIsNotMatch");
        }

        boolean isPasswordCorrect = PatternChecker.check(ValidPatterns.PASSWORD, user.getPassword());
        if (!isPasswordCorrect) {
            errors.rejectValue("password", "error.userPasswordIsNotMatch");
        }
    }

    public void validateLoginExist(User user, Errors errors) {
        if (user != null) {
            errors.rejectValue("login", "error.userLoginExist");
        }
    }

    public void validateEmailExist(User user, Errors errors) {
        if (user != null) {
            errors.rejectValue("email", "error.userEmailExist");
        }
    }
}
