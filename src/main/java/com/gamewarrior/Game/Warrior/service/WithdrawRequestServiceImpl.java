package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.WithdrawRequestRepo;
import com.gamewarrior.Game.Warrior.exception.WithdrawRequestException;
import com.gamewarrior.Game.Warrior.model.WithdrawRequest;

@Service
public class WithdrawRequestServiceImpl implements WithdrawRequestService{
	@Autowired
	private WithdrawRequestRepo withdrawRequestRepo;

	@Override
	public WithdrawRequest saveWithdrawRequest(WithdrawRequest withdrawRequest) {
		return withdrawRequestRepo.save(withdrawRequest);
	}

	@Override
	public List<WithdrawRequest> fetchAllWithdrawRequest() {
		return withdrawRequestRepo.findAll();
	}

	@Override
	public WithdrawRequest fetchWithdrawRequestById(Integer id) throws WithdrawRequestException {
		return withdrawRequestRepo.findById(id).orElseThrow(() -> new WithdrawRequestException("Something went wrong! Please contact to website owner"));
	}
	
}
