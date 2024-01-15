package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.model.UpiDetail;

public interface UpiDetailService {

	public List<UpiDetail> fetchAllUpiDetails();
	
	public UpiDetail fetchUpiDetailByUpiId(String upiId);
	
	public UpiDetail fetchUpiDetailById(Integer id) throws TransactionException;
	
	public Boolean deleteUpiById(Integer id);
	
	public void saveUpiDetail(UpiDetail upiDetail);
}
