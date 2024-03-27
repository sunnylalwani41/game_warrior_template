package com.gamewarrior.Game.Warrior.controller;

import com.gamewarrior.Game.Warrior.configure.SecurityConfig;
import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Referral;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.Wallet;
import com.gamewarrior.Game.Warrior.service.AuthenticationService;
import com.gamewarrior.Game.Warrior.service.EmailService;
import com.gamewarrior.Game.Warrior.service.ReferralCodeService;
import com.gamewarrior.Game.Warrior.service.UserService;

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
import java.security.SecureRandom;
import java.util.Map;

@Controller
public class AuthenticationController {
    @Autowired
    private EmailService email;
    @Autowired
    private AuthenticationService authenticationService;
    @Autowired
    private UserService userService;
    @Autowired
    private SecurityConfig securityConfig;
    @Autowired
    private ReferralCodeService referralService;
    
    private final String CHARACTER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private final int CODE_LENGTH = 8;

    @PostMapping("/sendAuthentication")
    public void sendEmailForAuthenticationHandler
            (@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email, @RequestParam(required = false) String referralCode, @RequestParam String mobile, @RequestParam String password, HttpSession session, HttpServletRequest
            	request, HttpServletResponse response) throws MessagingException, UserException, NoSuchAlgorithmException, IOException {
        User user = new User();
        
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setMobile(mobile);
        user.setVerify(false);
        user.setPassword(securityConfig.encryptPassword(password));
        user.setReferralCode(generateReferralCode());
        
        try {
        	user = authenticationService.saveUserDetail(user, session);
        	
        	if(referralCode!=null) {
            	try {
            		if(referralService.saveReferral(user.getId(), referralCode)) {
            			session.setAttribute("referralMessage", "Referral code is successfully applied, please enter the otp to complete the process.");
            		}
            		else {
            			session.setAttribute("errorMessage", "Referral code is not applied! Please try again.");
            		}
            	}
            	catch (Exception exception) {
					session.setAttribute("errorMessage", exception.getMessage());
				}
            }
        	session.setAttribute("email", user.getEmail());
            session.setAttribute("message", "OTP has been sent to email "+user.getEmail());
            
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
    		
    		userService.checkReferral(session);
    		
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
    	System.out.println(password);
    	return securityConfig.encryptPassword(password);
    }
    
    private String generateReferralCode() {
    	SecureRandom random = new SecureRandom();
    	StringBuilder referralCode = new StringBuilder(CODE_LENGTH);
    	
    	for(int i=0; i<CODE_LENGTH; i++) {
    		int index = random.nextInt(CHARACTER.length());
    		
    		referralCode.append(CHARACTER.charAt(index));
    	}
    	return referralCode.toString();
    }
}