package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.GameRepo;
import com.gamewarrior.Game.Warrior.dao.MyIdRepo;
import com.gamewarrior.Game.Warrior.exception.GameException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Game;
import com.gamewarrior.Game.Warrior.model.MyId;

import jakarta.servlet.http.HttpSession;

@Service
public class GameServiceImpl implements GameService{
	@Autowired
	private GameRepo gameRepo;
	@Autowired
	private MyIdRepo myIdRepo;

	@Override
	public List<Game> fetchAllGames() {
		return gameRepo.findAll();
	}

	@Override
	public List<MyId> fetchMyIds(HttpSession session) throws UserException {
		Integer userId= (Integer)session.getAttribute("userId");
		
		if(userId==null) {
			throw new UserException("Invalid User! please login.");
		}
		
		return myIdRepo.findByUserId(userId);
	}

	@Override
	public Game fetchGameById(Integer id) throws GameException {
		return gameRepo.findById(id).orElseThrow(()-> new GameException("Invalid Game"));
	}

}
