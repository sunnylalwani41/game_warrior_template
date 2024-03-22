package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import com.gamewarrior.Game.Warrior.exception.MyIdException;
import com.gamewarrior.Game.Warrior.model.MyId;

public interface MyIdService {
	public void saveMyId(MyId myId);
	
	public List<MyId> fetchAllCreateIdRequest(Boolean status);

	public MyId fetchMyIdById(Integer id) throws MyIdException;
	
	public List<MyId> fetchAllMyIdByPerticularUserId(Integer userId);
	
	public List<MyId> pendingRequestofMyIdForPerticularUserId(Integer id);
}
