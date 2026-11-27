package com.example.parkingsystem.service;

import com.example.parkingsystem.model.FeedBack;
import com.example.parkingsystem.repository.FeedbackRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class FeedBackService {
    @Autowired
    private FeedbackRepository feedbackRepository;

    @Value("${file.upload-dir:uploads}")
    private String uploadDir;

    // Observer pattern implementation
    private List<com.example.parkingsystem.service.FeedbackObserver> observers = new ArrayList<>();

    public void addObserver(com.example.parkingsystem.service.FeedbackObserver observer) {
        observers.add(observer);
    }

    public void removeObserver(com.example.parkingsystem.service.FeedbackObserver observer) {
        observers.remove(observer);
    }

    private void notifyObserversCreated(FeedBack feedBack) {
        observers.forEach(obs -> obs.onFeedbackCreated(feedBack));
    }

    private void notifyObserversUpdated(FeedBack feedBack) {
        observers.forEach(obs -> obs.onFeedbackUpdated(feedBack));
    }

    private void notifyObserversResolved(FeedBack feedBack) {
        observers.forEach(obs -> obs.onFeedbackResolved(feedBack));
    }

    public List<FeedBack> getAllFeedbacks() {
        return feedbackRepository.findAllByOrderByCreatedAtAsc();
    }

    public Optional<FeedBack> getFeedbackById(Long id) {
        return feedbackRepository.findById(id);
    }

    public FeedBack createFeedback(FeedBack feedBack, MultipartFile file) throws IOException {
        if (file != null && !file.isEmpty()) {
            String fileName = saveFile(file);
            feedBack.setDocumentPath(fileName);
        }
        FeedBack savedFeedback = feedbackRepository.save(feedBack);
        notifyObserversCreated(savedFeedback);
        return savedFeedback;
    }

    public FeedBack updateFeedback(Long id, FeedBack feedBackDetails, MultipartFile file) throws IOException {
        FeedBack feedBack = feedbackRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Feedback not found with id: " + id));

        feedBack.setCustomerName(feedBackDetails.getCustomerName());
        feedBack.setContactNumber(feedBackDetails.getContactNumber());
        feedBack.setEmail(feedBackDetails.getEmail());
        feedBack.setSubject(feedBackDetails.getSubject());
        feedBack.setConcern(feedBackDetails.getConcern());
        feedBack.setCategory(feedBackDetails.getCategory());
        feedBack.setStatus(feedBackDetails.getStatus());

        if (file != null && !file.isEmpty()) {
            if (feedBack.getDocumentPath() != null) {
                deleteFile(feedBack.getDocumentPath());
            }
            String fileName = saveFile(file);
            feedBack.setDocumentPath(fileName);
        }

        FeedBack updatedFeedback = feedbackRepository.save(feedBack);
        notifyObserversUpdated(updatedFeedback);
        return updatedFeedback;
    }

    public void deleteFeedback(Long id) {
        FeedBack feedBack = feedbackRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Feedback not found with id: " + id));

        if (feedBack.getDocumentPath() != null) {
            deleteFile(feedBack.getDocumentPath());
        }

        feedbackRepository.delete(feedBack);
    }

    public FeedBack markAsSolved(Long id) {
        FeedBack feedBack = feedbackRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Feedback not found with id: " + id));
        feedBack.setStatus(FeedBack.Status.SOLVED);
        FeedBack resolvedFeedback = feedbackRepository.save(feedBack);
        notifyObserversResolved(resolvedFeedback);
        return resolvedFeedback;
    }

    private String saveFile(MultipartFile file) throws IOException {
        File uploadDirectory = new File(uploadDir);
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdirs();
        }

        String originalFileName = file.getOriginalFilename();
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        String fileName = UUID.randomUUID().toString() + extension;

        Path filePath = Paths.get(uploadDir, fileName);
        Files.write(filePath, file.getBytes());

        return fileName;
    }

    private void deleteFile(String fileName) {
        try {
            Path filePath = Paths.get(uploadDir, fileName);
            Files.deleteIfExists(filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}