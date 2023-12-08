package com.gamewarrior.Game.Warrior.service;

import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.User;
import jakarta.servlet.http.HttpSession;

import javax.mail.MessagingException;

public interface AuthenticationService {
    public User saveUserDetail(User user, HttpSession session) throws UserException, MessagingException;
    public boolean verifyOtpValue(String otp, HttpSession session) throws OtpException, UserException, MessagingException;
}
