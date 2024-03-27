package com.gamewarrior.Game.Warrior.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gamewarrior.Game.Warrior.model.Referral;

@Repository
public interface ReferralRepo extends JpaRepository<Referral, Integer> {
	public Referral findByReferralUserId(Integer referralUserId);
}
