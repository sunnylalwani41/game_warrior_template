package com.gamewarrior.Game.Warrior.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Entity
public class AccountRequest {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "accountRequestGenerator")
	@SequenceGenerator(name= "accountRequestGenerator", sequenceName = "accountRequestGen", initialValue = 50000, allocationSize = 1)
	private Integer id;
	private Integer userId;
	private String proposalUsername;
	private Double amount;
	private String website;
	private String websiteName;
	private Integer minimumBet;
	private String logo;
}
