package pl.wlazly.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.wlazly.library.entity.Role;
import pl.wlazly.library.entity.User;
import pl.wlazly.library.repository.RoleRepository;
import pl.wlazly.library.repository.UserRepository;

import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.HashSet;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Override
    public void saveUser(User user) {
        user.setActive(1);
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        Role role = roleRepository.findByRole("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(role)));

        userRepository.save(user);

    }

    @Override
    public User findUserByEmail(String email) {
        return userRepository.findUserByEmail(email);
    }

    @Override
    public User findUserByLogin(String login) {
        return userRepository.findUserByLogin(login);
    }

    @Override
    public void updateUserPassword(String newPassword, String email) {
        userRepository.updateUserPassword(passwordEncoder.encode(newPassword), email);
    }

    @Override
    public void updateUserProfile(String login, String firstName, String lastName, String email) {
        userRepository.updateUserProfile(login, firstName, lastName, email);
    }
}
