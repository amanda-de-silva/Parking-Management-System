package com.example.parkingsystem.design.observer;

import com.example.parkingsystem.model.FeedBack;
import com.example.parkingsystem.service.FeedbackObserver;

public class FeedbackNotificationObserver implements FeedbackObserver {
    @Override
    public void onFeedbackCreated(FeedBack feedBack) {
        // Dummy implementation - send notification
        System.out.println("[OBSERVER] Feedback created: " + feedBack.getId());
    }

    @Override
    public void onFeedbackUpdated(FeedBack feedBack) {
        System.out.println("[OBSERVER] Feedback updated: " + feedBack.getId());
    }

    @Override
    public void onFeedbackResolved(FeedBack feedBack) {
        System.out.println("[OBSERVER] Feedback resolved: " + feedBack.getId());
    }
}