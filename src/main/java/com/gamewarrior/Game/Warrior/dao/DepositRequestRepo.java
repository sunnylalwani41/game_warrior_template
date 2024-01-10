package com.gamewarrior.Game.Warrior.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.DepositRequest;

@Repository
public interface DepositRequestRepo extends JpaRepository<DepositRequest, Integer>{

}
