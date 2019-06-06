package pl.wlazly.library.service;


import pl.wlazly.library.entity.Borrow;
import pl.wlazly.library.entity.User;
import java.util.List;

public interface BorrowService {

    Borrow getBorrowById(int id);
    List<Borrow> getBorrowsByUser(User user);
    void saveBorrow(Borrow borrow);
}
