package com.gamewarrior.Game.Warrior.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.AccountRequest;

@Repository
public interface AccountRequestRepo extends JpaRepository<AccountRequest, Integer>{

}
