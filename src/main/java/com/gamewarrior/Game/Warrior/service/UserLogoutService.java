package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface UserLogoutService {

	public void logout(HttpServletRequest request, HttpServletResponse response)throws IOException;
}
