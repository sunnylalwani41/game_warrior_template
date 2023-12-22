package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.UpiDetailRepo;
import com.gamewarrior.Game.Warrior.model.UpiDetail;

@Service
public class UpiDetailServiceImpl implements UpiDetailService {
	@Autowired
	private UpiDetailRepo upiDetailRepo;

	@Override
	public List<UpiDetail> fetchAllUpiDetails() {
		return upiDetailRepo.findAll();
	}

}
