package pl.wlazly.library.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "books")
@Data
@Builder
@AllArgsConstructor
public class Book implements Serializable {

    private static final long serialVersionUID = 1096512445251856305L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    private Integer id;
    @Column(length = 13)
    private String isbn;
    @Column(length = 100)
    private String title;
    @Column(length = 100)
    private String author;
    @Column
    private Integer releaseDate;
    @Column(length = 1000)
    private String description;
    @Enumerated(EnumType.STRING)
    private BookStatus status;

    public Book() {
        //for JPA
    }
}
