package com.gamewarrior.Game.Warrior.dao;

import com.gamewarrior.Game.Warrior.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepo extends JpaRepository<User, Integer> {
    public User findByEmail(String email);
}
