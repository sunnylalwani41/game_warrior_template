package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.configure.SecurityConfig;
import com.gamewarrior.Game.Warrior.dao.AdminRepo;
import com.gamewarrior.Game.Warrior.exception.AdminException;
import com.gamewarrior.Game.Warrior.model.Admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminRepo adminRepo;
	@Autowired
	private SecurityConfig securityConfig;
	
	@Override
	public Admin verifyAdmin(String username, String password) throws AdminException, NoSuchAlgorithmException {
		Admin admin = adminRepo.findByUsername(username);
		
		if(admin==null || !securityConfig.checkPassword(password, admin.getPassword())) {
		
			throw new AdminException("Invalid username or password. Please enter the correct username and password");
		}
		
		return admin;
	}

	@Override
	public void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		
		if(session.getAttribute("adminId")==null) {
			response.sendRedirect("admin-login");
		}
		else {
			session.removeAttribute("adminId");
			session.invalidate();
			
			response.sendRedirect("/");
		}
	}

}
