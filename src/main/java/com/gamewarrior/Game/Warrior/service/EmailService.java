package com.gamewarrior.Game.Warrior.service;

import javax.mail.MessagingException;

import com.gamewarrior.Game.Warrior.model.User;

public interface EmailService {
    public void sendEmail(String to, String subject, String message) throws MessagingException;

    public String sendOtpEmail(String email)throws MessagingException;

    public void sendGreetingEmail(User user) throws MessagingException;
}
