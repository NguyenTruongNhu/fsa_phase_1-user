package com.example.usermanagement.model.request;

import com.example.usermanagement.model.UserSearch;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserRequest {
    private String name;
    private String phone;
    private LocalDate dob;
    private String gender;
    private boolean status;
    private String role;

    public UpdateUserRequest(UserSearch us) {
        this.name = us.getName();
        this.phone = us.getPhone();
        this.dob = us.getDob();
        this.gender = us.getGender();
        this.status = us.isStatus();
    }
}
