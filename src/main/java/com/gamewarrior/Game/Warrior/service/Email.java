package com.gamewarrior.Game.Warrior.service;

import javax.mail.MessagingException;

public interface Email {
    public String sendEmail(String to, String subject, String message) throws MessagingException;

    public String sendOtpEmail(String email)throws MessagingException;

    public String sendGreetingEmail(String email) throws MessagingException;
}
