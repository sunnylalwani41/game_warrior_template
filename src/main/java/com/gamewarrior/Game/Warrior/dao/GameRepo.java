package com.gamewarrior.Game.Warrior.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.Game;

@Repository
public interface GameRepo extends JpaRepository<Game, Integer>{
	@Query("Select g from Game g left join fetch g.gameName where g.id= :gameId")
	public Game findByIdWithGameName(@Param("gameId") Integer id);
}
