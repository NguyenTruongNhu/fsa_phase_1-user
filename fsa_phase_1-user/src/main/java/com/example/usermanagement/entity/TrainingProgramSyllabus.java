package com.example.usermanagement.entity;

import com.example.usermanagement.model.key.SyllabusTrainingProgramCompositeKey;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "training_program_syllabuses")
public class TrainingProgramSyllabus {
    @EmbeddedId
    SyllabusTrainingProgramCompositeKey id;

    @ManyToOne(cascade = CascadeType.MERGE, optional = false, fetch = FetchType.LAZY)
    @MapsId("topicCode")
    @JoinColumn(name = "topic_code", referencedColumnName = "topic_code")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @JsonBackReference
    private Syllabus topicCode;


    @ManyToOne(cascade = CascadeType.MERGE, optional = false, fetch = FetchType.LAZY)
    @MapsId("trainingProgramCode")
    @JoinColumn(name = "training_programs_code")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    @JsonBackReference
    private TrainingProgram trainingProgramCode;

    @Column(name = "deleted")
    private boolean deleted;
}
