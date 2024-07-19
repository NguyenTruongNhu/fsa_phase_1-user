package com.example.usermanagement.service;

import com.example.usermanagement.entity.TrainingProgram;
import com.example.usermanagement.model.TrainingProgramDTO;
import com.example.usermanagement.model.TrainingProgramSearch;
import com.example.usermanagement.model.request.CreateTrainingProgramRequest;
import com.example.usermanagement.model.request.UpdateTrainingProgramRequest;
import com.example.usermanagement.model.response.ResponseObject;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface TrainingProgramService {




    public List<TrainingProgramSearch> getTrainingProgram(String name);
    public List<TrainingProgramDTO> getTrainingPrograms();
    public String createTrainingProgram(CreateTrainingProgramRequest trainingProgram);
    public String updateTrainingProgram(UpdateTrainingProgramRequest trainingProgram, int id);
    ResponseEntity<ResponseObject> getAllActive();
    String changeTrainingProgramStatus(int trainingProgramCode, String value);

    TrainingProgram duplicateNameTrainingProgram(String name);
}
