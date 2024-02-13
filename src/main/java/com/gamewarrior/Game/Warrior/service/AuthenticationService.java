package com.gamewarrior.Game.Warrior.service;

import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.exception.WalletException;
import com.gamewarrior.Game.Warrior.model.User;
import jakarta.servlet.http.HttpSession;

import javax.mail.MessagingException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

public interface AuthenticationService {
    public User saveUserDetail(User user, HttpSession session) throws UserException, MessagingException;
    
    public String verifyOtpValue(String otp, HttpSession session) throws OtpException, UserException, MessagingException;
    
    public String verifyForgetOtpValue(String otp, HttpSession session) throws OtpException, UserException, MessagingException;
    
    public User matchUserCrediential(String email, String password, HttpSession session) throws UserException, NoSuchAlgorithmException, WalletException;
}
