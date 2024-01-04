package com.gamewarrior.Game.Warrior.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.Admin;

@Repository
public interface AdminRepo extends JpaRepository<Admin, Integer>{
	public Admin findByUsername(String username);
}
