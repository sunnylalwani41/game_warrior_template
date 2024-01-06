package com.gamewarrior.Game.Warrior.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.MyIdRepo;
import com.gamewarrior.Game.Warrior.model.MyId;
@Service
public class MyIdServiceImpl implements MyIdService{
	@Autowired
	private MyIdRepo myIdRepo;

	@Override
	public void saveMyId(MyId myId) {
		myIdRepo.save(myId);
	}

}
