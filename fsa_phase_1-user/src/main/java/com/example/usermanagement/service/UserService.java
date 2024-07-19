package com.example.usermanagement.service;

import com.example.usermanagement.entity.UserPermission;
import com.example.usermanagement.model.*;
import com.example.usermanagement.model.request.CreateUserRequest;
import com.example.usermanagement.model.request.LoginRequest;
import com.example.usermanagement.model.request.UpdateUserRequest;
import com.example.usermanagement.model.response.LoginResponse;
import com.example.usermanagement.model.response.ResponseObject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


public interface UserService {
    LoginResponse login(LoginRequest loginRequest);

    public List<UserGetList> getUserList();
    public UserSearch getUserByID(int UserID);
    public UserSearch getUserByEmail(String email);
    public List<UserSearch> getUserByName(String name);
    public void createUser(CreateUserRequest User);
    public String updateUser(int id, UpdateUserRequest User);
    public String activateUser(int id);
    public String deactivateUser(int id);
    public String updatePassword(int id, String password);
    public String changeRole(int id, String role);
    public UserPermission getPermissionByrole(String role);
    void refresh(HttpServletRequest request, HttpServletResponse response) throws IOException;

    ResponseObject getLoggedInUser(HttpServletRequest request);
}
