package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gamewarrior.Game.Warrior.exception.GameException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Game;
import com.gamewarrior.Game.Warrior.model.MyId;
import com.gamewarrior.Game.Warrior.service.GameService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class GameController {
	@Autowired
	private GameService gameService;
	
	@GetMapping("/fetchIdDetails")
	public void fetchIdDetailsHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		
		session.setAttribute("idDetails", "idDetails");
		
		try {
			List<Game> games = gameService.fetchAllGames();
			System.out.println(games);
			List<MyId> myIds =  gameService.fetchMyIds(session);
			
			session.setAttribute("games", games);
			session.setAttribute("myIds", myIds);
		}
		catch(UserException userException) {
			session.setAttribute("errorMessage", "Invalid User! please login");

		}
		response.sendRedirect("ids");
	}
	
	@PostMapping("/fetchGame")
	public String fetchGameDetailHandler(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		Integer userId= (Integer)session.getAttribute("userId");
		
		if(userId==null) {
			session.setAttribute("errorMessage", "Invalid user!! please Login");
			response.sendRedirect("login");
		}
		else {
			Integer gameId= Integer.parseInt(request.getParameter("gameId"));
			
			if(gameId==null) {
				response.sendRedirect("ids");
			}
			else {
				try {
					Game game= gameService.fetchGameById(gameId);
					
					request.setAttribute("game", game);
				}
				catch (Exception exception) {
					session.setAttribute("errorMessage", "Invalid Game");
					response.sendRedirect("ids");
				}
			}
		}
		return "create-id";
	}
	
	@PostMapping("/processCreateId")
	public void processCreateIdRequestHandler(HttpServletRequest request, HttpServletResponse response, @RequestParam Integer gameId, @RequestParam Double amount, @RequestParam String username) throws GameException, IOException, MessagingException {
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		try {
			gameService.createIdRequest(userId, gameId, username, amount, session);
			
			session.setAttribute("message", "Request has been taken. It will be process within 2 days.");
			response.sendRedirect("fetchIdDetails");
		}
		catch(UserException userException) {
			session.setAttribute("errorMessage", userException.getMessage());
			response.sendRedirect("login");
		}
		catch(GameException gameException) {
			session.setAttribute("errorMessage", gameException.getMessage());
			response.sendRedirect("ids");
		}
		catch(Exception exception) {
			session.setAttribute("errorMessage", exception.getMessage());
			response.sendRedirect("ids");
		}
	}
}
