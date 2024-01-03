package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.configure.SecurityConfig;
import com.gamewarrior.Game.Warrior.dao.UserRepo;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Notification;
import com.gamewarrior.Game.Warrior.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private SecurityConfig securityConfig;

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		
		if(session.getAttribute("userId")==null) {
			response.sendRedirect("login");
		}
		else {
			session.removeAttribute("userId");
			session.removeAttribute("balance");
			session.invalidate();
			
			response.sendRedirect("/");
		}
	}

	@Override
	public void forgetPassword(String email) throws UserException, MessagingException {
		User user = userRepo.findByEmail(email);
		
		if(user==null) {
			throw new UserException("Invalid user!! please register.");
		}
		String otp= emailService.sendOtpEmail(email);
		Notification notification = new Notification();
		
		user.setOtp(otp);
		user.setTimestamp(LocalDateTime.now());
		notification.setUser(user);
        notification.setSubject("Validation Otp");
        notification.setMessage("OTP has been sent to email "+user.getEmail());
        
        user.getNotifications().add(notification);
		
        userRepo.save(user);
	}

	@Override
	public void updatePassword(String password, HttpSession session) throws UserException, NoSuchAlgorithmException, MessagingException {
		String userEmail = String.valueOf(session.getAttribute("forgotemail"));
		
		if(userEmail==null) {
			throw new UserException("Invalid user!! please register.");
		}
		User user = userRepo.findByEmail(userEmail);
		
		if(user==null) {
			throw new UserException("Unauthorized user!!");
		}
		user.setPassword(securityConfig.encryptPassword(password));
		
		emailService.sendGreetingEmailForResetPassword(user);
		
		userRepo.save(user);
		
		session.removeAttribute("forgotemail");
		session.removeAttribute("verifiedOtp");
	}

	@Override
	public void resentOtp(String userEmail) throws MessagingException {
		String otp = emailService.sendOtpEmail(userEmail);
		User user = userRepo.findByEmail(userEmail);
		
		user.setOtp(otp);
		user.setTimestamp(LocalDateTime.now());
		
		userRepo.save(user);
	}

	@Override
	public User fetchProfile(Integer userId) throws UserException {
		return userRepo.findById(userId).orElseThrow(() -> new UserException("Invalid User!!"));
	}

	@Override
	public void saveUserDetail(User user) {
		userRepo.save(user);
	}

}
