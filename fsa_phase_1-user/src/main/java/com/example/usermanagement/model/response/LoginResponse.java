package com.example.usermanagement.model.response;

import com.example.usermanagement.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LoginResponse {
    private String status;
    private String role;
    private String token;
    private User userInfo;
}