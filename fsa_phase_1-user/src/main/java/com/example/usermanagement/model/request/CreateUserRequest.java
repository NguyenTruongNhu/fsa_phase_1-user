package com.example.usermanagement.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreateUserRequest {
    private String name;
    private String email;
    private String phone;
    private LocalDate dob;
    private String gender;
    private boolean status;
    private String role;
}
