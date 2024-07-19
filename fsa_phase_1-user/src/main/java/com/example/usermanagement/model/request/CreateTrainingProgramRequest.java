package com.example.usermanagement.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CreateTrainingProgramRequest {
    String name;
    String userEmail;
    String[] topicCode;
    int duration;
    String status;
    LocalDate startDate;
}
