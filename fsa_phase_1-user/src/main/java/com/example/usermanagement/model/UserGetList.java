package com.example.usermanagement.model;

import com.example.usermanagement.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserGetList {
    private int id;
    private String fullName;
    private String email;
    private LocalDate birthday;
    private String gender;

    public UserGetList(User user) {
        this.id = user.getUserId();
        this.fullName = user.getName();
        this.email = user.getEmail();
        this.birthday = user.getDob();
        this.gender = user.getGender();
    }
}
