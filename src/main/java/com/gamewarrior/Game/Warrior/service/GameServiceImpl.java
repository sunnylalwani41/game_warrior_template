package com.gamewarrior.Game.Warrior.service;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.GameRepo;
import com.gamewarrior.Game.Warrior.dao.MyIdRepo;
import com.gamewarrior.Game.Warrior.exception.GameException;
import com.gamewarrior.Game.Warrior.exception.UserException;
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
	private MyIdRepo myIdRepo;
	@Autowired
	private UserService userService;
	@Autowired
	private MyIdService myIdService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private AccountRequestService accountRequestService;
	@Autowired
	private EmailService emailService;

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

	@Override
	public void createIdRequest(Integer userId, Integer gameId, String username, Integer amount, HttpSession session) throws GameException, UserException, MessagingException {
		Game game= fetchGameById(gameId);
		
		if(userId==null) {
			throw new UserException("Invalid User!, please login");
		}
		else {
				User user = userService.fetchProfile(userId);
				Wallet wallet = user.getWallet();
				Integer balance = wallet.getBalance();
				
				if(amount>=game.getMinimumBet() && amount<=balance) {
					balance = balance-amount;
					
					wallet.setBalance(balance);
					user.setWallet(wallet);
					session.setAttribute("balance", balance);

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
					
					myIdService.saveMyId(myId);
					accountRequest= accountRequestService.takeRequestToCreateAccount(accountRequest);
					userService.saveUserDetail(user);
					
					String subject = "Your service request number is "+ accountRequest.getId();
					String message = "Your service request number is "+ accountRequest.getId()+".\nIt will be process within 2 days.";
					
					emailService.sendCustomMessage(user.getEmail(), subject, message, user);
					
					//send the message to admin
				}
				else {
					throw new GameException("Invalid Amount, Please enter valid amount");
				}
		}	
	}

}
