package com.example.usermanagement.service_implements;

import com.example.usermanagement.entity.Syllabus;
import com.example.usermanagement.entity.TrainingProgram;
import com.example.usermanagement.entity.TrainingProgramSyllabus;
import com.example.usermanagement.entity.User;
import com.example.usermanagement.model.TrainingProgramDTO;
import com.example.usermanagement.model.TrainingProgramSearch;
import com.example.usermanagement.model.key.SyllabusTrainingProgramCompositeKey;
import com.example.usermanagement.model.request.CreateTrainingProgramRequest;
import com.example.usermanagement.model.request.UpdateTrainingProgramRequest;
import com.example.usermanagement.model.response.ResponseObject;
import com.example.usermanagement.repository.SyllabusRepository;
import com.example.usermanagement.repository.TrainingProgramRepository;
import com.example.usermanagement.repository.TrainingProgramSyllabusRepository;
import com.example.usermanagement.repository.UserRepository;
import com.example.usermanagement.service.TrainingProgramService;
import com.example.usermanagement.utils.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class TrainingProgramImpl implements TrainingProgramService {
    @Autowired
    TrainingProgramRepository trainingProgramRepository;
    @Autowired
    UserRepository userRepository;

    @Override
    public ResponseEntity<ResponseObject> getAllActive() {
        return null;
    }

    @Autowired
    SyllabusRepository syllabusRepository;

    @Autowired
    TrainingProgramSyllabusRepository trainingProgramSyllabusRepository;

    @Override
    public List<TrainingProgramSearch> getTrainingProgram(String name) {
        Log.info("Fetching training program by name: {} " + name);
        return trainingProgramRepository.findByNameV2("%" + name + "%");
    }

    @Override
    public List<TrainingProgramDTO> getTrainingPrograms() {
        List<TrainingProgram> list = trainingProgramRepository.findAll();
        return list.stream().map(TrainingProgramDTO::new).collect(Collectors.toList());
    }

    @Override
    public String createTrainingProgram(CreateTrainingProgramRequest trainingProgram) {
        String msg;
        UserDetails authenticatedUser = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String loggedInUserName = authenticatedUser.getUsername();
        if (loggedInUserName.equals("")) {
            Log.debug(("Cannnot get loggedin user name"));
            msg = "Cannnot get loggedin user name";
            return msg;
        }
        Log.info("Finding trainer with email " + loggedInUserName);
        User user = userRepository.getUserByEmail(loggedInUserName);
        if (trainingProgramRepository.getTrainingProgramByName(trainingProgram.getName()) != null) {
            Log.debug(("The training program already exist" + trainingProgramRepository.findByName(trainingProgram.getName())));
            msg = "The training program already exist" + trainingProgramRepository.findByName(trainingProgram.getName());
            return msg;
        }
        try {
            TrainingProgram tp = new TrainingProgram();
            tp.setCreatedBy(loggedInUserName);
            tp.setCreatedDate(LocalDate.now());
            tp.setDuration(trainingProgram.getDuration());
            tp.setModifiedBy(loggedInUserName);
            tp.setModifiedDate(LocalDate.now());
            tp.setName(trainingProgram.getName());
            tp.setStatus(trainingProgram.getStatus());
            tp.setStartDate(trainingProgram.getStartDate());
            tp.setUserID(user);
            var result = trainingProgramRepository.save(tp);
            List<TrainingProgramSyllabus> tps = createTrainingProgramSyllabus(result, trainingProgram.getTopicCode());
            msg = "Created training program successfully" + result + "\n" + tps;
        } catch (Exception e) {
            Log.debug("Error were found in creating training program " + e.getMessage());
            msg = e.getMessage();
        }
        return msg;
    }

    public List<TrainingProgramSyllabus> createTrainingProgramSyllabus(TrainingProgram trainingProgram, String[] topicCode) {
        List<TrainingProgramSyllabus> tps = new ArrayList<TrainingProgramSyllabus>();
        for (String s : topicCode) {
            Syllabus syllabus = syllabusRepository.getSyllabusByTopicCode(s);
            TrainingProgramSyllabus trainingProgramSyllabus =
                    TrainingProgramSyllabus.builder()
                            .id(
                                    SyllabusTrainingProgramCompositeKey.builder()
                                            .topicCode(s)
                                            .trainingProgramCode(trainingProgram.getId())
                                            .build())
                            .topicCode(syllabus)
                            .trainingProgramCode(trainingProgram)
                            .deleted(false)
                            .build();
            trainingProgramSyllabusRepository.save(trainingProgramSyllabus);
            tps.add(trainingProgramSyllabus);
        }
        return tps;
    }

    @Override
    public String updateTrainingProgram(UpdateTrainingProgramRequest trainingProgram, int id) {
        String msg;
        UserDetails authenticatedUser = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String loggedInUserName = authenticatedUser.getUsername();
        Log.info("Get the training program by ID " + id);
        TrainingProgram tp = trainingProgramRepository.getTrainingProgramByID(id);
        if (tp == null) {
            Log.debug("Training program not found with id " + id);
            msg = "Training program not found";
        } else {
            tp.setDuration(trainingProgram.getDuration());
            tp.setModifiedBy(loggedInUserName);
            tp.setModifiedDate(LocalDate.now());
            var result = trainingProgramRepository.save(tp);
            List<TrainingProgramSyllabus> tps = updateTrainingProgramSyllabus(result, trainingProgram.getTopicCode());
            msg = "Training program updated successfully: " + trainingProgram + "\n" + tps;
        }

        return msg;
    }

    @Override
    public String changeTrainingProgramStatus(int trainingProgramCode, String value) {
        String msg = null;

        TrainingProgram trainingProgram = trainingProgramRepository.findById(trainingProgramCode).orElse(null);
        String result = value.equalsIgnoreCase("Activate") ? "active" : "inactive";
        if(trainingProgram != null && !trainingProgram.getStatus().equalsIgnoreCase(result)){
            switch (value){
                case "Activate":
                    activateProgram(trainingProgramCode);
                    msg = value + "training program successfully: " + trainingProgram;
                    break;
                case "De-activate":
                    deactivateProgram(trainingProgramCode);
                    msg = value + "training program successfully: " + trainingProgram;
                    break;

            }

        }
        return msg;
    }

    public void activateProgram(int trainingProgramCode) {
        TrainingProgram trainingProgram = trainingProgramRepository.findById(trainingProgramCode).orElse(null);

        if (trainingProgram != null) {
            trainingProgram.setStatus("active");
            trainingProgramRepository.save(trainingProgram);
        }
    }

    public void deactivateProgram(int trainingProgramCode){
        TrainingProgram trainingProgram = trainingProgramRepository.findById(trainingProgramCode).orElse(null);
        if(trainingProgram !=null){
            trainingProgram.setStatus("inactive");
            trainingProgramRepository.save(trainingProgram);
        }

    }


    @Override
    public TrainingProgram duplicateNameTrainingProgram(String name) {

        TrainingProgram originProgram = trainingProgramRepository.findByName(name);

        int version = trainingProgramRepository.countByNameLike(name + "%");

        name = originProgram.getName();
        String trainingProgamName = name + "_" + version;

        TrainingProgram newTrainingProgram = TrainingProgram.builder()
                .name(trainingProgamName)
                .duration(originProgram.getDuration())
                .userID(originProgram.getUserID())
                .startDate(originProgram.getStartDate())
                .createdBy(originProgram.getCreatedBy())
                .createdDate(originProgram.getCreatedDate())
                .modifiedBy(originProgram.getModifiedBy())
                .modifiedDate(originProgram.getModifiedDate())
                .status(originProgram.getStatus())
                .build();

        return trainingProgramRepository.save(newTrainingProgram);
    }

    public List<TrainingProgramSyllabus> updateTrainingProgramSyllabus(TrainingProgram trainingProgram, String[] topicCode) {
        List<TrainingProgramSyllabus> tps = new ArrayList<TrainingProgramSyllabus>();
        SyllabusTrainingProgramCompositeKey compositeKey = new SyllabusTrainingProgramCompositeKey();
        compositeKey.setTrainingProgramCode(trainingProgram.getId());

        for (String s : topicCode) {
            Syllabus syllabus = syllabusRepository.getSyllabusByTopicCode(s);

            if (syllabus != null) {
                boolean exists =
                        trainingProgram.getTrainingProgramSyllabus().stream()
                                .anyMatch(
                                        existingSyllabus ->
                                                existingSyllabus
                                                        .getTopicCode()
                                                        .getTopicCode()
                                                        .equals(syllabus.getTopicCode()));

                if (!exists) {
                    TrainingProgramSyllabus trainingProgramSyllabus =
                            TrainingProgramSyllabus.builder()
                                    .id(
                                            SyllabusTrainingProgramCompositeKey.builder()
                                                    .topicCode(syllabus.getTopicCode())
                                                    .trainingProgramCode(trainingProgram.getId())
                                                    .build())
                                    .topicCode(syllabus)
                                    .trainingProgramCode(trainingProgram)
                                    .deleted(false)
                                    .build();
                    trainingProgramSyllabusRepository.save(trainingProgramSyllabus);
                    tps.add(trainingProgramSyllabus);
                }
            }
        }
        return tps;
    }
}
