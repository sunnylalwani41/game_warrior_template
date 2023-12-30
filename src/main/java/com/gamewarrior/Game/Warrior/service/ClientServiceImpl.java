package com.gamewarrior.Game.Warrior.service;

import java.util.ResourceBundle;

import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.model.Client;

@Service
public class ClientServiceImpl implements ClientService{

	@Override
	public void connectToServer() {
		ResourceBundle resourceBundle = ResourceBundle.getBundle("application");
		String ip = resourceBundle.getString("chat.ipaddress");
		Integer port = Integer.parseInt(resourceBundle.getString("chat.port"));
		
		Client client = new Client(ip, port);
	}
}
// There is one bug When Close the client, after it server writing thread still running or vise varsa.
//So its solution may be apply multithreading concept, so that one thread close, so automatically another thread should be close.