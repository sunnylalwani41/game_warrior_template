package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.NotificationRepo;
import com.gamewarrior.Game.Warrior.dao.UserRepo;
import com.gamewarrior.Game.Warrior.exception.NotificationException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Notification;
import com.gamewarrior.Game.Warrior.model.User;

import jakarta.servlet.http.HttpSession;
@Service
public class NotificationServiceImpl implements NotificationService{
	@Autowired
	private UserRepo userRepo;
	@Autowired
	private NotificationRepo notificationRepo;

	@Override
	public List<Notification> fetchAllNotificationOfTheUser(HttpSession session) throws NotificationException, UserException {
		Integer userId= (Integer)session.getAttribute("userId");
		
		if(userId==null) {
			throw new UserException("Invalid user!! Please login first");
		}
		
		List<Notification> notifications = userRepo.findById(userId).orElseThrow(()-> new UserException("Unauthorized user!!")).getNotifications();
		if(notifications.isEmpty())
			throw new NotificationException("Notification not found");
		
		return notifications;
	}

	@Override
	public void saveNotification(String subject, String message, User user) {
		Notification notification = new Notification();
		
		notification.setSubject(subject);
		notification.setMessage(message);
		notification.setUser(user);
		
		user.getNotifications().add(notification);
		
		notificationRepo.save(notification);
	}
}
