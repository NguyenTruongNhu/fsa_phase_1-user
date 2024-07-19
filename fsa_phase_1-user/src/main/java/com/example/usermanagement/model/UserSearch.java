package com.example.usermanagement.model;

import com.example.usermanagement.entity.UserPermission;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

public interface UserSearch {
    int getUserId();

    String getName();

    String getEmail();

    String getPhone();

    LocalDate getDob();

    String getGender();

    String getRole();

    boolean isStatus();

    String getCreatedBy();

    String getModifiedBy();
}
