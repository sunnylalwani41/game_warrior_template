package com.gamewarrior.Game.Warrior.service;

import com.gamewarrior.Game.Warrior.dto.Status;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.exception.WalletException;
import com.gamewarrior.Game.Warrior.model.Wallet;

import jakarta.servlet.http.HttpSession;

public interface WalletService {
	public Wallet getWalletByUserId(Integer userId) throws WalletException, UserException;
	
	public boolean walletAmountDeduction(Double amount, Integer userId, HttpSession session, String remark) throws WalletException, UserException;
	
	public boolean walletAmountAddition(Double amount, Integer userId, HttpSession session, String remark) throws WalletException, UserException;
	
	public Wallet updateWallet(Wallet wallet) throws WalletException;
	
	public boolean generalWalletAmountDeduction(Double amount, Integer userId, HttpSession session, String remark) throws WalletException, UserException;
	
	public boolean withdrawableWalletAmountDeduction(Double amount, Integer userId, HttpSession session, String remark) throws WalletException, UserException;
	
	public void setSessionOfTheWallet(Wallet wallet, HttpSession session) throws WalletException;
	
	public void addTransactionDetailInWallet(Wallet wallet, Double amount, Status status, String remark);
	
	public Double totalAmountOfWallet(Integer userId) throws WalletException, UserException;
}
