package com.gamewarrior.Game.Warrior.controller;

import com.gamewarrior.Game.Warrior.configure.SecurityConfig;
import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.Wallet;
import com.gamewarrior.Game.Warrior.service.AuthenticationService;
import com.gamewarrior.Game.Warrior.service.EmailService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

@Controller
public class AuthenticationController {
    @Autowired
    private EmailService email;

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private SecurityConfig securityConfig;

    @PostMapping("/sendAuthentication")
    public void sendEmailForAuthenticationHandler
            (@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email, @RequestParam String password, HttpSession session, HttpServletRequest
            	request, HttpServletResponse response) throws MessagingException, UserException, NoSuchAlgorithmException, IOException {
        User user = new User();
        
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setVerify(false);
        user.setPassword(securityConfig.encryptPassword(password));

        try {
        	authenticationService.saveUserDetail(user, session);
        	
        	response.sendRedirect("otp");
        }
        catch(Exception exception) {
        	session.setAttribute("errorMessage", exception.getMessage());
        	response.sendRedirect("login");
        }
    }
    
    @PostMapping("/verifyOtp")
    public void matchOtpHandler(@RequestParam String otp, HttpServletResponse response, HttpServletRequest request) throws OtpException, MessagingException, UserException, ServletException, IOException {
    	HttpSession session = request.getSession();
    	try {
    		authenticationService.verifyOtpValue(otp, session);
    		
    		session.setAttribute("message", "Greeting! Verified Successfully. Please login");
    		
    		response.sendRedirect("login");
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
			session.setAttribute("errorMessage", exception.getMessage());
			
			response.sendRedirect("otp");
		}
    }
    
    @PostMapping("/forgotOtp")
    public void matchForgetOtpHandler(@RequestParam String otp, HttpServletResponse response, HttpServletRequest request) throws OtpException, MessagingException, UserException, ServletException, IOException {
    	HttpSession session = request.getSession();
    	try {
    		authenticationService.verifyForgetOtpValue(otp, session);
    		
    		response.sendRedirect("changePassword");
		} catch (Exception exception) {
			session.setAttribute("errorMessage", exception.getMessage());
			
			response.sendRedirect("forgot-otp");
		}
    }

    @PostMapping("/verifyUser")
    public void verifyUserHandler(@RequestParam String email, @RequestParam String password, HttpServletResponse response, HttpServletRequest request) throws UserException, NoSuchAlgorithmException, IOException {
    	HttpSession session = request.getSession();
    	
    	try {
    		authenticationService.matchUserCrediential(email, password, session);
    		
    		response.sendRedirect("/");
		} catch (Exception exception) {
			session.setAttribute("errorMessage", exception.getMessage());
			
			response.sendRedirect("login");
		}
    }
    
    @GetMapping("/getencriptpassword/{password}")
    @ResponseBody
    public String ecriptPassword(@PathVariable String password) throws NoSuchAlgorithmException {
    	return securityConfig.encryptPassword(password);
    }
}