package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamewarrior.Game.Warrior.exception.NotificationException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Notification;
import com.gamewarrior.Game.Warrior.service.NotificationService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class FetchNotificationController {
	@Autowired
	private NotificationService notificationService;
	
	@GetMapping("/notification")
	public void fetchNotification(HttpServletResponse response, HttpServletRequest request) throws IOException, NotificationException, UserException, ServletException {
		HttpSession session = request.getSession();
		
		session.setAttribute("notification", "notification");
		try {
			List<Notification> notifications = notificationService.fetchAllNotificationOfTheUser(session);
			
			session.setAttribute("notificationDetails", notifications);
			response.sendRedirect("fetchnotification");
		} catch (UserException userException) {
			session.setAttribute("errorMessage", userException.getMessage());
			
			response.sendRedirect("/login");
		}
		catch(NotificationException notificationException) {
			session.setAttribute("errorMessage", notificationException.getMessage());
			response.sendRedirect("fetchnotification");
		}
	}
}