package com.gamewarrior.Game.Warrior.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.AccountRequestRepo;
import com.gamewarrior.Game.Warrior.model.AccountRequest;

@Service
public class AccountRequestServiceImpl implements AccountRequestService{
	@Autowired
	private AccountRequestRepo accountRequestRepo;
	
	@Override
	public AccountRequest takeRequestToCreateAccount(AccountRequest accountRequest) {
		return accountRequestRepo.save(accountRequest);
	}
}
