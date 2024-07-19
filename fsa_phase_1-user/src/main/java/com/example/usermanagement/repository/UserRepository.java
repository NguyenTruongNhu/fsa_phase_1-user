package com.example.usermanagement.repository;

import com.example.usermanagement.entity.User;
import com.example.usermanagement.model.UserDTO;
import com.example.usermanagement.model.UserSearch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("SELECT u FROM User u WHERE u.userId = :id AND u.status = true")
    User getUserByID(int id);
    @Query("SELECT u FROM User u WHERE u.email = :email AND u.status = true")
    User getUserByEmail(String email);

    @Query(
            """
                            SELECT Us FROM User Us WHERE Us.email = :email AND Us.status = true
                    """)
    Optional<User> findByEmail2(String email);
    @Query( value =
            "SELECT u.user_id as 'userId', u.name, u.email, u.phone, u.dob, u.gender, u.created_by as 'createdBy', u.modified_by as 'modifiedBy', u.is_active as 'status', p.role\n"
                    + "FROM users as u INNER JOIN user_permission as p on u.role = p.permission_id where u.email = :email",
            nativeQuery = true)

    UserSearch findByEmail(String email);

    @Query( value =
            "SELECT u.user_id as 'userId', u.name, u.email, u.phone, u.dob, u.gender, u.created_by as 'createdBy', u.modified_by as 'modifiedBy', u.is_active as 'status', p.role\n"
                    + "FROM users as u INNER JOIN user_permission as p on u.role = p.permission_id where LOWER(u.name) LIKE :name",
            nativeQuery = true)
    List<UserSearch> findByName(String name);

    @Query(
            value =
                    "SELECT u.user_id as 'userId', u.name, u.email, u.phone, u.dob, u.gender, u.created_by as 'createdBy', u.modified_by as 'modifiedBy', u.is_active as 'status', p.role\n"
                            + "FROM users as u INNER JOIN user_permission as p on u.role = p.permission_id where u.user_id = :id",
            nativeQuery = true)
    UserSearch findByID(int id);
    Optional<UserDTO> findUserByEmail(String email);

    @Modifying
    @Transactional
    @Query(value = "UPDATE User u SET u.status = :newStatus WHERE u.userId = :id")
    void changeStatus(int id, boolean newStatus);

    @Modifying
    @Transactional
    @Query("UPDATE User u SET u.password = :newPassword WHERE u.userId = :id")
    void updatePassword(@Param("newPassword") String newPassword, @Param("id") int id);

}
