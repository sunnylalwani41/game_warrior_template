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
	
	@GetMapping("/categories")
	public String categories() {
		return "categories";
	}
	
	@GetMapping("/community")
	public String community() {
		return "community";
	}
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@GetMapping("/forgotpswd")
	public String forgotpswd() {
		return "forgotpswd";
	}
	
	@GetMapping("/home")
	public String home() {
		return "home";
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
}
