package com.example.usermanagement.controller;

import com.example.usermanagement.model.request.LoginRequest;
import com.example.usermanagement.model.response.LoginResponse;
import com.example.usermanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/authenticate")
public class AuthenticationController {
    @Autowired
    private UserService userService;
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> loginRequest(@RequestBody LoginRequest loginRequest) {
        return ResponseEntity.ok(userService.login(loginRequest));
    }
}
