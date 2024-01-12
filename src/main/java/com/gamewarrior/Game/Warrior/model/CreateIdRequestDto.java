package com.gamewarrior.Game.Warrior.model;

import jakarta.persistence.Column;
import lombok.Data;

@Data
public class CreateIdRequestDto {
	private Integer id;
	private String website;
	private String websiteName;
	private String logo;
	private String expectedUsername;
	private Integer amount;
}
