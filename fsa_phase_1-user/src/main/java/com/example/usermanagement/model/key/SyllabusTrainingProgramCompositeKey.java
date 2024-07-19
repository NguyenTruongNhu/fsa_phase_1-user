package com.example.usermanagement.model.key;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.Embedded;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Embeddable
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class SyllabusTrainingProgramCompositeKey implements Serializable {
    @Column(name = "topic_code")
    String topicCode;

    @Column(name = "training_programs_code")
    int trainingProgramCode;
}
