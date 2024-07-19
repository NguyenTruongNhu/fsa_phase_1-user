package com.example.usermanagement.repository;

import com.example.usermanagement.entity.TrainingProgramSyllabus;
import com.example.usermanagement.model.key.SyllabusTrainingProgramCompositeKey;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainingProgramSyllabusRepository extends JpaRepository<TrainingProgramSyllabus, SyllabusTrainingProgramCompositeKey> {
}
