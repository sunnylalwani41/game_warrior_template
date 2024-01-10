package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.DepositRequestRepo;
import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.model.DepositRequest;

@Service
public class DepositRequestServiceImpl implements DepositRequestService{
	@Autowired
	private DepositRequestRepo depositRequestRepo;

	@Override
	public void takeDepositRequest(DepositRequest depositRequest) {
		depositRequestRepo.save(depositRequest);
	}

	@Override
	public List<DepositRequest> fetchAllDepositRequest() {
		return depositRequestRepo.findAll();
	}

	@Override
	public DepositRequest fetchById(Integer id) throws TransactionException {
		return depositRequestRepo.findById(id).orElseThrow(()-> new TransactionException("Invalid Deposit Request id"));
	}

}
