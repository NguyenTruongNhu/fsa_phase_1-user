package com.example.usermanagement.controller;

import com.example.usermanagement.entity.TrainingProgram;
import com.example.usermanagement.model.TrainingProgramDTO;
import com.example.usermanagement.model.TrainingProgramSearch;
import com.example.usermanagement.model.request.CreateTrainingProgramRequest;
import com.example.usermanagement.model.request.UpdateTrainingProgramRequest;
import com.example.usermanagement.model.response.ResponseObject;
import com.example.usermanagement.service.TrainingProgramService;
import com.example.usermanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping(value = "/training_program")
public class TrainingProgramController {
    @Autowired
    TrainingProgramService trainingProgramService;

    @Autowired
    UserService userService;

    @GetMapping(value = "")
    public ResponseEntity<?> getTrainingPrograms(){
        List<TrainingProgramDTO> list = trainingProgramService.getTrainingPrograms();
        return ResponseEntity.ok(list);
    }

    @GetMapping(value = "/search/{name}")
    public ResponseEntity<?> getTrainingProgramByName(@PathVariable String name) {
        String msg;
        if(name == null){
            msg = "No training program were found";
        }else{
            List<TrainingProgramSearch> trainingPrograms = trainingProgramService.getTrainingProgram(name);
            return ResponseEntity.ok(trainingPrograms);
        }
        return ResponseEntity.ok(msg);
    }

    @PostMapping(value = "/create")
    @PreAuthorize("hasAuthority('training:create')")
    public ResponseEntity<?> createTrainingProgram(@RequestBody CreateTrainingProgramRequest request){
        String msg;
        if(request.getName() == null){
            msg = "Please enter a name for training program";
        } else if (request.getDuration() < 0) {
            msg = "Please enter a duration > 0";
        }  else if (request.getStartDate().isBefore(LocalDate.now())) {
            msg = "Please enter a start date that is after the current day";
        }else if (userService.getUserByEmail(request.getUserEmail()) == null) {
            msg = "No trainer were found for email " + request.getUserEmail();
        }else{
            msg = trainingProgramService.createTrainingProgram(request);
        }
        return ResponseEntity.ok(msg);
    }

    @PutMapping(value = "/update/{id}")
    @PreAuthorize("hasAuthority('training:update')")
    public ResponseEntity<?> updateTrainingProgram(@PathVariable int id, @RequestBody UpdateTrainingProgramRequest request){
        String msg;
        if(id <= 0){
            msg = "Please enter a id that >0";
        }else if(request.getDuration() < 0){
            msg = "Please enter a duration that > 0";
        }else{
            msg = trainingProgramService.updateTrainingProgram(request, id);
        }
        return ResponseEntity.ok(msg);
    }


    @GetMapping(value = "/duplicate/{name}")
    @PreAuthorize("hasAuthority('training:read')")
    public ResponseEntity<?> duplicateTrainingProgram(@PathVariable String name){
       TrainingProgram duplicate = trainingProgramService.duplicateNameTrainingProgram(name);

       return ResponseEntity.ok(duplicate);
    }

    @GetMapping("/activate/{trainingProgramCode}")
    @PreAuthorize("hasAnyAuthority('training:update')")
    public ResponseEntity<?> activateTrainingProgram(
            @PathVariable int trainingProgramCode) {
        String changeStatus = trainingProgramService.changeTrainingProgramStatus(trainingProgramCode, "Activate");

        return ResponseEntity.ok(changeStatus);
    }

    @GetMapping("/deactivate/{trainingProgramCode}")
    @PreAuthorize("hasAnyAuthority('training:update')")
    public ResponseEntity<?> deactivateTrainingProgram(
            @PathVariable int trainingProgramCode) {
        String changeStatus = trainingProgramService.changeTrainingProgramStatus(trainingProgramCode, "De-activate");

        return ResponseEntity.ok(changeStatus);
    }

}
