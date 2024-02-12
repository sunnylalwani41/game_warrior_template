package com.gamewarrior.Game.Warrior.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.BankingTransaction;

@Repository
public interface TransactionRepo extends JpaRepository<BankingTransaction, Integer>{
	public List<BankingTransaction> findByUserId(Integer userId);
}
