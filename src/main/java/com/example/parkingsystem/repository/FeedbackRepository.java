package com.example.parkingsystem.repository;


import com.example.parkingsystem.model.FeedBack;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedbackRepository extends JpaRepository<FeedBack, Long> {
    List<FeedBack> findAllByOrderByCreatedAtAsc();
    List<FeedBack> findByCategoryOrderByCreatedAtAsc(FeedBack.Category category);
    List<FeedBack> findByStatusOrderByCreatedAtAsc(FeedBack.Status status);
}
