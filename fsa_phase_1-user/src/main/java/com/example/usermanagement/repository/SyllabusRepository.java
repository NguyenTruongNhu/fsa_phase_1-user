package com.example.usermanagement.repository;

import com.example.usermanagement.entity.Syllabus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SyllabusRepository extends JpaRepository<Syllabus, String> {
    @Query("SELECT s FROM Syllabus s where s.topicCode = :topicCode")
    Syllabus getSyllabusByTopicCode(String topicCode);
}
