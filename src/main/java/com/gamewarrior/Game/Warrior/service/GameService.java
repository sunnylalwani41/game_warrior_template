package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import javax.mail.MessagingException;

import com.gamewarrior.Game.Warrior.exception.GameException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.exception.WalletException;
import com.gamewarrior.Game.Warrior.model.Game;
import com.gamewarrior.Game.Warrior.model.MyId;

import jakarta.servlet.http.HttpSession;

public interface GameService {
	public List<Game> fetchAllGames();
	
	public List<MyId> fetchMyIds(HttpSession session) throws UserException;
	
	public Game fetchGameById(Integer id)throws GameException;
	
	public void createIdRequest(Integer userId, Integer gameId, String username, Double amount, HttpSession session) throws GameException, UserException, MessagingException, WalletException;
	
	public void saveGame(Game game);
	
	public boolean deleteTheGameById(Integer id);
}
