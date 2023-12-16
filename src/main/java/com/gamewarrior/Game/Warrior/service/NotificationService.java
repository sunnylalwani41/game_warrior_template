package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import com.gamewarrior.Game.Warrior.exception.NotificationException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Notification;

import jakarta.servlet.http.HttpSession;

public interface NotificationService {
	public List<Notification> fetchAllNotificationOfTheUser(HttpSession session)throws NotificationException, UserException;

}
