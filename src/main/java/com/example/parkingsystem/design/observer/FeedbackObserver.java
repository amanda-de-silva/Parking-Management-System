package com.example.parkingsystem.service;

import com.example.parkingsystem.model.FeedBack;

import java.util.*;

public interface FeedbackObserver {
    void onFeedbackCreated(FeedBack feedBack);
    void onFeedbackUpdated(FeedBack feedBack);
    void onFeedbackResolved(FeedBack feedBack);
}

