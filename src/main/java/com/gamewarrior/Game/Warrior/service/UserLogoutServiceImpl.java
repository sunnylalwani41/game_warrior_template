package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class UserLogoutServiceImpl implements UserLogoutService{

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

}
