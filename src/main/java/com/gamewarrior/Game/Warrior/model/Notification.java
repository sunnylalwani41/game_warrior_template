package com.gamewarrior.Game.Warrior.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;

@Entity
public class Notification {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "notificationGenerator")
	@SequenceGenerator(name= "notificationGenerator", sequenceName = "notifGen", allocationSize = 1, initialValue = 20000)
	private Integer Id;
	private String subject;
	private String message;
	@JsonIgnore
	@ManyToOne
	private User user;
}
