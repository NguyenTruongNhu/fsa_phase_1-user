package com.example.usermanagement.controller;

import com.example.usermanagement.entity.UserPermission;
import com.example.usermanagement.model.*;
import com.example.usermanagement.model.request.CreateUserRequest;
import com.example.usermanagement.model.request.UpdateUserRequest;
import com.example.usermanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Pattern;

@RestController
@RequestMapping(value = "/users")
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("")
    public ResponseEntity<?> getListUser() {
        List<UserGetList> Users = userService.getUserList();
        return ResponseEntity.ok(Users);
    }
    @GetMapping("/search/email/{code}")
    public ResponseEntity<?> getUserByEmail(@PathVariable String code){

        String msg;
        String emailPattern = "^[A-Za-z\\d+_.-]+@(?:(?:[A-Za-z\\d-]+\\.)?[A-Za-z]+\\.)?(gmail\\.com)$";
        Pattern emailCodePattern = Pattern.compile(emailPattern);
            if (code.equals("") || code.trim().isEmpty()) {
                msg = "Email cannot be empty";
            }else if(!emailCodePattern.matcher(code).find()){
                msg ="Email must be in the format " + "xxx@gmail.com";
            } else if (userService.getUserByEmail(code) == null) {
                msg = "There is no User with User code = " + code;
            } else {
                UserSearch user = userService.getUserByEmail(code);
                return ResponseEntity.ok(user);
            }

        return ResponseEntity.ok(msg);
    }
    @GetMapping("/search/permission/{code}")
    public ResponseEntity<?> getpermissionByRole(@PathVariable String role){

        UserPermission userPermission = userService.getPermissionByrole(role);
        return ResponseEntity.ok(userPermission);
    }
    @GetMapping("/search/name/{code}")
    public ResponseEntity<?> getUserByName(@PathVariable String code){

        String msg;

        if (code.equals("") || code.trim().isEmpty()) {
            msg = "Name cannot be empty";
        } else if (userService.getUserByName(code) == null) {
            msg = "There is no User with User code = " + code;
        } else {
            List<UserSearch> user = userService.getUserByName(code);
            return ResponseEntity.ok(user);
        }

        return ResponseEntity.ok(msg);
    }
    @GetMapping("/search/id/{code}")
    public ResponseEntity<?> getUserByID(@PathVariable("code") int id){

        String msg;
        if(id == 0 || id < 0){
            msg = "Please enter a user ID, > 0";
        }else if(userService.getUserByID(id) == null){
            msg = "There is no User with User code = " + id;
        }else{
            UserSearch User = userService.getUserByID(id);
            return ResponseEntity.ok(User);
        }return ResponseEntity.ok(msg);
    }

    @GetMapping("/update/{code}")
    public ResponseEntity<?> update(@PathVariable("code") int id){

        String msg;
        if(id == 0 || id < 0){
            msg = "Please enter a user ID, > 0";
        }else if(userService.getUserByID(id) == null){
            msg = "There is no User with User ID = " + id;
        }else{
            UserSearch User = userService.getUserByID(id);
            UpdateUserRequest updateUser = new UpdateUserRequest(User);
            return ResponseEntity.ok(updateUser);
        }return ResponseEntity.ok(msg);
    }

    @PostMapping("/create")
    @PreAuthorize("hasAuthority('user:create')")

    public ResponseEntity<?> createUser(@RequestBody CreateUserRequest request
                                        ){
        String msg;
        String emailPattern = "^[A-Za-z\\d+_.-]+@(?:(?:[A-Za-z\\d-]+\\.)?[A-Za-z]+\\.)?(gmail\\.com)$";
        Pattern emailCodePattern = Pattern.compile(emailPattern);

        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        dateFormatter.setLenient(false);
        try {
            if(request.getName() == null){
                msg = "Please enter a name for new user";
            }else if(request.getEmail() == null){
                msg = "Please enter a email for new user";
            }else if(request.getPhone() == null || !request.getPhone().matches("\\d{9}")){
                msg = "Please enter a valid phone( 9 digit) for new user";
            }else if(request.getGender() == null){
                msg = "Please enter a valid gender( Male/ Female) for new user";
            }else if(request.getDob() == null || request.getDob().toString().isEmpty()){
                msg = "Please enter a valid date of birth( yyyy-mm-dd) for new user";
            }else if(!emailCodePattern.matcher(request.getEmail()).find()){
                msg ="Email must be in the format " + "xxx@gmail.com";
            }else if(request.getRole() == null){
                msg = "Please enter a role for new user";
            }else{


                userService.createUser(request);
                msg = "User created successfully";

            }
            return ResponseEntity.ok(msg);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//            return null;
        }

    }
    @PutMapping ("/update/{id}")
    @PreAuthorize("hasAuthority('user:update')")
    public ResponseEntity<?> updateUser(@RequestBody UpdateUserRequest request, @PathVariable("id") int id
                                        ) {


        String msg;
        try{
            if(id == 0 || id < 0){
                msg = "Please enter a user ID, > 0";
            }else if(userService.getUserByID(id) == null){
                msg = "There is no User with User code = " + id;
            }else if(request.getPhone() == null || !request.getPhone().matches("\\d{9}")){
                msg = "Please enter a valid phone( 9 digit) for new user";
            }else if(request.getGender() == null){
                msg = "Please enter a valid gender( Male/ Female) for new user";
            }else if(request.getDob() == null || request.getDob().toString().isEmpty()){
                msg = "Please enter a valid date of birth( yyyy-mm-dd) for new user";
            }else if(request.getRole() == null){
                msg = "Please enter a role for new user";
            }else if(request.getRole().equals("")){
                msg = "Provide a new role( TRAINER/ CLASS_ADMIN/ SUPER_ADMIN)";
            }else if(!(request.getRole().equalsIgnoreCase("CLASS_ADMIN")) && !(request.getRole().equalsIgnoreCase("TRAINER")) && !(request.getRole().equalsIgnoreCase("SUPER_ADMIN"))){
                msg = "Provide a valid role( TRAINER/ CLASS_ADMIN/ SUPER_ADMIN)";
            }else{
                msg = userService.updateUser(id, request);
            }

            return ResponseEntity.ok(msg);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PutMapping ("/activate/{id}")
    @PreAuthorize("hasAuthority('user:update')")
    public ResponseEntity<?> activateUser(@PathVariable("id") int id){
        String msg;

        try {
            if(id == 0 || id < 0){
                msg = "Please enter a user ID, > 0";
            }else if(userService.getUserByID(id) == null){
                msg = "There is no User with User code = " + id;
            }else{
            msg = userService.activateUser(id);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.getMessage();
            return new ResponseEntity<>(HttpStatus.ACCEPTED);
        }
        return ResponseEntity.ok(msg);
    }

    @PutMapping ("/deactivate/{id}")
    @PreAuthorize("hasAuthority('user:update')")
    public ResponseEntity<?> deactivateUser(@PathVariable("id") int id){
        String msg = "";

        try {
            if(id == 0 || id < 0){
                msg = "Please enter a user ID, > 0";
            }else if(userService.getUserByID(id) == null){
                msg = "There is no User with User code = " + id;
            }else{
                msg = userService.deactivateUser(id);
            }
        } catch (Exception e) {
            e.getMessage();
            return new ResponseEntity<>(HttpStatus.ACCEPTED);
        }
        return ResponseEntity.ok(msg);
    }

    @PutMapping ("/password/{id}")
    public ResponseEntity<?> updatePassword(@PathVariable("id") int id, @RequestParam(value = "password") String password){
        String msg = "";

        try {
            if(id == 0 || id < 0){
                msg = "Please enter a user ID, > 0";
            }else if(userService.getUserByID(id) == null){
                msg = "There is no User with User code = " + id;
            }else if(password.equals("") || password.length() > 10){
                msg = "Enter a new password, < 10 char";
            }else{
                msg = userService.updatePassword(id, password);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return ResponseEntity.ok(msg);
    }

    @PutMapping ("/role/{id}")
    @PreAuthorize("hasAuthority('user:update')")
    public ResponseEntity<?> changeRole(@PathVariable("id") int id, @RequestParam(value = "role") String role){
        String msg = "";

        try {
            if(id == 0 || id < 0){
                msg = "Please enter a user ID, > 0";
            }else if(userService.getUserByID(id) == null){
                msg = "There is no User with User code = " + id;
            }else if(role.equals("")){
                msg = "Provide a new role( TRAINER/ CLASS_ADMIN/ SUPER_ADMIN)";
            }else if(!(role.equalsIgnoreCase("CLASS_ADMIN")) && !(role.equalsIgnoreCase("TRAINER")) && !(role.equalsIgnoreCase("SUPER_ADMIN"))){
                msg = "Provide a valid role( TRAINER/ CLASS_ADMIN/ SUPER_ADMIN)";
            }else{
                msg = userService.changeRole(id, role);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return ResponseEntity.ok(msg);
    }

}
