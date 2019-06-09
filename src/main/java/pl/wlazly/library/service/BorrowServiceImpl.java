package pl.wlazly.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.wlazly.library.entity.Borrow;
import pl.wlazly.library.entity.User;
import pl.wlazly.library.repository.BorrowRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

@Service("borrowService")
@Transactional
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowRepository borrowRepo;

    @Override
    public Borrow getBorrowById(int id) {
        return borrowRepo.findById(id).get();
    }

    @Override
    public List<Borrow> getBorrowsByUser(User user) {
        return borrowRepo.findAll().stream().filter( b -> b.getUser().equals(user)).collect(Collectors.toList());
    }

    @Override
    public void saveBorrow(Borrow borrow) {
        borrowRepo.save(borrow);
    }
}
