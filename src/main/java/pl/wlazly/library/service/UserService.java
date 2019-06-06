package pl.wlazly.library.service;

import pl.wlazly.library.entity.User;

import java.math.BigDecimal;

public interface UserService {

    void saveUser(User user);
    User findUserByEmail(String email);
    User findUserByLogin(String login);
    void updateUserPassword(String newPassword, String email);
    void updateUserProfile(String login, String firstName, String lastName, String email);
    void updateUserCosts(BigDecimal costs, String email);
}
