package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.model.DepositRequest;

public interface DepositRequestService {
	public void takeDepositRequest(DepositRequest depositRequest);

	public List<DepositRequest> fetchAllDepositRequest();
	
	public DepositRequest fetchById(Integer id) throws TransactionException;
	
	public List<DepositRequest> fetchPendingDepositRequestByUserId(Integer userId);
}
