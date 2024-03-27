package com.gamewarrior.Game.Warrior.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class Referral {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "referralGenerator")
	@SequenceGenerator(name="referralGenerator", sequenceName = "referralGen", allocationSize = 1, initialValue = 100)
	private Integer id;
	private Integer referrerUserId;
	@Column(unique = true)
	private Integer referralUserId;
}
