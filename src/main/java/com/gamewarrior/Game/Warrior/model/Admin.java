package com.gamewarrior.Game.Warrior.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class Admin {
	@Id
	@GeneratedValue(strategy= GenerationType.SEQUENCE, generator = "adminGenerator")
	@SequenceGenerator(name= "adminGenerator", sequenceName = "adminGen", initialValue = 800000, allocationSize = 1)
	private Integer id;
	private String name;
	private String username;
	private String password;
}
