package pl.wlazly.library.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "borrows")
@Data
@Builder
@AllArgsConstructor
public class Borrow implements Serializable {

    private static final long serialVersionUID = -6729442333662381231L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "borrow_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "book_id")
    private Book book;

    @Column
    private LocalDate startDate;
    @Column
    private LocalDate endDate;

    public Borrow() {
        //for JPA
    }
}