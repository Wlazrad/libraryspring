package pl.wlazly.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.wlazly.library.entity.Borrow;

@Repository
public interface BorrowRepository extends JpaRepository<Borrow, Integer> {
}
