package com.example.usermanagement.repository;

import com.example.usermanagement.entity.TrainingProgram;
import com.example.usermanagement.entity.User;
import com.example.usermanagement.model.TrainingProgramSearch;
import com.example.usermanagement.model.UserSearch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TrainingProgramRepository  extends JpaRepository<TrainingProgram, Integer> {

    int countByNameLike(String name);
    @Query( value =
            "SELECT tr.training_program_code as ID, tr.name, tr.start_date as 'startDate', tr.status, u.name as 'user', tr.created_by as 'createdBy', tr.created_date as 'createdDate', tr.duration, tr.modified_by as 'modifiedBy' from training_programs as tr\n" +
                    "INNER JOIN users as u \n" +
                    "on tr.user_id = u.user_id\n" +
                    "where LOWER(tr.name) LIKE :name",
            nativeQuery = true)
    List<TrainingProgramSearch> findByNameV2(String name);

    TrainingProgram findByName(String trainingProgramName);

    @Query("SELECT tp FROM TrainingProgram tp where tp.name = :name")
    TrainingProgram getTrainingProgramByName(String name);

    @Query("SELECT tp FROM TrainingProgram tp where tp.id = :id")
    TrainingProgram getTrainingProgramByID(int id);

}
