package com.gamewarrior.Game.Warrior.service;

import javax.mail.MessagingException;

import com.gamewarrior.Game.Warrior.model.User;

public interface EmailService {
    public String sendOtpEmail(String email)throws MessagingException;

    public void sendGreetingEmail(User user) throws MessagingException;

	void sendGreetingEmailForResetPassword(User user) throws MessagingException;

	void sendCustomMessage(String to, String subject, String message, User user) throws MessagingException;
}
