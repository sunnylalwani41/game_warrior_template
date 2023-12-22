package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.mail.MessagingException;

import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface UserService {
	public void logout(HttpServletRequest request, HttpServletResponse response)throws IOException;
	
	public void forgetPassword(String email)throws UserException, MessagingException;

	public void updatePassword(String password, HttpSession session)throws UserException, NoSuchAlgorithmException, MessagingException;

	public void resentOtp(String userEmail) throws MessagingException;

	public User fetchProfile(Integer userId) throws UserException;
}
