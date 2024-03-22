package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.MyIdRepo;
import com.gamewarrior.Game.Warrior.exception.MyIdException;
import com.gamewarrior.Game.Warrior.model.MyId;
@Service
public class MyIdServiceImpl implements MyIdService{
	@Autowired
	private MyIdRepo myIdRepo;

	@Override
	public void saveMyId(MyId myId) {
		myIdRepo.save(myId);
	}

	@Override
	public List<MyId> fetchAllCreateIdRequest(Boolean status) {
		return myIdRepo.findByStatus(status);
	}

	@Override
	public MyId fetchMyIdById(Integer id) throws MyIdException {
		return myIdRepo.findById(id).orElseThrow(()-> new MyIdException("Something went wrong"));
	}

	@Override
	public List<MyId> fetchAllMyIdByPerticularUserId(Integer userId) {
		return myIdRepo.findByUserId(userId);
	}

	@Override
	public List<MyId> pendingRequestofMyIdForPerticularUserId(Integer id) {
		return myIdRepo.findByUserIdAndStatus(id, false);
	}

}
