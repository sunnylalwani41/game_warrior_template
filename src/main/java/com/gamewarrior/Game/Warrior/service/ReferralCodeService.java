package com.gamewarrior.Game.Warrior.service;

import com.gamewarrior.Game.Warrior.exception.ReferralException;
import com.gamewarrior.Game.Warrior.model.Referral;

public interface ReferralCodeService {
	public boolean saveReferral(Integer referralUserId, String referralCode) throws ReferralException;
	
	public Referral findReferralByReferralUserId(Integer referralUserId);
}
