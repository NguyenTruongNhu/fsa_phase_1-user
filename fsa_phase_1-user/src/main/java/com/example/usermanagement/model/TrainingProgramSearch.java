package com.example.usermanagement.model;

import java.time.LocalDate;

public interface TrainingProgramSearch {
    int getID();
    String getName();
    String getStartDate();
    String getStatus();
    String getUser();
    String getCreatedBy();
    LocalDate getCreatedDate();
    int getDuration();
    String getModifiedBy();
    LocalDate getModifiedDate();
}
