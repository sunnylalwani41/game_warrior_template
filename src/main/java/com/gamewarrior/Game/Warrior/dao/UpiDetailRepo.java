package com.gamewarrior.Game.Warrior.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.UpiDetail;

@Repository
public interface UpiDetailRepo extends JpaRepository<UpiDetail, Integer>{
	public UpiDetail findByUpiId(String upiId);
}
