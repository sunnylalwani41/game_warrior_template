package com.gamewarrior.Game.Warrior.service;

import java.io.IOException;
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Transaction;

import jakarta.servlet.http.HttpSession;

public interface TransactionService {
	public List<Transaction> fetchTransactionHistory(HttpSession session) throws TransactionException, UserException;

	public Transaction saveTransaction(Transaction transactionDetail) throws TransactionException, UserException;
	
	public Transaction moneyTransfer(Transaction transaction) throws TransactionException, UserException, JsonProcessingException, IOException;
}