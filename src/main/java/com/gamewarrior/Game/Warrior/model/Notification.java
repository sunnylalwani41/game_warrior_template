package com.gamewarrior.Game.Warrior.model;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class Notification {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "notificationGenerator")
	@SequenceGenerator(name= "notificationGenerator", sequenceName = "notifGen", allocationSize = 1, initialValue = 20000)
	private Integer Id;
	private String subject;
	private String message;
	private LocalDateTime timestamp= LocalDateTime.now();
	@JsonIgnore
	@ManyToOne
	private User user;
}