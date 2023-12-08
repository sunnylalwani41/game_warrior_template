package com.gamewarrior.Game.Warrior.service;

import com.gamewarrior.Game.Warrior.dao.UserRepo;
import com.gamewarrior.Game.Warrior.exception.OtpException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.time.LocalDateTime;

@Service
public class AuthenticationServiceImpl implements AuthenticationService{
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private Email email;

    @Override
    public User saveUserDetail(User user, HttpSession session) throws UserException, MessagingException {
        User user1 = userRepo.findByEmail(user.getEmail());

        if(user1 !=null && user1.isVerify() ){
            throw new UserException("User already registered! You can login or use another emailId");
        }
        String otp= this.email.sendOtpEmail(user.getEmail());

        if(user1!= null){
            user.setId(user1.getId());
        }
        user.setOtp(otp);
        user.setTimestamp(LocalDateTime.now());
        session.setAttribute("email", user.getEmail());

        return userRepo.save(user);
    }

    @Override
    public boolean verifyOtpValue(String otp, HttpSession session) throws OtpException, UserException, MessagingException {
        String userEmail = (String)session.getAttribute("email");




        if(userEmail==null){
            throw new UserException("Unauthorized User!!");
        }
        User user = userRepo.findByEmail(userEmail);

        if(user.getOtp().equals(otp) && !isExpireOtp(user.getTimestamp())){
            user.setVerify(true);
            userRepo.save(user);
            session.removeAttribute("email");
            session.invalidate();
            email.sendGreetingEmail(user.getEmail());

            return true;
        }
        throw new OtpException("Invalid Otp or expire the otp");
    }

    private boolean isExpireOtp(LocalDateTime timestamp){
        return LocalDateTime.now().isAfter(timestamp.plusMinutes(10));
    }
}
