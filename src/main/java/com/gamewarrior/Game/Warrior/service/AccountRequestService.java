package com.gamewarrior.Game.Warrior.service;

import com.gamewarrior.Game.Warrior.exception.AccountRequestException;
import com.gamewarrior.Game.Warrior.model.AccountRequest;

public interface AccountRequestService {
	public AccountRequest takeRequestToCreateAccount(AccountRequest accountRequest);
	
	public AccountRequest getAccountRequestById(Integer id) throws AccountRequestException;
}
