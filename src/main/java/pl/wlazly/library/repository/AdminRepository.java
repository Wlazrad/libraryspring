package pl.wlazly.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pl.wlazly.library.entity.User;

import java.util.List;

@Repository("adminRepository")
public interface AdminRepository extends JpaRepository<User, Integer> {

    User findUserById(int id);

    @Query(value = "SELECT * FROM user u WHERE u.email LIKE %:name% OR u.login LIKE %:name%", nativeQuery = true)
    List<User> findUsersByName(@Param("name") String name);

    @Modifying
    @Query("UPDATE User u SET u.active=:active WHERE u.id=:id")
    void updateUserActivation(@Param("id") int id, @Param("active") int active);

    @Modifying
    @Query(value = "UPDATE user_role r SET r.role_id=:roleNumber WHERE r.user_id=:id", nativeQuery = true)
    void updateUserRole(@Param("id") int id, @Param("roleNumber") int roleNumber);

    @Modifying
    @Query(value = "DELETE FROM user_role WHERE user_id=:id", nativeQuery = true)
    void deleteUserByIdFromUserRoleTable(@Param("id") int id);

    @Modifying
    @Query(value = "DELETE FROM user WHERE user_id=:id", nativeQuery = true)
    void deleteUserByIdFromUserTable(@Param("id") int id);
}
