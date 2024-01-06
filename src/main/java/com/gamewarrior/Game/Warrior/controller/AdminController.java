package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamewarrior.Game.Warrior.model.Admin;
import com.gamewarrior.Game.Warrior.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@PostMapping("/verifyAdmin")
	public void verifyAdmin(HttpServletRequest request, HttpServletResponse response, @RequestParam String adminEmail, @RequestParam String adminPassword) throws IOException {
		HttpSession session = request.getSession();
		try {
			Admin admin = adminService.verifyAdmin(adminEmail, adminPassword);
			
			session.setAttribute("adminId", admin.getId());
			response.sendRedirect("adminDashboard");
		}
		catch(Exception exception) {
			session.setAttribute("errorMessage", exception.getMessage());
			response.sendRedirect("admin-login");
		}
	}
	
	@GetMapping("adminLogout")
	public void adminLogoutHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		adminService.logoutAdmin(request, response);
	}
}
