package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.UpiDetailRepo;
import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.model.UpiDetail;

import jakarta.transaction.TransactionalException;

@Service
public class UpiDetailServiceImpl implements UpiDetailService {
	@Autowired
	private UpiDetailRepo upiDetailRepo;

	@Override
	public List<UpiDetail> fetchAllUpiDetails() {
		return upiDetailRepo.findAll();
	}

	@Override
	public UpiDetail fetchUpiDetailByUpiId(String upiId) {
		return upiDetailRepo.findByUpiId(upiId);
	}

	@Override
	public UpiDetail fetchUpiDetailById(Integer id) throws TransactionException {
		return upiDetailRepo.findById(id).orElseThrow(()-> new TransactionException("Invalid Upi id"));
	}

}
