package com.gamewarrior.Game.Warrior.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.dto.Status;
import com.gamewarrior.Game.Warrior.model.WithdrawRequest;

@Repository
public interface WithdrawRequestRepo extends JpaRepository<WithdrawRequest, Integer>{
	public List<WithdrawRequest> findByUserIdAndStatus(Integer userId, Status status);
}
