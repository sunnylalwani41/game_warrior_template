package com.gamewarrior.Game.Warrior.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class Wallet {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "walletGenerator")
	@SequenceGenerator(name = "walletGenerator", sequenceName = "walletGen", allocationSize = 1, initialValue = 10000)
	private Integer id;
	private Double generalWallet;
	private Double withdrawableWallet;
	@Column(unique = true)
	private Integer userId;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	List<WalletTransaction> walletTransactions = new ArrayList<>();
}
