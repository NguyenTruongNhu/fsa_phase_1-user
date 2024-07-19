package com.example.usermanagement.model;

import com.example.usermanagement.entity.TrainingProgram;

import java.time.LocalDate;

public class TrainingProgramDTO {
    public String name;
    public LocalDate createdDate;
    public String createdBy;
    public int duration;
    public String status;

    public TrainingProgramDTO(TrainingProgram trainingProgram) {
        name = trainingProgram.getName();
        createdDate = trainingProgram.getCreatedDate();
        createdBy = trainingProgram.getCreatedBy();
        duration = trainingProgram.getDuration();
        status = trainingProgram.getStatus();
    }
}
