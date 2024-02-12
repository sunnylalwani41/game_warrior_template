package com.gamewarrior.Game.Warrior.model;

import java.time.LocalDateTime;

import com.gamewarrior.Game.Warrior.dto.Status;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class WalletTransaction {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "walletTransactionSequence")
	@SequenceGenerator(name="walletTransactionSequence", sequenceName = "walletTransactionGen", initialValue = 50000, allocationSize = 1)
	private Integer id;
	private Double totalAmount;
	private Double amount;
	@Enumerated(EnumType.STRING)
	private Status status;
	private LocalDateTime localDateTime = LocalDateTime.now();
	private String remark;
}
