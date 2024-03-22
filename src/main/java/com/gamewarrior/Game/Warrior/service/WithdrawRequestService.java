package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import com.gamewarrior.Game.Warrior.exception.WithdrawRequestException;
import com.gamewarrior.Game.Warrior.model.WithdrawRequest;

public interface WithdrawRequestService {
	public WithdrawRequest saveWithdrawRequest(WithdrawRequest withdrawRequest);
	
	public List<WithdrawRequest> fetchAllWithdrawRequest();
	
	public WithdrawRequest fetchWithdrawRequestById(Integer id) throws WithdrawRequestException;
	
	public List<WithdrawRequest> fetchPendingWithdrawRequestByUserId(Integer userId);
}
