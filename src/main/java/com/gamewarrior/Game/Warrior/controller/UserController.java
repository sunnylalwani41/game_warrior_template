package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamewarrior.Game.Warrior.dao.UserRepo;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.DepositRequest;
import com.gamewarrior.Game.Warrior.model.Message;
import com.gamewarrior.Game.Warrior.model.MyId;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.WithdrawRequest;
import com.gamewarrior.Game.Warrior.service.ClientService;
import com.gamewarrior.Game.Warrior.service.DepositRequestService;
import com.gamewarrior.Game.Warrior.service.MyIdService;
import com.gamewarrior.Game.Warrior.service.UserService;
import com.gamewarrior.Game.Warrior.service.WithdrawRequestService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private MyIdService myIdService;
	@Autowired
	private DepositRequestService depositRequestService;
	@Autowired
	private WithdrawRequestService withdrawRequestService;

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
	
	@GetMapping("/resentOtp")
	public void resentOtpHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String userEmail = (String)session.getAttribute("email");
		
		if(userEmail==null) {
			session.setAttribute("errorMessage", "Unauthorized user!!");
			
			response.sendRedirect("/registration");
		}
		else {
			try {
				userService.resentOtp(userEmail);
				
				session.setAttribute("message", "Otp resent successfully");
			} catch (Exception e) {
				session.setAttribute("errorMessage", "Something went wrong!!");
			}
			response.sendRedirect("otp");
		}
	}
	
	@GetMapping("/resentForgetOtp")
	public void resentForgetOtpHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String userEmail = (String)session.getAttribute("forgotemail");

		if(userEmail==null) {
			session.setAttribute("errorMessage", "Unauthorized user!!");
			
			response.sendRedirect("/registration");
		}
		else {
			try {
				userService.resentOtp(userEmail);
				
				session.setAttribute("message", "Otp resent successfully");
			} catch (Exception e) {
				session.setAttribute("errorMessage", "Something went wrong!!");
			}
			response.sendRedirect("forgot-otp");
		}
	}
	
	@GetMapping("/fetchProfile")
	public void fetchProfileDataHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Integer userId= (Integer)session.getAttribute("userId");
		
		try {
			User user = userService.fetchProfile(userId);
			
			request.setAttribute("email", user.getEmail());
			request.setAttribute("name", user.getFirstName()+" "+user.getLastName());
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile");
			
			requestDispatcher.include(request, response);
		} catch (Exception exception) {
			session.setAttribute("errorMessage", exception.getMessage());
			
			response.sendRedirect("login");
		}
	}
	
    @GetMapping("/fetchPendingRequest")
    public void fetchPendingRequestHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	HttpSession session = request.getSession();
    	Integer userId = (Integer)session.getAttribute("userId");
    	
    	List<MyId> pendingMyIds= myIdService.pendingRequestofMyIdForPerticularUserId(userId);
    	List<DepositRequest> pendingDepositRequests = depositRequestService.fetchPendingDepositRequestByUserId(userId);
    	List<WithdrawRequest> pendingWithdrawRequests = withdrawRequestService.fetchPendingWithdrawRequestByUserId(userId);
    	
    	session.setAttribute("pendingMyIds", pendingMyIds);
    	session.setAttribute("pendingDepositRequests", pendingDepositRequests);
    	session.setAttribute("pendingWithdrawRequests", pendingWithdrawRequests);
    	
    	response.sendRedirect("/pendingRequest");
    }
}
