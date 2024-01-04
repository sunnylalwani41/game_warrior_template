package com.gamewarrior.Game.Warrior.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class Wallet {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "walletGenerator")
	@SequenceGenerator(name = "walletGenerator", sequenceName = "walletGen", allocationSize = 1, initialValue = 10000)
	private Integer id;
	private Integer balance;
	@JsonIgnore
	@OneToOne(cascade = CascadeType.ALL)
	private User user;
}
