package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamewarrior.Game.Warrior.dao.UserRepo;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@GetMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		userService.logout(request, response);
	}
	
	@PostMapping("/forgotpassword")
	public void forgetPasswordHandler(@RequestParam String email, HttpServletRequest request, HttpServletResponse response) throws MessagingException, IOException {
		HttpSession session = request.getSession();
		
		try {
			userService.forgetPassword(email);
			
			session.setAttribute("forgotemail", email);
			
			response.sendRedirect("forgot-otp");
		}
		catch(UserException exception) {
			session.setAttribute("errorMessage", exception.getMessage());
			
			response.sendRedirect("registration");
		}
	}
	
	
	@PostMapping("/updatepassword")
	public void updatePasswordHandler(@RequestParam String password, @RequestParam String confirmPassword, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		if(!password.equals(confirmPassword)) {
			session.setAttribute("errorMessage", "Password does not match");
			System.out.println("Hi");
			response.sendRedirect("changePassword");
		}
		else {
			try {
				userService.updatePassword(password, session);
				
				session.setAttribute("message", "Greeting! Successfully reset/change your password. Please login");
				
				response.sendRedirect("login");
			} catch (Exception exception) {
				session.setAttribute("errorMessage", exception.getMessage());
				
				response.sendRedirect("registration");
			}
		}
	}
}
