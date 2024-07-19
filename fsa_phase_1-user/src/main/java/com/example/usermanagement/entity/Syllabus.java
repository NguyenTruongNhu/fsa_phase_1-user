package com.example.usermanagement.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "syllabus")
public class Syllabus {
    @Id
    @Column(name = "topic_code", nullable = false)
    private String topicCode;

    @Column(name = "topic_name", nullable = false)
    private String topicName;

    @Column(name = "number_of_day")
    private int duration;

    @Column(name = "technical_group", length = 2048)
    private String technicalGroup;

    @Column(nullable = false)
    private String version;

    @Column(name = "training_audience")
    private int trainingAudience;

    @Column(name = "topic_outline")
    private String topicOutline;

    @Lob
    @Column(name = "training_principles")
    private String trainingPrinciples;

    @Column(name = "priority")
    private String priority;

    @Column(name = "publish_status")
    private String publishStatus;

    @ManyToOne(cascade = CascadeType.MERGE, optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "user_syllabus", referencedColumnName = "user_id")
    @JsonIgnore
    @JsonBackReference
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private User createdBy;

    @Column(name = "created_date")
    private LocalDate createdDate;

    @Column(name = "modified_by")
    private String modifiedBy;

    @Column(name = "modified_date")
    private LocalDate modifiedDate;

    @Column(name = "course_objective", length = 5000)
    private String courseObjective;
    @Column(name = "deleted")
    private boolean deleted = false;

    @Column(name = "assignment_lab")
    private String assignmentLab;
    @Column(name = "concept_lecture")
    private String conceptLecture;

    @Column(name = "guide_review")
    private String guideReview;

    @Column(name = "test_quiz")
    private String testQuiz;

    @Column(name = "exam")
    private String exam;

    @Column(name = "quiz")
    private String quiz;

    @Column(name = "assignment")
    private String assignment;

    @Column(name = "final")
    private String final_;

    @Column(name = "final_theory")
    private String finalTheory;

    @Column(name = "final_practice")
    private String finalPractice;

    @Column(name = "gpa")
    private String gpa;
}
