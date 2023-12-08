package com.gamewarrior.Game.Warrior.configure;

import org.springframework.stereotype.Component;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

@Component
public class SecurityConfig {

    public String encryptPassword(String password) throws NoSuchAlgorithmException {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashedBytes);
    }

    public boolean checkPassword(String enteredPassword, String storedPassword) throws NoSuchAlgorithmException {
        String hashedEnteredPassword = encryptPassword(enteredPassword);
        return hashedEnteredPassword.equals(storedPassword);
    }
}
