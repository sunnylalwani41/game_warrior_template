package com.gamewarrior.Game.Warrior.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.WithdrawRequestRepo;
import com.gamewarrior.Game.Warrior.model.WithdrawRequest;

@Service
public class WithdrawRequestServiceImpl implements WithdrawRequestService{
	@Autowired
	private WithdrawRequestRepo withdrawRequestRepo;

	@Override
	public WithdrawRequest saveWithdrawRequest(WithdrawRequest withdrawRequest) {
		return withdrawRequestRepo.save(withdrawRequest);
	}
	
}
