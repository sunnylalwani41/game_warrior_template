package com.gamewarrior.Game.Warrior.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.MyId;

@Repository
public interface MyIdRepo extends JpaRepository<MyId, Integer>{
	public List<MyId> findByUserId(Integer userId);
}
