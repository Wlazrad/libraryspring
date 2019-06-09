package pl.wlazly.library.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.wlazly.library.entity.Book;

import java.util.List;

@Repository
public interface BooksRepository extends JpaRepository<Book, Integer> {

    Book findBookById (int id);

    @Query(value = "SELECT * FROM books b WHERE b.title LIKE %:title%", nativeQuery = true)
    List<Book> findBooksByTitle(@Param("title") String title);

    @Modifying
    @Query(value = "UPDATE books b SET b.status=:status WHERE b.book_id=:id", nativeQuery = true)
    void updateBookStatus(@Param("id") int id, @Param("status")String status);

    void deleteBookById(int id);
}

