package com.example.usermanagement.service_implements;

import com.example.usermanagement.entity.Token;
import com.example.usermanagement.entity.User;
import com.example.usermanagement.enums.Role;
import com.example.usermanagement.enums.TokenType;
import com.example.usermanagement.model.request.CreateUserRequest;
import com.example.usermanagement.model.request.LoginRequest;
import com.example.usermanagement.model.request.UpdateUserRequest;
import com.example.usermanagement.model.response.AuthenticationResponse;
import com.example.usermanagement.model.response.LoginResponse;
import com.example.usermanagement.model.response.ResponseObject;
import com.example.usermanagement.repository.TokenDAO;

import com.example.usermanagement.entity.UserPermission;
import com.example.usermanagement.model.*;
import com.example.usermanagement.service.JWTService;
import com.example.usermanagement.service.MailService;
import com.example.usermanagement.service.UserService;
import com.example.usermanagement.utils.Log;
import com.example.usermanagement.repository.UserPermissionRepository;
import com.example.usermanagement.repository.UserRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor

public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MailService mailService;
    @Autowired
    private UserPermissionRepository userPermissionRepository;

    private final AuthenticationManager authenticationManager;
    private final JWTService jwtService;
    private final TokenDAO tokenDAO;


    @Override
    public LoginResponse login(LoginRequest loginRequest) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getEmail(),
                        loginRequest.getPassword()
                )
        );
        var user = userRepository.findByEmail2(loginRequest.getEmail())
                .orElseThrow();
        var token = jwtService.generateToken(user);
        revokeAllUserToken(user);
        saveUserToken(user, token);

        return LoginResponse.builder()
                .status("Successful")
                .role(user.getRole().getRole().name())
                .token(token)
                .userInfo(user).build();


    }

    @Override
    public List<UserGetList> getUserList() {
        List<User> users = userRepository.findAll();
        return users.stream().map(UserGetList::new).collect(Collectors.toList());
    }

    @Override
    public UserSearch getUserByEmail(String email) {
        Log.info("Fetching user by email: {} " + email);
        return userRepository.findByEmail(email);

    }

    public List<UserSearch> getUserByName(String name){
        Log.info("Fetching user by name: {} " + name);
        return userRepository.findByName("%"+ name + "%");
    }

    @Override
    public UserSearch getUserByID(int id){
        Log.info("Fetching user by id: {} " + id);
        return userRepository.findByID(id);
    }
    @Override
    public void createUser(CreateUserRequest userRequest) throws RuntimeException {
        var permission = userPermissionRepository.findUserPermissionByRole(Role.valueOf(userRequest.getRole())).orElse(null);
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String password = randomStringGenerator();
        String encodedPassword = passwordEncoder.encode(password);

        UserDetails authenticatedUser = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String loggedInUserName = authenticatedUser.getUsername();

        User user = User.builder()
                .name(userRequest.getName())
                .email(userRequest.getEmail())
                .password(encodedPassword)
                .phone(userRequest.getPhone())
                .dob(userRequest.getDob())
                .gender(userRequest.getGender())
                .status(userRequest.isStatus())
                .createdBy(loggedInUserName)
                .createdDate(new Date())
                .modifiedBy(loggedInUserName)
                .modifiedDate(new Date())
                .role(permission)
                .build();
        UserSearch existedUser = userRepository.findByEmail(userRequest.getEmail());
        if (existedUser == null) {
            userRepository.save(user);
            Log.info("Creating new user: {} " + user);
            try {
                mailService.sendEmail(user.getEmail(), user.getName(), password);
            } catch (MessagingException e) {
                Log.debug("Error sending email " + e.getMessage());
            }
        } else {
            Log.info("Error creating user -- Existing user: {} " + existedUser.getUserId());
        }
    }
    private String randomStringGenerator() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 10; i++) {
            int randomIndex = random.nextInt(characters.length());
            sb.append(characters.charAt(randomIndex));
        }
        return sb.toString();
    }

    @Override
    public String updateUser(int id, UpdateUserRequest request) {
        String msg;
        User user = userRepository.getUserByID(id);
        User authenticatedUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String loggedInUserName = authenticatedUser.getUsername();
        var permission = userPermissionRepository.findUserPermissionByRole(Role.valueOf(request.getRole()))
                .orElse(null);
        if(user!=null) {
            user.setName(request.getName());
            user.setModifiedBy(loggedInUserName);
            user.setModifiedDate(new Date());
            user.setPhone(request.getPhone());
            user.setDob(request.getDob());
            user.setStatus(request.isStatus());
            user.setGender(request.getGender());
            user.setRole(permission);
            userRepository.save(user);
            msg = "User saved successfully";
            Log.info("Updating a user: {} " + user);
        }else{
            Log.debug("No user found with id {} " + id);
            msg = "No user found";
        }
        return msg;
    }

    @Override
    public String activateUser(int id) {
        String msg;
        User user = userRepository.getUserByID(id);
        if(user != null){
            userRepository.changeStatus(id, true);
            msg = "User has been successfully activated";
            Log.info(user.getUserId() +" has been activated");
        }else{
            Log.info("User not found with id {} " + id);
            msg = "User not found";
        }
        return msg;
    }
    @Override
    public String deactivateUser(int id) {
        String msg;
        User user = userRepository.getUserByID(id);
        if(user != null){
            userRepository.changeStatus(id, false);
            msg = "User has been successfully deactivated";
            Log.info(user.getUserId() +" has been deactivated");
        }else{
            Log.info("User not found with id {} " + id);
            msg = "User not found";
        }
        return msg;
    }

    @Override
    public UserPermission getPermissionByrole(String role) {
        return null;
    }

    @Override
    public void refresh(HttpServletRequest request, HttpServletResponse response) throws IOException {
        final String authenHeader = request.getHeader("Authorization");
        final String refreshToken;
        final String userEmail;
        if (authenHeader == null || !authenHeader.startsWith("Bearer ")) {
            return;
        }
        refreshToken = authenHeader.substring(7);
        userEmail = jwtService.extractUserEmail(refreshToken);
        if (userEmail != null) {
            var existedUser = userRepository.findByEmail2(userEmail).orElseThrow();
            if (jwtService.isTokenValid(refreshToken, (UserDetails) existedUser)) {
                var newToken = jwtService.generateToken((UserDetails) existedUser);
                revokeAllUserToken(existedUser);
                saveUserToken(existedUser, newToken);
                var authResponse = AuthenticationResponse.builder()
                        .status("Successful")
                        .token(newToken)
                        .refreshToken(refreshToken)
                        .build();
                new ObjectMapper().writeValue(response.getOutputStream(), authResponse);
            }
        }
    }

    @Override
    public ResponseObject getLoggedInUser(HttpServletRequest request) {
        String authenHeader = request.getHeader("Authorization");
        final String token;
        final String userEmail;
        if (authenHeader == null || !authenHeader.startsWith("Bearer ")) {
            return null;
        }
        token = authenHeader.substring(7);
        userEmail = jwtService.extractUserEmail(token);
        if (userEmail != null) {
            var loggedInUser = userRepository.findByEmail2(userEmail).orElseThrow();
            if (jwtService.isTokenValid(token, (UserDetails) loggedInUser)) {
                UserDTO userDTO = userRepository.findUserByEmail(userEmail).orElse(null);
                assert userDTO != null;
                return ResponseObject.builder()
                        .status("Successful")
                        .message(loggedInUser.getRole().getRole().name())
                        .payload(UserWithRoleDTO.builder()
                                .name(userDTO.getName())
                                .role(userDTO.getRole().getRole())
                                .email(userDTO.getEmail())
                                .phone(userDTO.getPhone())
                                .dob(userDTO.getDob())
                                .gender(userDTO.getGender())
                                .status(userDTO.isStatus())
                                .createdBy(userDTO.getCreatedBy())
                                .createdDate(userDTO.getCreatedDate())
                                .modifiedBy(userDTO.getModifiedBy())
                                .modifiedDate(userDTO.getModifiedDate())
                                .build())
                        .build();
            }
        }
        return ResponseObject.builder()
                .status("Fail")
                .message("Invalid request")
                .build();
    }

    public void saveUserToken(User user, String token) {
        var userToken = Token.builder()
                .token(token)
                .user(user)
                .tokenType(TokenType.BEARER)
                .expired(false)
                .revoked(false)
                .build();
        tokenDAO.save(userToken);
    }

    public void revokeAllUserToken(User user) {
        var tokenList = tokenDAO.findAllUserTokenByUserId(user.getUserId());
        tokenList.forEach(token -> {
            token.setRevoked(true);
            token.setExpired(true);
        });
        tokenDAO.saveAll(tokenList);
    }
    @Override
    public String updatePassword(int id, String password) {
        String msg;
        User user = userRepository.getUserByID(id);
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(password);
        if(user != null){
            userRepository.updatePassword(encodedPassword, id);
            msg = "User's password has been updated";
            Log.info(user.getUserId() +" 's password has been updated");
        }else{
            Log.info("User not found with id {} " + id);
            msg = "User not found";
        }
        return msg;
    }

    @Override
    public String changeRole(int id, String role) {
        String msg;
        User user = userRepository.getUserByID(id);
        var permission = userPermissionRepository.findUserPermissionByRole(Role.valueOf(role)).orElse(null);
        Log.info("Finding user permission for user: " + user.getUserId());
        if(user!=null) {
            user.setRole(permission);
            userRepository.save(user);
            Log.info(user.getUserId() +" 's role has been updated into " + permission.getRole());
            msg = "User's role updated successfully";
        }else{
            Log.info("User not found with id {} " + id);
            msg = "No user found";
        }
        return msg;
    }
}
