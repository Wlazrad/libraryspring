package pl.wlazly.library.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="users")
@Data
@Builder
@AllArgsConstructor
public class User implements Serializable {

    private static final long serialVersionUID = -6199041478952441429L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private String login;

    @Column
    private String password;

    @Column
    private String firstName;

    @Column
    private String lastName;

    @Column
    private String email;

    @Enumerated(EnumType.STRING)
    private UserStatus admin;

    public User() {
        //for hibernate
    }

}
