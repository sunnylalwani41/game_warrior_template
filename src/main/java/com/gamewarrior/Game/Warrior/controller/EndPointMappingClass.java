package com.gamewarrior.Game.Warrior.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class EndPointMappingClass {
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}

	@GetMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@GetMapping("/forgotpswd")
	public String forgotpswd() {
		return "forgotpswd";
	}
	
	@GetMapping("/otp")
	public String otp() {
		return "otp";
	}
	
	@GetMapping("/review")
	public String review() {
		return "review";
	}
	
	@GetMapping("/single-blog")
	public String single_blog() {
		return "single-blog";
	}
	
	@GetMapping("/termsandcondition")
	public String termsAndCondition() {
		return "terms-and-condition";
	}
	
	@GetMapping("/passbook")
	public String passbook() {
		return "passbook";
	}
	
	@GetMapping("/ids")
	public String ids() {
		return "ids";
	}
	
	@GetMapping("/fetchnotification")
	public String notification() {
		return "notification";
	}
	
	@GetMapping("/deposit")
	public String deposit() {
		return "deposit";
	}
	
	@GetMapping("/withdraw")
	public String withdraw() {
		return "withdraw";
	}
	
	@GetMapping("/forgot-otp")
	public String forgetOtp() {
		return "forgot-otp";
	}
	
	@GetMapping("/changePassword")
	public String changePassword() {
		return "change-password";
	}
	
	@GetMapping("/createId")
	public String createId(){
		return "create-id";
	}
	
	@GetMapping("/admin-login")
	public String adminLogin() {
		return "admin/admin-login";
	}
	
	@GetMapping("/adminDashboard")
	public String adminDashboard() {
		return "admin/admin-dashboard";
	}
	
	@GetMapping("/depositRequest")
	public String depositRequest() {
		return "admin/depositRequest";
	}
	
	@GetMapping("/createIdRequest")
	public String createIdRequest() {
		return "admin/createIdRequest";
	}
	
	@GetMapping("/updateGameWebsite")
	public String updateGameWebsite() {
		return "admin/updateGameWebsite";
	}
	
	@GetMapping("/updatePaymentMethod")
	public String updatePaymentMethod() {
		return "admin/updatePaymentMethod";
	}
	
	@GetMapping("/adminWithdrawRequest")
	public String adminWithdrawRequest() {
		return "admin/adminWithdrawRequest";
	}
	
	@GetMapping("/pendingRequest")
	public String pendingRequest() {
		return "pendingRequest";
	}
}