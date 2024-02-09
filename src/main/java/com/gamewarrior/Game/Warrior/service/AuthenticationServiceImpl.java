package com.gamewarrior.Game.Warrior.service;

import com.gamewarrior.Game.Warrior.configure.SecurityConfig;
import com.gamewarrior.Game.Warrior.dao.UserRepo;
import com.gamewarrior.Game.Warrior.dao.WalletRepo;
import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Notification;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.Wallet;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.util.Map;

@Service
public class AuthenticationServiceImpl implements AuthenticationService{
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private SecurityConfig securityConfig;
    @Autowired
    private EmailService emailService;

    @Override
    public User saveUserDetail(User user, HttpSession session) throws UserException, MessagingException {
        User user1 = userRepo.findByEmail(user.getEmail());

        if(user1 !=null && user1.isVerify() ){
            throw new UserException("User already registered! You can login or use another email id");
        }
       
        String otp= this.emailService.sendOtpEmail(user.getEmail());
        
        if(user1!= null){
            user.setId(user1.getId());
            
            user.setNotifications(user1.getNotifications());
            user.setWallet(user1.getWallet());
        }
        user.setOtp(otp);
        user.setTimestamp(LocalDateTime.now());
        
        user= userRepo.save(user);
        
    	if(user.getWallet()==null) {
    		
    		Wallet wallet = new Wallet();
            Notification notification = new Notification();
            
            wallet.setBalance(0);
            wallet.setUserId(user.getId());
            
            notification.setSubject("Validation Otp");
            notification.setMessage("OTP has been sent to email "+user.getEmail());
            notification.setUserId(user.getId());
            
            user.getNotifications().add(notification);
            user.setWallet(wallet);
            
            user = userRepo.save(user);
    	}
        return user;
    }

    @Override
    public String verifyOtpValue(String otp, HttpSession session) throws OtpException, UserException, MessagingException {
        String userEmail = (String)session.getAttribute("email");

        if(userEmail==null){
            throw new UserException("Unauthorized User!!");
        }
        User user = userRepo.findByEmail(userEmail);

        if(user==null)
            throw new UserException("Unauthorized User!!");

        if(user.getOtp().equals(otp) && !isExpireOtp(user.getTimestamp())){
            user.setVerify(true);
            
            session.removeAttribute("email");
            
            emailService.sendGreetingEmail(user);
            
            userRepo.save(user);
            
            return otp;
        }
        throw new OtpException("Invalid Otp or expire the otp");
    }

    @Override
    public User matchUserCrediential(String email, String password, HttpSession session) throws UserException, NoSuchAlgorithmException {
        User user = userRepo.findByEmail(email);
        
        if(user==null || !user.isVerify())
            throw new UserException("Invalid User");
        
        if(securityConfig.checkPassword(password, user.getPassword())){
            session.setAttribute("userId", user.getId());
            session.setAttribute("balance", user.getWallet().getBalance());
            return user;
        }

        throw new UserException("Email or password is wrong!");
    }

    private boolean isExpireOtp(LocalDateTime timestamp){
        return LocalDateTime.now().isAfter(timestamp.plusMinutes(10));
    }

	@Override
	public String verifyForgetOtpValue(String otp, HttpSession session)
			throws OtpException, UserException, MessagingException {
		String userEmail = (String)session.getAttribute("forgotemail");

        if(userEmail==null){
            throw new UserException("Unauthorized User!!");
        }
        User user = userRepo.findByEmail(userEmail);

        if(user==null)
            throw new UserException("Unauthorized User!!");

        if(user.getOtp().equals(otp) && !isExpireOtp(user.getTimestamp())){
        	session.setAttribute("verifiedOtp", "otp");
        	
            return otp;
        }
        throw new OtpException("Invalid Otp or expire the otp");
	}
}
