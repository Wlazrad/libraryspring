package pl.wlazly.library.service;

import pl.wlazly.library.entity.User;

import java.util.List;

public interface AdminService {

    List<User> getUserList();
    List<User> findUsersByName(String name);
    User getUserById(int id);
    void updateUserStatus(int id, int roleNumber, int active);
    void deleteUserById(int id);
}
