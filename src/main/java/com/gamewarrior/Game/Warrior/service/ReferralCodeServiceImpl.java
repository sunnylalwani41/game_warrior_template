package com.gamewarrior.Game.Warrior.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamewarrior.Game.Warrior.dao.ReferralRepo;
import com.gamewarrior.Game.Warrior.dao.UserRepo;
import com.gamewarrior.Game.Warrior.exception.ReferralException;
import com.gamewarrior.Game.Warrior.model.Referral;
import com.gamewarrior.Game.Warrior.model.User;

@Service
public class ReferralCodeServiceImpl implements ReferralCodeService{
	@Autowired
	private UserService userService;
	@Autowired
	private ReferralRepo referralRepo;

	@Override
	public boolean saveReferral(Integer referralUserId, String referralCode) throws ReferralException {
		Referral referral = new Referral();
		
		referral.setReferralUserId(referralUserId);
		
		try {
			User user = userService.findUserByReferralCode(referralCode);
			
			referral.setReferrerUserId(user.getId());
			
			Referral alreadyReferral = findReferralByReferralUserId(referralUserId);
			
			if(alreadyReferral!=null)
				referral.setId(alreadyReferral.getId());
			
			referralRepo.save(referral);
			
			return true;
		}
		catch (Exception exception){
			throw new ReferralException(exception.getMessage());
		}
	}

	@Override
	public Referral findReferralByReferralUserId(Integer referralUserId) {
		return referralRepo.findByReferralUserId(referralUserId);
	}
	
}
