package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.BankingTransaction;

import jakarta.servlet.http.HttpSession;

public interface WithdrawalTransactionService {
	public List<BankingTransaction> fetchTransactionHistory(HttpSession session) throws TransactionException, UserException;

	public BankingTransaction saveTransaction(BankingTransaction transactionDetail) throws TransactionException, UserException;
	
	public String uploadFile(MultipartFile file,Integer upiId, Integer userId) throws IOException;
	
	public BankingTransaction moneyTransfer(BankingTransaction transaction) throws TransactionException, UserException, JsonProcessingException, IOException;
	
	public boolean isUniqueUTR(String utr);
}