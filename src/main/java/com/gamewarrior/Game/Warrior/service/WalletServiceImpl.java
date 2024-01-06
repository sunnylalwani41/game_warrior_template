package com.gamewarrior.Game.Warrior.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.WalletRepo;
import com.gamewarrior.Game.Warrior.model.Wallet;

@Service
public class WalletServiceImpl implements WalletService{
	@Autowired
	private WalletRepo walletRepo;
	
	@Override
	public void saveWalletDetail(Wallet wallet) {
		walletRepo.save(wallet);
	}

}
