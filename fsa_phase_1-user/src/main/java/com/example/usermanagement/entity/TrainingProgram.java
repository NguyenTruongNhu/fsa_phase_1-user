package com.example.usermanagement.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "training_programs")
public class TrainingProgram {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "training_program_code")
    private int id;
    @Column(name = "created_by")
    private String createdBy;
    @Column(name = "created_date")
    private LocalDate createdDate;
    @Column(name = "duration")
    private int duration;
    @Column(name = "modified_by")
    private String modifiedBy;
    @Column(name = "modified_date")
    private LocalDate modifiedDate;
    @Column(name = "name")
    private String name;
    @Column(name = "start_date")
    private LocalDate startDate;
    @Column(name = "status")
    private String status;

    @ManyToOne(optional = false, cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
//    @JsonBackReference
    private User userID;

    @OneToMany(mappedBy = "trainingProgramCode", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonManagedReference
    private final Set<TrainingProgramSyllabus> trainingProgramSyllabus = new HashSet<>();

}
