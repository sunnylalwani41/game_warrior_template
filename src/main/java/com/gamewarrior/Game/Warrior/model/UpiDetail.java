package com.gamewarrior.Game.Warrior.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class UpiDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "upiGenerator")
	@SequenceGenerator(name="upiGenerator", sequenceName = "upiGen", allocationSize = 1, initialValue = 100000)
	private Integer id;
	private String displayName;
	private	String upiId;
	private String img;
	private LocalDateTime upiAddTimestamp=LocalDateTime.now();
}
