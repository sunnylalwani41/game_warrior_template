package com.gamewarrior.Game.Warrior.service;

import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.GameRepo;
import com.gamewarrior.Game.Warrior.dao.MyIdRepo;
import com.gamewarrior.Game.Warrior.exception.GameException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.exception.WalletException;
import com.gamewarrior.Game.Warrior.model.AccountRequest;
import com.gamewarrior.Game.Warrior.model.Game;
import com.gamewarrior.Game.Warrior.model.MyId;
import com.gamewarrior.Game.Warrior.model.Notification;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.Wallet;

import jakarta.servlet.http.HttpSession;

@Service
public class GameServiceImpl implements GameService{
	@Autowired
	private GameRepo gameRepo;
	@Autowired
	private MyIdService myIdService;
	@Autowired
	private AccountRequestService accountRequestService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private UserService userService;
	@Autowired
	private WalletService walletService;

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
		return myIdService.fetchAllMyIdByPerticularUserId(userId);
	}

	@Override
	public Game fetchGameById(Integer id) throws GameException {
		return gameRepo.findById(id).orElseThrow(()-> new GameException("Invalid Game"));
	}

	@Override
	public void createIdRequest(Integer userId, Integer gameId, String username, Double amount, HttpSession session) throws GameException, UserException, MessagingException, WalletException {
		Game game= fetchGameById(gameId);
		
		if(userId==null) {
			throw new UserException("Invalid User!, please login");
		}
		else {
			if(amount>=game.getMinimumBet() && amount<=walletService.totalAmountOfWallet(userId)) {
				if(walletService.walletAmountDeduction(amount, userId, session, "Create Id amount deducted")) {
					AccountRequest accountRequest = new AccountRequest();
					MyId myId = new MyId();
					
					accountRequest.setAmount(amount);
					accountRequest.setMinimumBet(game.getMinimumBet());
					accountRequest.setProposalUsername(username);
					accountRequest.setUserId(userId);
					accountRequest.setWebsite(game.getWebsite());
					accountRequest.setWebsiteName(game.getWebsiteName());
					accountRequest.setLogo(game.getLogo());
					
					myId.setLogo(game.getLogo());
					myId.setPassword(null);
					myId.setUserId(userId);
					myId.setUsername(null);
					myId.setWebsite(game.getWebsite());
					myId.setWebsiteName(game.getWebsiteName());
					
					accountRequest= accountRequestService.takeRequestToCreateAccount(accountRequest);
					
					myId.setAccountRequestId(accountRequest.getId());
					
					myIdService.saveMyId(myId);
					
					String subject = "Your service request number is "+ accountRequest.getId();
					String message = "Your service request number is "+ accountRequest.getId()+".\nIt will be process within 2 days.";
					
					User user = userService.fetchProfile(userId);
					
					emailService.sendCustomMessage(user.getEmail(), subject, message, user);
					
					//send the message to admin
				}
				else {
					throw new GameException("Something went wrong. Please contact to admin.");
				}
			}
			else {
				throw new GameException("Invalid Amount, Please enter valid amount");
			}
		}	
	}

	@Override
	public void saveGame(Game game) {
		gameRepo.save(game);
	}

	@Override
	public boolean deleteTheGameById(Integer id) {
		Optional<Game> option= gameRepo.findById(id);
		
		if(!option.isPresent())
			return false;
		
		Game game= option.get();
		
		gameRepo.delete(game);
		
		return true;
	}

}
