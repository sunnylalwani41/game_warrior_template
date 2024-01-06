package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import com.gamewarrior.Game.Warrior.exception.AdminException;
import com.gamewarrior.Game.Warrior.model.Admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface AdminService {
	public Admin verifyAdmin(String username, String password) throws AdminException, NoSuchAlgorithmException;
	
	public void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
